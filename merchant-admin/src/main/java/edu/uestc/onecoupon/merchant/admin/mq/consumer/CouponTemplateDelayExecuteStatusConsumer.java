package edu.uestc.onecoupon.merchant.admin.mq.consumer;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import edu.uestc.onecoupon.merchant.admin.common.enums.CouponTemplateStatusEnum;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTemplateDO;
import edu.uestc.onecoupon.merchant.admin.service.CouponTemplateService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;

/**
 * 利用MQ延时任务，修改优惠券模版状态为已结束
 */
@Component
@RequiredArgsConstructor
@RocketMQMessageListener(
        topic = "one-coupon_merchant-admin-service_coupon-template-delay_topic${unique-name:}",
        consumerGroup = "one-coupon_merchant-admin-service_coupon-template-delay-status_cg${unique-name:}"
)
@Slf4j(topic = "CouponTemplateDelayExecuteStatusConsumer")
public class CouponTemplateDelayExecuteStatusConsumer implements RocketMQListener<JSONObject> {
    private final CouponTemplateService couponTemplateService;

    @Override
    public void onMessage(JSONObject message) {
        log.info("[消费者] 优惠券模板定时执行@变更模板表状态 - 执行消费逻辑，消息体：{}", message.toString());

        // 修改指定优惠券模板状态为已结束
        LambdaUpdateWrapper<CouponTemplateDO> updateWrapper = Wrappers.lambdaUpdate(CouponTemplateDO.class)
                .eq(CouponTemplateDO::getShopNumber, message.getLong("shopNumber"))
                .eq(CouponTemplateDO::getId, message.getLong("id"))
                .set(CouponTemplateDO::getStatus, CouponTemplateStatusEnum.ENDED.getStatus());
        couponTemplateService.update(updateWrapper);
    }
}