package edu.uestc.onecoupon.merchant.admin.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.uestc.onecoupon.framework.idempotent.NoDuplicateSubmit;
import edu.uestc.onecoupon.framework.result.Result;
import edu.uestc.onecoupon.framework.web.Results;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateNumberReqDTO;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplatePageQueryReqDTO;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;
import edu.uestc.onecoupon.merchant.admin.dto.resp.CouponTemplatePageQueryRespDTO;
import edu.uestc.onecoupon.merchant.admin.dto.resp.CouponTemplateQueryRespDTO;
import edu.uestc.onecoupon.merchant.admin.service.CouponTemplateService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/api/merchant-admin/coupon-template/page")
    public Result<IPage<CouponTemplatePageQueryRespDTO>> pageQueryCouponTemplate(@RequestBody CouponTemplatePageQueryReqDTO requestParam) {
        return Results.success(couponTemplateService.pageQueryCouponTemplate(requestParam));
    }

    @GetMapping("/api/merchant-admin/coupon-template/find")
    public Result<CouponTemplateQueryRespDTO> findCouponTemplate(Long couponTemplateId) {
        return Results.success(couponTemplateService.findCouponTemplateById(couponTemplateId));
    }

    @NoDuplicateSubmit(message = "请勿短时间内重复增加优惠券发行量")
    @PostMapping("/api/merchant-admin/coupon-template/increase-number")
    public Result<Void> increaseNumberCouponTemplate(@RequestBody CouponTemplateNumberReqDTO requestParam) {
        couponTemplateService.increaseNumberCouponTemplate(requestParam);
        return Results.success();
    }

    @PostMapping("/api/merchant-admin/coupon-template/terminate")
    public Result<Void> terminateCouponTemplate(Long couponTemplateId) {
        couponTemplateService.terminateCouponTemplate(couponTemplateId);
        return Results.success();
    }
}