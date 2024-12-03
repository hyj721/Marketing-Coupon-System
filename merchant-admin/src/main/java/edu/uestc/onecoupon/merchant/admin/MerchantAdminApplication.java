package edu.uestc.onecoupon.merchant.admin;

import com.mzt.logapi.starter.annotation.EnableLogRecord;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("edu.uestc.onecoupon.merchant.admin.dao.mapper")
@EnableLogRecord(tenant = "MerchantAdmin") // tenant 是代表租户的标识，一般一个服务或者一个业务下的多个服务都固定一个 tenant 就可以。
@EnableScheduling
public class MerchantAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(MerchantAdminApplication.class, args);
    }
}
