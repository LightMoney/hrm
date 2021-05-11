package cn.fan.dept.web;

import cn.fan.company.CoCompanyEntity;
import cn.fan.company.Department;
import cn.fan.company.DeptListResult;
import cn.fan.company.service.CompanyService;
import cn.fan.dept.service.DeptService;
import cn.fan.entity.Result;
import cn.fan.entity.ResultCode;
import cn.fan.swagger.ano.ApiVersion;
import cn.fan.swagger.interf.ApiVersionConstant;
import cn.fan.util.OnlyIdUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Api("部门接口")
@RestController
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @Autowired
    private CompanyService companyService;

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

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @GetMapping("/one")
    @ApiOperation("通过部门id查询部门详情")
    public Result findOne(@RequestParam("id") String id) {
        return new Result(ResultCode.SUCCESS, deptService.findOne(id));
    }


    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @GetMapping("/all")
    @ApiOperation("通过企业id查询部门列表")
    public Result findAll(@RequestParam("companyId") String companyId) {

        CoCompanyEntity one = companyService.findOne(companyId);
        List<Department> all = deptService.findAll(companyId);
        DeptListResult deptListResult = new DeptListResult(one, all);
        return new Result(ResultCode.SUCCESS, deptListResult);
    }
}
