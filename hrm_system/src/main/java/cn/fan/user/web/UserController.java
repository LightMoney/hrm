package cn.fan.user.web;

import cn.fan.controller.BaseController;
import cn.fan.domain.system.User;
import cn.fan.domain.system.response.UserResult;
import cn.fan.entity.PageResult;
import cn.fan.entity.Result;
import cn.fan.entity.ResultCode;
import cn.fan.swagger.ano.ApiVersion;
import cn.fan.swagger.interf.ApiVersionConstant;
import cn.fan.user.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.Map;

@Api("用户操作")
@RestController
@RequestMapping(value = "/sys")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("用户分配角色")
    @RequestMapping(value = "/user/assignRoles", method = RequestMethod.PUT)
    public Result assignRoles(@RequestBody Map<String, Object> map) {
        String id = (String) map.get("id");
        List<String> roleIds = (List<String>) map.get("roleIds");
        userService.assignRoles(id, roleIds);
        return Result.SUCCESS();
    }

    /**
     * 保存
     */
    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("用户保存")
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public Result save(@RequestBody User user) {
        //1.设置保存的企业id
        user.setCompanyId(companyId);
        user.setCompanyName(companyName);
        //2.调用service完成保存企业
        userService.save(user);
        //3.构造返回结果
        return new Result(ResultCode.SUCCESS);
    }


    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("根据企业查询用户")
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public Result findAll(int page, int size, @RequestParam Map map) {
        //1.获取当前的企业id
        map.put("companyId", companyId);
        //2.完成查询
        Page<User> pageUser = userService.findAll(map, page, size);
        //3.构造返回结果
        PageResult pageResult = new PageResult(pageUser.getTotalElements(), pageUser.getContent());
        return new Result(ResultCode.SUCCESS, pageResult);
    }

    /**
     * 根据ID查询user
     */
    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("根据id查询用户")
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
    public Result findById(@PathVariable(value = "id") String id) {
        User user = userService.findById(id);
        UserResult userResult = new UserResult(user);
        return new Result(ResultCode.SUCCESS, userResult);
    }

    /**
     * 修改User
     */
    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("用户修改")
    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
    public Result update(@PathVariable(value = "id") String id, @RequestBody User user) {
        //1.设置修改的部门id
        user.setId(id);
        //2.调用service更新
        userService.update(user);
        return new Result(ResultCode.SUCCESS);
    }

    /**
     * 根据id删除
     */
    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("删除用户")
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public Result delete(@PathVariable(value = "id") String id) {
        userService.deleteById(id);
        return new Result(ResultCode.SUCCESS);
    }
}
