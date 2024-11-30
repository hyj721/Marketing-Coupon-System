package edu.uestc.onecoupon.merchant.admin.service.chain.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import edu.uestc.onecoupon.framework.exception.ClientException;
import edu.uestc.onecoupon.merchant.admin.common.enums.DiscountTargetEnum;
import edu.uestc.onecoupon.merchant.admin.common.enums.DiscountTypeEnum;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;
import edu.uestc.onecoupon.merchant.admin.service.chain.AbstractLogicChain;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;

@Service("rule_base")
public class BaseChain extends AbstractLogicChain {
    private final int maxStock = 20000000;

    /**
     * 执行责任链逻辑
     *
     * @param requestParam 责任链执行入参
     */
    public void handler(CouponTemplateSaveReqDTO requestParam) {
        // 判断是商品专属优惠 or 全店通用优惠
        boolean targetAnyMatch = Arrays.stream(DiscountTargetEnum.values())
                .anyMatch(enumConstant -> enumConstant.getType() == requestParam.getTarget());
        if (!targetAnyMatch) {
            throw new ClientException("优惠对象值不存在");
        }
        // 全店通用优惠不能设置具体商品
        if (ObjectUtil.equal(requestParam.getTarget(), DiscountTargetEnum.ALL_STORE_GENERAL)
                && StrUtil.isNotEmpty(requestParam.getGoods())) {
            throw new ClientException("优惠券全店通用不可设置指定商品");
        }
        // 商品专属优惠必须设置商品
        if (ObjectUtil.equal(requestParam.getTarget(), DiscountTargetEnum.PRODUCT_SPECIFIC)
                && StrUtil.isEmpty(requestParam.getGoods())) {
            throw new ClientException("优惠券商品专属未设置指定商品");
        }

        // 优惠券类型，立减，满减，折扣
        boolean typeAnyMatch = Arrays.stream(DiscountTypeEnum.values())
                .anyMatch(enumConstant -> enumConstant.getType() == requestParam.getType());
        if (!typeAnyMatch) {
            throw new ClientException("优惠类型不存在");
        }

        Date now = new Date();
        if (requestParam.getValidStartTime().before(now)) {
            throw new ClientException("有效期开始时间不能早于当前时间");
        }

        if (requestParam.getStock() <= 0 || requestParam.getStock() > maxStock) {
            throw new ClientException("库存数量设置异常");
        }

        if (!JSON.isValid(requestParam.getReceiveRule())) {
            throw new ClientException("领取规则格式错误");
        }
        if (!JSON.isValid(requestParam.getConsumeRule())) {
            throw new ClientException("消耗规则格式错误");
        }
    }
}
