package edu.uestc.onecoupon.framework.config;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SnowflakeConfiguration {
    @Bean
    public Snowflake snowFlake() {
        return IdUtil.getSnowflake(1, 1);
    }
}
