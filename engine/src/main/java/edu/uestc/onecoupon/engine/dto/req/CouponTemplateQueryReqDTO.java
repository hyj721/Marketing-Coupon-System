package edu.uestc.onecoupon.engine.dto.req;

import lombok.Data;

@Data
public class CouponTemplateQueryReqDTO {
    private String shopNumber;
    private String couponTemplateId;
}
