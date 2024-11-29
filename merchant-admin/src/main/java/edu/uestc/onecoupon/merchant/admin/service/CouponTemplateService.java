package edu.uestc.onecoupon.merchant.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTemplateDO;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;

public interface CouponTemplateService extends IService<CouponTemplateDO> {

    /**
     * 创建商家优惠券模板
     *
     * @param requestParam 请求参数
     */
    void createCouponTemplate(CouponTemplateSaveReqDTO requestParam);
}