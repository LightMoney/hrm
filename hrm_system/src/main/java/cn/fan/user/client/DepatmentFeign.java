package cn.fan.user.client;

import cn.fan.entity.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;


@FeignClient(name = "hrm-company")
public interface DepatmentFeign {
    @GetMapping("/dept/all")
    Result findAll();
}
