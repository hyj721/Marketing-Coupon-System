package edu.uestc.onecoupon.merchant.admin.controller;

import edu.uestc.onecoupon.framework.idempotent.NoDuplicateSubmit;
import edu.uestc.onecoupon.framework.result.Result;
import edu.uestc.onecoupon.framework.web.Results;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;
import edu.uestc.onecoupon.merchant.admin.service.CouponTemplateService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class CouponTemplateController {

    private final CouponTemplateService couponTemplateService;

    @PostMapping("/api/merchant-admin/coupon-template/create")
    @NoDuplicateSubmit
    public Result<Void> createCouponTemplate(@RequestBody CouponTemplateSaveReqDTO requestParam) {
        couponTemplateService.createCouponTemplate(requestParam);
        return Results.success();
    }
}