package cn.fan;

import cn.fan.util.IdWorker;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
//不指定默认是扫描该启动类目录下的包
@SpringBootApplication(scanBasePackages = "cn.fan")
@EntityScan("cn.fan.domain.company")
public class HrmCompanyApplication {

    public static void main(String[] args) {
        SpringApplication.run(HrmCompanyApplication.class, args);
    }

}
