package edu.uestc.onecoupon.merchant.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.RandomUtil;
import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import edu.uestc.onecoupon.framework.exception.ClientException;
import edu.uestc.onecoupon.merchant.admin.common.context.UserContext;
import edu.uestc.onecoupon.merchant.admin.common.enums.CouponTaskSendTypeEnum;
import edu.uestc.onecoupon.merchant.admin.common.enums.CouponTaskStatusEnum;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTaskDO;
import edu.uestc.onecoupon.merchant.admin.dao.entity.CouponTemplateDO;
import edu.uestc.onecoupon.merchant.admin.dao.mapper.CouponTaskMapper;
import edu.uestc.onecoupon.merchant.admin.dao.mapper.CouponTemplateMapper;
import edu.uestc.onecoupon.merchant.admin.dto.req.CouponTaskCreateReqDTO;
import edu.uestc.onecoupon.merchant.admin.service.CouponTaskService;
import edu.uestc.onecoupon.merchant.admin.service.excel.RowCountListener;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class CouponTaskServiceImpl extends ServiceImpl<CouponTaskMapper, CouponTaskDO> implements CouponTaskService {


    private final CouponTemplateMapper couponTemplateMapper;
    private final CouponTaskMapper couponTaskMapper;
    private final Snowflake snowflake;

    /**
     * 商家创建优惠券推送任务
     *
     * @param requestParam 请求参数
     */
    @Override
    public void createCouponTask(CouponTaskCreateReqDTO requestParam) {
        // 1、查询推送任务待推送的优惠券
        LambdaQueryWrapper<CouponTemplateDO> lambdaQueryWrapper = Wrappers.lambdaQuery(CouponTemplateDO.class)
                .eq(CouponTemplateDO::getCouponTemplateId, requestParam.getCouponTemplateId())
                .eq(CouponTemplateDO::getShopNumber, UserContext.getShopNumber());
        CouponTemplateDO couponTemplateDO = couponTemplateMapper.selectOne(lambdaQueryWrapper);
        if (couponTemplateDO == null) {
            throw new ClientException("优惠券模板不存在");
        }
        // 2、构建优惠券推送任务数据库持久层实体
        CouponTaskDO couponTaskDO = BeanUtil.copyProperties(requestParam, CouponTaskDO.class);
        couponTaskDO.setCouponTaskId(Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + RandomUtil.randomNumbers(2)));
        couponTaskDO.setBatchId(snowflake.nextId());
        couponTaskDO.setOperatorId(Long.parseLong(UserContext.getUserId()));
        couponTaskDO.setShopNumber(UserContext.getShopNumber());
        couponTaskDO.setStatus(
                Objects.equals(requestParam.getSendType(), CouponTaskSendTypeEnum.IMMEDIATE.getType())
                        ? CouponTaskStatusEnum.IN_PROGRESS.getStatus()
                        : CouponTaskStatusEnum.PENDING.getStatus()
        );

        // 3、通过easyexcel统计数量
        RowCountListener rowCountListener = new RowCountListener();
        EasyExcel.read(requestParam.getFileAddress(), rowCountListener).sheet().doRead();

        // 4、设置行数
        int rowCount = rowCountListener.getRowCount();
        couponTaskDO.setSendNum(rowCount);

        // 5、插入任务
        couponTaskMapper.insert(couponTaskDO);
    }
}
