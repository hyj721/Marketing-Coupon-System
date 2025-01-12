package edu.uestc.onecoupon.engine.controller;

import edu.uestc.onecoupon.engine.dto.req.CouponTemplateQueryReqDTO;
import edu.uestc.onecoupon.engine.dto.resp.CouponTemplateQueryRespDTO;
import edu.uestc.onecoupon.engine.service.CouponTemplateService;
import edu.uestc.onecoupon.framework.result.Result;
import edu.uestc.onecoupon.framework.web.Results;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class CouponTemplateController {

    private final CouponTemplateService couponTemplateService;

    @GetMapping("/api/engine/coupon-template/query")
    public Result<CouponTemplateQueryRespDTO> findCouponTemplate(CouponTemplateQueryReqDTO requestParam) {
        return Results.success(couponTemplateService.findCouponTemplate(requestParam));
    }
}