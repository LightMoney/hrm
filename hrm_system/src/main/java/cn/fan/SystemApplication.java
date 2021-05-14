package cn.fan;

import cn.fan.util.JwtUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;


@SpringBootApplication(scanBasePackages = "cn.fan")
@EntityScan("cn.fan.domain.system")
public class SystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(SystemApplication.class);
    }

    @Bean
    public JwtUtils jwtUtils() {
        return new JwtUtils();
    }
}
