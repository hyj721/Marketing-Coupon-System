package edu.uestc.onecoupon.merchant.admin.dto.req;

import lombok.Data;

/**
 * 优惠券模板增加发行量请求参数实体
 */
@Data
public class CouponTemplateNumberReqDTO {

    /**
     * 优惠券模板id
     */
    private Long couponTemplateId;

    /**
     * 增加发行数量
     */
    private Integer number;
}