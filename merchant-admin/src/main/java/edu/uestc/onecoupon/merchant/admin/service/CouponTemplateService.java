package edu.uestc.onecoupon.merchant.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTemplateDO;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateNumberReqDTO;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplatePageQueryReqDTO;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;
import edu.uestc.onecoupon.merchant.admin.dto.resp.CouponTemplatePageQueryRespDTO;
import edu.uestc.onecoupon.merchant.admin.dto.resp.CouponTemplateQueryRespDTO;

public interface CouponTemplateService extends IService<CouponTemplateDO> {

    /**
     * 创建商家优惠券模板
     *
     * @param requestParam 请求参数
     */
    void createCouponTemplate(CouponTemplateSaveReqDTO requestParam);

    /**
     * 分页查询商家优惠券模板
     *
     * @param requestParam 请求参数
     * @return 商家优惠券模板分页数据
     */
    IPage<CouponTemplatePageQueryRespDTO> pageQueryCouponTemplate(CouponTemplatePageQueryReqDTO requestParam);

    /**
     * 查询优惠券模板详情
     * 后管接口并不存在并发，直接查询数据库即可
     *
     * @param couponTemplateId 优惠券模板 ID
     * @return 优惠券模板详情
     */
    CouponTemplateQueryRespDTO findCouponTemplateById(Long couponTemplateId);

    /**
     * 结束优惠券模板
     *
     * @param couponTemplateId 优惠券模板 ID
     */
    void terminateCouponTemplate(Long couponTemplateId);

    /**
     * 增加优惠券模板发行量
     *
     * @param requestParam 请求参数
     */
    void increaseNumberCouponTemplate(CouponTemplateNumberReqDTO requestParam);

}