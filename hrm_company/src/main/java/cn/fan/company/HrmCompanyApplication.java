package cn.fan.company;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication(scanBasePackages = "cn.fan")
@EntityScan("cn.fan")
public class HrmCompanyApplication {

    public static void main(String[] args) {
        SpringApplication.run(HrmCompanyApplication.class, args);
    }

}
