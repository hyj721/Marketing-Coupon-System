package edu.uestc.onecoupon.merchant.admin.mq.consumer;

import com.alibaba.fastjson2.JSONObject;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@RocketMQMessageListener(
        topic = "one-coupon_distribution-service_coupon-task-execute_topic${unique-name:}",
        consumerGroup = "one-coupon_merchant-admin-service_coupon-template-task-execute_cg${unique-name:}"
)
@Slf4j(topic = "CouponTemplateDistributionTaskConsumer")
public class CouponTemplateDistributionTaskConsumer implements RocketMQListener<Long> {
    @Override
    public void onMessage(Long id) {
        log.info("[消费者] 执行优惠券分发任务 - 执行消费逻辑，消息体：{}", id);
    }
}
