package edu.uestc.onecoupon.merchant.admin.controller;

import edu.uestc.onecoupon.framework.idempotent.NoDuplicateSubmit;
import edu.uestc.onecoupon.framework.result.Result;
import edu.uestc.onecoupon.framework.web.Results;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTaskCreateReqDTO;
import edu.uestc.onecoupon.merchant.admin.service.CouponTaskService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 优惠券推送任务控制层
 * <p>
 * 作者：马丁
 * 加项目群：早加入就是优势！500人内部项目群，分享的知识总有你需要的 <a href="https://t.zsxq.com/cw7b9" />
 * 开发时间：2024-07-09
 */
@RestController
@RequiredArgsConstructor
public class CouponTaskController {

    private final CouponTaskService couponTaskService;

    @NoDuplicateSubmit(message = "请勿短时间内重复提交优惠券推送任务")
    @PostMapping("/api/merchant-admin/coupon-task/create")
    public Result<Void> createCouponTask(@RequestBody CouponTaskCreateReqDTO requestParam) {
        couponTaskService.createCouponTask(requestParam);
        return Results.success();
    }
}
