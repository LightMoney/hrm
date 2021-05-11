package cn.fan.company.web;

import cn.fan.domain.company.CoCompanyEntity;
import cn.fan.company.service.CompanyService;
import cn.fan.entity.Result;
import cn.fan.entity.ResultCode;
import cn.fan.swagger.ano.ApiVersion;
import cn.fan.swagger.interf.ApiVersionConstant;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/8 9:30
 */
@RestController
@Api("公司操作接口")
public class CompanyController {

    @Autowired
    private CompanyService service;

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("新增公司")
    @PostMapping("/company")
    public Result addCompany(@RequestBody CoCompanyEntity c) {

        CoCompanyEntity coCompanyEntity = service.addCompany(c);

        return new Result(ResultCode.SUCCESS, coCompanyEntity);
    }

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("修改公司")
    @PutMapping("/company/update")
    public Result updateCompany(@RequestBody CoCompanyEntity c) {
        service.updateCompany(c);
        return Result.SUCCESS();
    }

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("修改公司")
    @DeleteMapping("/company/delete/{id}")
    public Result deleteCompany(@PathVariable(name = "id") String id) {
        service.delete(id);
        return Result.SUCCESS();
    }

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("根据id查询单个公司")
    @GetMapping("/company")
    public Result findById(@RequestParam(name = "id") String id) {
        return new Result(ResultCode.SUCCESS, service.findOne(id));
    }

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("查询公司列表")
    @GetMapping("/company/list")
    public Result findAll() {
        return new Result(ResultCode.SUCCESS, service.findAll());
    }

}
