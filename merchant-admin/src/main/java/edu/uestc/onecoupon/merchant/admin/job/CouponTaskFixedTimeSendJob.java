package edu.uestc.onecoupon.merchant.admin.job;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import edu.uestc.onecoupon.merchant.admin.common.enums.CouponTaskStatusEnum;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTaskDO;
import edu.uestc.onecoupon.merchant.admin.dao.mapper.CouponTaskMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.MessageConst;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Date;
import java.util.UUID;

@Component
@RequiredArgsConstructor
@Slf4j
public class CouponTaskFixedTimeSendJob {

    private final CouponTaskMapper couponTaskMapper;
    private final RocketMQTemplate rocketMQTemplate;
    private final ConfigurableEnvironment configurableEnvironment;

    private static final int MAX_LIMIT = 100;

    @Scheduled(cron = "0/5 * * * * ?")
    public void execute() throws Exception {
        long initId = 0;
        Date now = new Date();

        while (true) {
            // 获取已到执行时间待执行的优惠券定时分发任务
            List<CouponTaskDO> couponTaskDOList = fetchPendingTasks(initId, now);

            if (CollUtil.isEmpty(couponTaskDOList)) {
                break;
            }

            // 调用分发服务对用户发送优惠券
            for (CouponTaskDO each : couponTaskDOList) {
                log.info("开始分发优惠券, 优惠券任务ID: {}", each.getId());
                distributeCoupon(each);
            }

            // 查询出来的数据如果小于 MAX_LIMIT 意味着后面将不再有数据，返回即可
            if (couponTaskDOList.size() < MAX_LIMIT) {
                break;
            }

            // 更新 initId 为当前列表中最大 ID
            initId = couponTaskDOList.stream()
                    .mapToLong(CouponTaskDO::getId)
                    .max()
                    .orElse(initId);
        }
    }

    private void distributeCoupon(CouponTaskDO couponTask) {
        // 修改延时执行推送任务任务状态为执行中
        CouponTaskDO couponTaskDO = CouponTaskDO.builder()
                .id(couponTask.getId())
                .status(CouponTaskStatusEnum.IN_PROGRESS.getStatus())
                .build();
        couponTaskMapper.updateById(couponTaskDO);
        // 通过消息队列发送消息，由分发服务消费者消费该消息
        String couponTemplateDelayCloseTopic = "one-coupon_distribution-service_coupon-task-execute_topic${unique-name:}";
        couponTemplateDelayCloseTopic = configurableEnvironment.resolvePlaceholders(couponTemplateDelayCloseTopic);
        // 构建消息体
        String messageKeys = UUID.randomUUID().toString();
        Message<Long> message = MessageBuilder
                .withPayload(couponTaskDO.getId())
                .setHeader(MessageConst.PROPERTY_KEYS, messageKeys)
                .build();
        SendResult sendResult;
        try {
            sendResult = rocketMQTemplate.syncSend(couponTemplateDelayCloseTopic, message, 2000L);
            log.info("[生产者] 执行优惠券分发任务 - 发送结果：{}，消息ID：{}，消息Keys：{}", sendResult.getSendStatus(), sendResult.getMsgId(), messageKeys);
        } catch (Exception ex) {
            log.error("[生产者] 执行优惠券分发任务 - 消息发送失败，消息体：{}", couponTaskDO.getId(), ex);
        }
    }

    private List<CouponTaskDO> fetchPendingTasks(long initId, Date now) {
        // 获取待执行的任务列表
        LambdaQueryWrapper<CouponTaskDO> queryWrapper = Wrappers.lambdaQuery(CouponTaskDO.class)
                .eq(CouponTaskDO::getStatus, CouponTaskStatusEnum.PENDING.getStatus())
                .le(CouponTaskDO::getSendTime, now)
                .gt(CouponTaskDO::getId, initId)
                .last("LIMIT " + MAX_LIMIT);
        return couponTaskMapper.selectList(queryWrapper);
    }
}