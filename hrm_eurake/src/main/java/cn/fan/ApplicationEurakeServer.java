package cn.fan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/25 10:24
 */
@SpringBootApplication
@EnableEurekaServer
public class ApplicationEurakeServer {
    public static void main(String[] args) {
        SpringApplication.run(ApplicationEurakeServer.class);
    }
}
