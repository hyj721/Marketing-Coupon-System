package edu.uestc.onecoupon.engine.service;

import com.baomidou.mybatisplus.extension.service.IService;
import edu.uestc.onecoupon.engine.dao.entity.CouponTemplateDO;
import edu.uestc.onecoupon.engine.dto.req.CouponTemplateQueryReqDTO;
import edu.uestc.onecoupon.engine.dto.resp.CouponTemplateQueryRespDTO;

public interface CouponTemplateService extends IService<CouponTemplateDO> {

    /**
     * 查询优惠券模板
     *
     * @param requestParam 请求参数
     * @return 优惠券模板信息
     */
    CouponTemplateQueryRespDTO findCouponTemplate(CouponTemplateQueryReqDTO requestParam);
}