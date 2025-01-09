package edu.uestc.onecoupon.merchant.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Snowflake;
import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import edu.uestc.onecoupon.framework.exception.ClientException;
import edu.uestc.onecoupon.merchant.admin.common.context.UserContext;
import edu.uestc.onecoupon.merchant.admin.common.enums.CouponTaskSendTypeEnum;
import edu.uestc.onecoupon.merchant.admin.common.enums.CouponTaskStatusEnum;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTaskDO;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTemplateDO;
import edu.uestc.onecoupon.merchant.admin.dao.mapper.CouponTaskMapper;
import edu.uestc.onecoupon.merchant.admin.dao.mapper.CouponTemplateMapper;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTaskCreateReqDTO;
import edu.uestc.onecoupon.merchant.admin.service.CouponTaskService;
import edu.uestc.onecoupon.merchant.admin.service.excel.RowCountListener;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.MessageConst;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.redisson.api.RBlockingDeque;
import org.redisson.api.RDelayedQueue;
import org.redisson.api.RedissonClient;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class CouponTaskServiceImpl extends ServiceImpl<CouponTaskMapper, CouponTaskDO> implements CouponTaskService {


    private final CouponTemplateMapper couponTemplateMapper;
    private final CouponTaskMapper couponTaskMapper;
    private final Snowflake snowflake;
    private final RedissonClient redissonClient;
    private final ConfigurableEnvironment configurableEnvironment;
    private final RocketMQTemplate rocketMQTemplate;
    /**
     * 拒绝策略使用直接丢弃任务.因为在发送任务时如果遇到发送数量为空，会重新进行统计
     */
    private final ExecutorService executorService = new ThreadPoolExecutor(
            Runtime.getRuntime().availableProcessors(),
            Runtime.getRuntime().availableProcessors() << 1,
            60,
            TimeUnit.SECONDS,
            new SynchronousQueue<>(),
            new ThreadPoolExecutor.DiscardPolicy()
    );

    /**
     * 商家创建优惠券推送任务
     *
     * @param requestParam 请求参数
     */
    @Override
    public void createCouponTask(CouponTaskCreateReqDTO requestParam) {
        // 1、查询推送任务待推送的优惠券
        LambdaQueryWrapper<CouponTemplateDO> lambdaQueryWrapper = Wrappers.lambdaQuery(CouponTemplateDO.class)
                .eq(CouponTemplateDO::getId, requestParam.getCouponTemplateId())
                .eq(CouponTemplateDO::getShopNumber, UserContext.getShopNumber());
        CouponTemplateDO couponTemplateDO = couponTemplateMapper.selectOne(lambdaQueryWrapper);
        if (couponTemplateDO == null) {
            throw new ClientException("优惠券模板不存在");
        }
        // 2、构建优惠券推送任务数据库持久层实体
        CouponTaskDO couponTaskDO = BeanUtil.copyProperties(requestParam, CouponTaskDO.class);
        couponTaskDO.setBatchId(snowflake.nextId());
        couponTaskDO.setOperatorId(Long.parseLong(UserContext.getUserId()));
        couponTaskDO.setShopNumber(UserContext.getShopNumber());
        couponTaskDO.setStatus(
                Objects.equals(requestParam.getSendType(), CouponTaskSendTypeEnum.IMMEDIATE.getType())
                        ? CouponTaskStatusEnum.IN_PROGRESS.getStatus()
                        : CouponTaskStatusEnum.PENDING.getStatus()
        );
        // 先保存，稍后异步统计行数
        couponTaskMapper.insert(couponTaskDO);

        // 异步统计数据，线程池执行统计任务
        JSONObject delayJsonObject = JSONObject
                .of("fileAddress", requestParam.getFileAddress(), "id", couponTaskDO.getId());
        executorService.execute(() -> refreshCouponTaskSendNum(delayJsonObject));
        // 假设刚把消息提交到线程池，突然应用宕机了，我们通过延迟队列进行兜底 Refresh
        RBlockingDeque<Object> blockingDeque = redissonClient.getBlockingDeque("COUPON_TASK_SEND_NUM_DELAY_QUEUE");
        RDelayedQueue<Object> delayedQueue = redissonClient.getDelayedQueue(blockingDeque);
        // 这里延迟时间设置 20 秒，原因是我们笃定上面线程池 20 秒之内就能结束任务
        delayedQueue.offer(delayJsonObject, 20, TimeUnit.SECONDS);

        // 如果是立即发送任务，直接调用消息队列进行发送流程
        if (Objects.equals(requestParam.getSendType(), CouponTaskSendTypeEnum.IMMEDIATE.getType())) {
            String couponTemplateDelayCloseTopic = "one-coupon_distribution-service_coupon-task-execute_topic${unique-name:}";
            // 通过 Spring 上下文解析占位符，也就是把咱们 VM 参数里的 unique-name 替换到字符串中
            couponTemplateDelayCloseTopic = configurableEnvironment.resolvePlaceholders(couponTemplateDelayCloseTopic);
            // 构建消息体
            String messageKeys = UUID.randomUUID().toString();
            Message<Long> message = MessageBuilder
                    .withPayload(couponTaskDO.getId())
                    .setHeader(MessageConst.PROPERTY_KEYS, messageKeys)
                    .build();
            // 执行 RocketMQ5.x 消息队列发送&异常处理逻辑
            SendResult sendResult;
            try {
                sendResult = rocketMQTemplate.syncSend(couponTemplateDelayCloseTopic, message, 2000L);
                log.info("[生产者] 执行优惠券分发任务 - 发送结果：{}，消息ID：{}，消息Keys：{}", sendResult.getSendStatus(), sendResult.getMsgId(), messageKeys);
            } catch (Exception ex) {
                log.error("[生产者] 执行优惠券分发任务 - 消息发送失败，消息体：{}", couponTaskDO.getId(), ex);
            }
        }
    }

    private void refreshCouponTaskSendNum(JSONObject jsonObject) {
        RowCountListener listener = new RowCountListener();
        EasyExcel.read(jsonObject.getString("fileAddress"), listener).sheet().doRead();
        int totalRows = listener.getRowCount();

        // 刷新优惠券推送记录中发送行数
        CouponTaskDO updateCouponTaskDO = CouponTaskDO.builder()
                .id(jsonObject.getLong("id"))
                .sendNum(totalRows)
                .build();
        couponTaskMapper.updateById(updateCouponTaskDO);
    }
}
