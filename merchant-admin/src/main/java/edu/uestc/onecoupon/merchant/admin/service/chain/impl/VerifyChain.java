package edu.uestc.onecoupon.merchant.admin.service.chain.impl;

import cn.hutool.core.util.ObjectUtil;
import edu.uestc.onecoupon.merchant.admin.common.enums.DiscountTargetEnum;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;
import edu.uestc.onecoupon.merchant.admin.service.chain.AbstractLogicChain;
import org.springframework.stereotype.Service;

@Service("rule_verify")
public class VerifyChain extends AbstractLogicChain {
    /**
     * 执行责任链逻辑
     *
     * @param requestParam 责任链执行入参
     */
    @Override
    public void handler(CouponTemplateSaveReqDTO requestParam) {
        if (ObjectUtil.equal(requestParam.getTarget(), DiscountTargetEnum.PRODUCT_SPECIFIC)) {
            // 调用商品中台验证商品是否存在，如果不存在抛出异常
            // ......
        }
    }
}
