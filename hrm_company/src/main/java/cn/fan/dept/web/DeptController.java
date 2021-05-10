package cn.fan.dept.web;

import cn.fan.company.Department;
import cn.fan.dept.service.DeptService;
import cn.fan.entity.Result;
import cn.fan.swagger.ano.ApiVersion;
import cn.fan.swagger.interf.ApiVersionConstant;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api("部门接口")
@RestController
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("部门添加")
    @PostMapping("/add")
    public Result addDept(@RequestBody Department department) {
        deptService.addDept(department);
        return Result.SUCCESS();
    }

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @PutMapping("/update")
    @ApiOperation("部门修改")
    public Result update(@RequestBody Department department) {
        deptService.update(department);
        return Result.SUCCESS();
    }

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @DeleteMapping("/delete")
    @ApiOperation("通过部门id删除")
    public Result delete(@RequestParam("id") String id) {
        deptService.delete(id);
        return Result.SUCCESS();
    }

}
