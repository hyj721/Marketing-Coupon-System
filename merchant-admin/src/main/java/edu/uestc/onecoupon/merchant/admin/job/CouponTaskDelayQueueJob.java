package edu.uestc.onecoupon.merchant.admin.job;

import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson2.JSONObject;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTaskDO;
import edu.uestc.onecoupon.merchant.admin.dao.mapper.CouponTaskMapper;
import edu.uestc.onecoupon.merchant.admin.service.CouponTaskService;
import edu.uestc.onecoupon.merchant.admin.service.excel.RowCountListener;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBlockingDeque;
import org.redisson.api.RedissonClient;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Slf4j
@Component
@RequiredArgsConstructor
public class CouponTaskDelayQueueJob {

    private final RedissonClient redissonClient;
    private final CouponTaskMapper couponTaskMapper;

    private static final String QUEUE_NAME = "COUPON_TASK_SEND_NUM_DELAY_QUEUE";


    @Scheduled(cron = "0/5 * * * * ?")
    public void processCouponTask() {
        try {
            RBlockingDeque<JSONObject> blockingDeque = redissonClient.getBlockingDeque(QUEUE_NAME);
            // poll方法会立即返回，如果队列为空返回null
            JSONObject delayJsonObject = blockingDeque.poll();

            if (delayJsonObject != null) {
                processQueueElement(delayJsonObject);
            }
        } catch (Exception e) {
            log.error("处理优惠券延时队列任务异常", e);
        }
    }

    private void processQueueElement(JSONObject delayJsonObject) {
        try {
            CouponTaskDO couponTaskDO = couponTaskMapper.selectById(delayJsonObject.getLong("id"));
            if (couponTaskDO.getSendNum() == null) {
                log.info("优惠券推送任务发送行数为空，开始补偿,id:{}", delayJsonObject.getLong("id"));
                refreshCouponTaskSendNum(delayJsonObject);
            }

        } catch (Exception e) {
            log.error("处理队列元素异常, element: {}", delayJsonObject, e);
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
