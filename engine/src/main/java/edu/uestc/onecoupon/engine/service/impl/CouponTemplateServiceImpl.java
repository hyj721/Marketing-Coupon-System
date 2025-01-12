package edu.uestc.onecoupon.engine.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import edu.uestc.onecoupon.engine.common.constant.EngineRedisConstant;
import edu.uestc.onecoupon.engine.common.context.UserContext;
import edu.uestc.onecoupon.engine.common.enums.CouponTemplateStatusEnum;
import edu.uestc.onecoupon.engine.dao.entity.CouponTemplateDO;
import edu.uestc.onecoupon.engine.dao.mapper.CouponTemplateMapper;
import edu.uestc.onecoupon.engine.dto.req.CouponTemplateQueryReqDTO;
import edu.uestc.onecoupon.engine.dto.resp.CouponTemplateQueryRespDTO;
import edu.uestc.onecoupon.engine.service.CouponTemplateService;
import edu.uestc.onecoupon.framework.exception.ClientException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class CouponTemplateServiceImpl extends ServiceImpl<CouponTemplateMapper, CouponTemplateDO> implements CouponTemplateService  {

    private final CouponTemplateMapper couponTemplateMapper;
    private final StringRedisTemplate stringRedisTemplate;
    private final RedissonClient redissonClient;

    @Override
    public CouponTemplateQueryRespDTO findCouponTemplate(CouponTemplateQueryReqDTO requestParam) {
        // 1、查询缓存
        String couponTemplateCacheKey = String.format(EngineRedisConstant.COUPON_TEMPLATE_KEY, requestParam.getShopNumber(), requestParam.getCouponTemplateId());
        Map<Object, Object> couponTemplateCacheMap = stringRedisTemplate.opsForHash().entries(couponTemplateCacheKey);

        if (MapUtil.isNotEmpty(couponTemplateCacheMap)) {
            return BeanUtil.mapToBean(couponTemplateCacheMap, CouponTemplateQueryRespDTO.class, false, CopyOptions.create());
        }

        // 2、当缓存不存在，使用双重判定锁解决
        String lockKey = String.format(EngineRedisConstant.LOCK_COUPON_TEMPLATE_KEY, requestParam.getShopNumber(), requestParam.getCouponTemplateId());
        RLock lock = redissonClient.getLock(lockKey);
        lock.lock();

        try {
            // 获取到锁后，第二次查询
            couponTemplateCacheMap = stringRedisTemplate.opsForHash().entries(couponTemplateCacheKey);
            if (MapUtil.isEmpty(couponTemplateCacheMap)) {
                LambdaQueryWrapper<CouponTemplateDO> queryWrapper = Wrappers.lambdaQuery(CouponTemplateDO.class)
                        .eq(CouponTemplateDO::getShopNumber, requestParam.getShopNumber())
                        .eq(CouponTemplateDO::getId, requestParam.getCouponTemplateId())
                        .eq(CouponTemplateDO::getStatus, CouponTemplateStatusEnum.ACTIVE.getStatus());
                CouponTemplateDO couponTemplateDO = couponTemplateMapper.selectOne(queryWrapper);
                // 优惠券模板不存在或者已过期直接抛出异常
                if (couponTemplateDO == null) {
                    throw new ClientException("优惠券模板不存在或已过期");
                }
                CouponTemplateQueryRespDTO actualRespDTO = BeanUtil.toBean(couponTemplateDO, CouponTemplateQueryRespDTO.class);
                Map<String, Object> cacheTargetMap = BeanUtil.beanToMap(actualRespDTO, false, true);
                Map<String, String> actualTargetMap = new HashMap<>(cacheTargetMap.size());
                for (Map.Entry<String, Object> entry : cacheTargetMap.entrySet()) {
                    actualTargetMap.put(entry.getKey(), entry.getValue() != null ? entry.getValue().toString() : "");
                }
                stringRedisTemplate.opsForHash().putAll(couponTemplateCacheKey, actualTargetMap);
                stringRedisTemplate.expireAt(couponTemplateCacheKey, couponTemplateDO.getValidEndTime());
                return actualRespDTO;
            } else {
                return BeanUtil.mapToBean(couponTemplateCacheMap, CouponTemplateQueryRespDTO.class, false, CopyOptions.create());
            }
        } finally {
            lock.unlock();
        }
    }
}
