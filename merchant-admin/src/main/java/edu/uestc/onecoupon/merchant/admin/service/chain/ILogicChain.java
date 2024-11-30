package edu.uestc.onecoupon.merchant.admin.service.chain;

import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;

public interface ILogicChain  extends ILogicChainArmory {

    /**
     * 执行责任链逻辑
     *
     * @param requestParam 责任链执行入参
     */
    void handler(CouponTemplateSaveReqDTO requestParam);
}