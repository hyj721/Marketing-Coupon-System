package edu.uestc.onecoupon.merchant.admin.service.chain;

public interface ILogicChainArmory {
    /**
     * @return 当前节点的下一个节点
     */
    ILogicChain next();

    /**
     * @param next 要添加的下一个节点
     * @return 下一个节点
     */
    ILogicChain appendNext(ILogicChain next);
}
