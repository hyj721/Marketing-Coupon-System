package edu.uestc.onecoupon.merchant.admin.service.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import lombok.Getter;

public class RowCountListener extends AnalysisEventListener<Object> {

    @Getter
    private int rowCount = 0;

    @Override
    public void invoke(Object o, AnalysisContext analysisContext) {
        rowCount++;
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        return;
    }
}
