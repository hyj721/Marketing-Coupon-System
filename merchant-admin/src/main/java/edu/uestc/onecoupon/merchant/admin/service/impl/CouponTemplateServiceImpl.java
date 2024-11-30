package edu.uestc.onecoupon.merchant.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mzt.logapi.context.LogRecordContext;
import com.mzt.logapi.starter.annotation.LogRecord;
import edu.uestc.onecoupon.merchant.admin.common.constant.MerchantAdminRedisConstant;
import edu.uestc.onecoupon.merchant.admin.common.context.UserContext;
import edu.uestc.onecoupon.merchant.admin.common.enums.CouponTemplateStatusEnum;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTemplateDO;
import edu.uestc.onecoupon.merchant.admin.dao.mapper.CouponTemplateMapper;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;
import edu.uestc.onecoupon.merchant.admin.dto.resp.CouponTemplateQueryRespDTO;
import edu.uestc.onecoupon.merchant.admin.service.CouponTemplateService;
import edu.uestc.onecoupon.merchant.admin.service.chain.ILogicChain;
import edu.uestc.onecoupon.merchant.admin.service.chain.factory.DefaultChainFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CouponTemplateServiceImpl extends ServiceImpl<CouponTemplateMapper, CouponTemplateDO> implements CouponTemplateService {

    private final CouponTemplateMapper couponTemplateMapper;
    private final StringRedisTemplate stringRedisTemplate;
    private final DefaultChainFactory defaultChainFactory;
    private final Snowflake snowflake;

    /**
     * 创建商家优惠券模板
     *
     * @param requestParam 请求参数
     */
    @LogRecord(
            success = """
                    创建优惠券名称：{{#requestParam.name}}， \
                    优惠对象：{COMMON_ENUM_PARSE{'DiscountTargetEnum' + '_' + #requestParam.target}}， \
                    优惠类型：{COMMON_ENUM_PARSE{'DiscountTypeEnum' + '_' + #requestParam.type}}， \
                    库存数量：{{#requestParam.stock}}， \
                    优惠商品编码：{{#requestParam.goods}}， \
                    有效期开始时间：{{#requestParam.validStartTime}}， \
                    有效期结束时间：{{#requestParam.validEndTime}}， \
                    领取规则：{{#requestParam.receiveRule}}， \
                    消耗规则：{{#requestParam.consumeRule}};
                    """,
            type = "CouponTemplate", // 操作日志的类型，比如：订单类型、商品类型。
            bizNo = "{{#bizNo}}", // 日志绑定的业务标识，需要是我们优惠券模板的 ID，但是目前拿不到，放一个占位符。
            extra = "{{#requestParam.toString()}}" // 日志的额外信息
    )
    @Override
    public void createCouponTemplate(CouponTemplateSaveReqDTO requestParam) {
        // 1、基于责任链验证请求参数是否正确
        ILogicChain chain = defaultChainFactory.openLogicChain();
        while (chain != null) {
            chain.handler(requestParam);
            chain = chain.next();
        }

        // 2、保存优惠券模板到数据库
        CouponTemplateDO couponTemplateDO = BeanUtil.toBean(requestParam, CouponTemplateDO.class);
        couponTemplateDO.setCouponTemplateId(snowflake.nextId());
        couponTemplateDO.setStatus(CouponTemplateStatusEnum.ACTIVE.getStatus());
        couponTemplateDO.setShopNumber(UserContext.getShopNumber());
        couponTemplateMapper.insert(couponTemplateDO);
        // 因为模板 ID 是运行中生成的，@LogRecord 默认拿不到，所以我们需要手动设置
        LogRecordContext.putVariable("bizNo", couponTemplateDO.getId());

        // 3、缓存预热，将数据序列为json存储到redis
        CouponTemplateQueryRespDTO respDTO = BeanUtil.toBean(couponTemplateDO, CouponTemplateQueryRespDTO.class);
        Map<String, Object> cacheTargetMap = BeanUtil.beanToMap(respDTO, false, true);
        Map<String, String> actualTargetMap = new HashMap<>();
        for (Map.Entry<String, Object> entry : cacheTargetMap.entrySet()) {
            actualTargetMap.put(entry.getKey(), entry.getValue() != null ? entry.getValue().toString() : "");
        }
        String couponTemplateCacheKey = String.format(MerchantAdminRedisConstant.COUPON_TEMPLATE_KEY, couponTemplateDO.getId());
        stringRedisTemplate.opsForHash().putAll(couponTemplateCacheKey, actualTargetMap);
        // 4、设置缓存的过期时间
        stringRedisTemplate.expireAt(couponTemplateCacheKey, couponTemplateDO.getValidEndTime());
    }
}
