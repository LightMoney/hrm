package cn.fan.user.client;

import cn.fan.domain.company.Department;
import cn.fan.entity.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@FeignClient(name = "hrm-company")
public interface DepatmentFeign {
    @GetMapping("/dept/all")
    Result findAll();

    @PostMapping("dept/code")
    Department findDeptByCode(@RequestParam("code") String deptCode, @RequestParam("companyId") String companyId);
}
