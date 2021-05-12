package cn.fan.dept.web;

import cn.fan.controller.BaseController;
import cn.fan.domain.company.CoCompanyEntity;
import cn.fan.domain.company.Department;
import cn.fan.domain.company.DeptListResult;
import cn.fan.company.service.CompanyService;
import cn.fan.dept.service.DeptService;
import cn.fan.entity.Result;
import cn.fan.entity.ResultCode;
import cn.fan.swagger.ano.ApiVersion;
import cn.fan.swagger.interf.ApiVersionConstant;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Api("部门接口")
@RestController
@RequestMapping("/dept")
public class DeptController extends BaseController {
    @Autowired
    private DeptService deptService;

    @Autowired
    private CompanyService companyService;

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("部门添加")
    @PostMapping("/add")
    public Result addDept(@RequestBody Department department) {
        //暂时写死
        department.setCompanyId(companyId);
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

    //   使用delete  还是使用respbody  或@pathVariable   免得前端还要拼接路径参数
    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @DeleteMapping("/delete/{id}")
    @ApiOperation("通过部门id删除")
    public Result delete(@PathVariable("id") String id) {
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
    public Result findAll() {
//companyId 暂时写死
        CoCompanyEntity one = companyService.findOne(companyId);
        List<Department> all = deptService.findAll(companyId);
        DeptListResult deptListResult = new DeptListResult(one, all);
        return new Result(ResultCode.SUCCESS, deptListResult);
    }
}
