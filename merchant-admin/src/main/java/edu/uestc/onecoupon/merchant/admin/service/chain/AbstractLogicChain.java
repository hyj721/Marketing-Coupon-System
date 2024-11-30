package edu.uestc.onecoupon.merchant.admin.service.chain;

public abstract class AbstractLogicChain implements ILogicChain {

    /**
     * 类似于链表的下一个节点
     */
    private ILogicChain next;
    

    @Override
    public ILogicChain next() {
        return this.next;
    }

    @Override
    public ILogicChain appendNext(ILogicChain next) {
        this.next = next;
        return next;
    }
}