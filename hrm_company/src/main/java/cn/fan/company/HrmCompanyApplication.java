package cn.fan.company;

import cn.fan.util.IdWorker;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;

@SpringBootApplication(scanBasePackages = "cn.fan")
@EntityScan("cn.fan")
public class HrmCompanyApplication {

    public static void main(String[] args) {
        SpringApplication.run(HrmCompanyApplication.class, args);
    }

    @Bean
    public IdWorker idworker(){
        return new IdWorker();
    }
}
