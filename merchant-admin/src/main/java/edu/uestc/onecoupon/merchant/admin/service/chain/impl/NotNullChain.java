package edu.uestc.onecoupon.merchant.admin.service.chain.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import edu.uestc.onecoupon.framework.exception.ClientException;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTemplateSaveReqDTO;
import edu.uestc.onecoupon.merchant.admin.service.chain.AbstractLogicChain;
import org.springframework.stereotype.Service;

@Service("rule_not_null")
public class NotNullChain extends AbstractLogicChain {


    /**
     * 执行责任链逻辑
     *
     * @param requestParam 责任链执行入参
     */
    @Override
    public void handler(CouponTemplateSaveReqDTO requestParam) {
        if (StrUtil.isEmpty(requestParam.getName())) {
            throw new ClientException("优惠券名称不能为空");
        }

        if (ObjectUtil.isEmpty(requestParam.getSource())) {
            throw new ClientException("优惠券来源不能为空");
        }

        if (ObjectUtil.isEmpty(requestParam.getTarget())) {
            throw new ClientException("优惠对象不能为空");
        }

        if (ObjectUtil.isEmpty(requestParam.getType())) {
            throw new ClientException("优惠类型不能为空");
        }

        if (ObjectUtil.isEmpty(requestParam.getValidStartTime())) {
            throw new ClientException("有效期开始时间不能为空");
        }

        if (ObjectUtil.isEmpty(requestParam.getValidEndTime())) {
            throw new ClientException("有效期结束时间不能为空");
        }

        if (ObjectUtil.isEmpty(requestParam.getStock())) {
            throw new ClientException("库存不能为空");
        }

        if (StrUtil.isEmpty(requestParam.getReceiveRule())) {
            throw new ClientException("领取规则不能为空");
        }

        if (StrUtil.isEmpty(requestParam.getConsumeRule())) {
            throw new ClientException("消耗规则不能为空");
        }
    }
}
