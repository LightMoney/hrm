package cn.fan;

import cn.fan.util.IdWorker;
import cn.fan.util.JwtUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;
@EnableDiscoveryClient
//不指定默认是扫描该启动类目录下的包
@SpringBootApplication(scanBasePackages = "cn.fan")
@EntityScan("cn.fan.domain.company")
public class HrmCompanyApplication {

    public static void main(String[] args) {
        SpringApplication.run(HrmCompanyApplication.class, args);
    }
    @Bean
    public JwtUtils jwtUtils() {
        return new JwtUtils();
    }
}
