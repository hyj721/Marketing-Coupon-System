package edu.uestc.onecoupon.merchant.admin.dao.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@TableName("t_coupon_template_log")
public class CouponTemplateLogDO {

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 优惠券模版日志id
     */
    private Long couponTemplateLogId;

    /**
     * 店铺编号
     */
    private Long shopNumber;

    /**
     * 优惠券模板ID
     */
    private String couponTemplateId;

    /**
     * 操作人
     */
    private String operatorId;

    /**
     * 操作日志
     */
    private String operationLog;

    /**
     * 原始数据
     */
    private String originalData;

    /**
     * 修改后数据
     */
    private String modifiedData;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
}