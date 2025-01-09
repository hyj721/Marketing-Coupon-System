package edu.uestc.onecoupon.merchant.admin.service.chain.factory;

import edu.uestc.onecoupon.merchant.admin.service.chain.ILogicChain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class DefaultChainFactory {

    private final Map<String, ILogicChain> logicChainGroup;

    public ILogicChain openLogicChain() {
        String[] defaultRuleModelsList = {LogicModel.RULE_BASE.code, LogicModel.RULE_NOT_NULL.code, LogicModel.RULE_VERIFY.code};
        ILogicChain logicChain = logicChainGroup.get(defaultRuleModelsList[0]);
        ILogicChain current = logicChain;
        for (int i = 1; i < defaultRuleModelsList.length; i++) {
            ILogicChain nextChain = logicChainGroup.get(defaultRuleModelsList[i]);
            current.appendNext(nextChain);
            current = current.next();
        }
        return logicChain;
    }

    @Getter
    @AllArgsConstructor
    public enum LogicModel {

        RULE_BASE("rule_base", "基础检查"),
        RULE_NOT_NULL("rule_not_null", "非空检查"),
        RULE_VERIFY("rule_verify", "验证检查"),
        ;

        private final String code;
        private final String info;

    }
}
