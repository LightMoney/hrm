package cn.fan.user.web;

import cn.fan.controller.BaseController;
import cn.fan.domain.system.Permission;
import cn.fan.domain.system.Role;
import cn.fan.domain.system.User;
import cn.fan.domain.system.response.ProfileResult;
import cn.fan.domain.system.response.UserResult;
import cn.fan.entity.PageResult;
import cn.fan.entity.Result;
import cn.fan.entity.ResultCode;
import cn.fan.exception.CommonException;
import cn.fan.swagger.ano.ApiVersion;
import cn.fan.swagger.interf.ApiVersionConstant;
import cn.fan.user.service.PermissionService;
import cn.fan.user.service.UserService;
import cn.fan.util.JwtUtils;
import cn.fan.util.PermissionConstants;
import io.jsonwebtoken.Claims;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Api(tags = "用户操作")
@RestController
@RequestMapping(value = "/sys")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private JwtUtils jwtUtils;

    /**
     * login
     *
     * @param
     * @return
     */
    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("登录")
    @ApiImplicitParam(name = "loginMap", value = "{\n" +
            "\t\"mobile\":\"1572508943000\",\n" +
            "\t\"password\":\"1572462143000\"\n" +
            "}", dataType = "map", paramType = "body")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Result login(@RequestBody Map<String, String> loginMap) {
        String mobile = loginMap.get("mobile");
        String password = loginMap.get("password");
        User user = userService.findByMobile(mobile);
        if (user == null || !user.getPassword().equals(password)) {
            return new Result(ResultCode.MOBILE_ERROR);
        } else {
            //登录成功  获取api权限字
            StringBuilder sb = new StringBuilder();
            for (Role role : user.getRoles()) {
                Set<Permission> permissions = role.getPermissions();
                for (Permission p : permissions) {
                    if (p.getType() == PermissionConstants.PERMISSION_API) {
                        sb.append(p.getCode()).append(",");
                    }
                }
            }
            HashMap<String, Object> map = new HashMap<>(3);
            map.put("apis", sb.toString());
            map.put("companyId", user.getCompanyId());
            map.put("companyName", user.getCompanyName());
            String token = jwtUtils.createJwt(user.getId(), user.getUsername(), map);
            return new Result(ResultCode.SUCCESS, token);
        }

    }

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("登陆后返回相应的用户信息接口")
    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public Result profile() throws CommonException {

//        String authorization = request.getHeader("Authorization");
//        if (StringUtils.isEmpty(authorization)) {
//            throw new CommonException(ResultCode.UNAUTHENTICATED);
//        }
////        Bearer+" " 开头的
//        String token = authorization.substring(7);
//        Claims claims = jwtUtils.parseJwt(token);
        String id = claims.getId();
        User user = userService.findById(id);
        ProfileResult profileResult = null;
        //saas管理员具有所有权限
        //企业管理员具有企业所有权限
        //企业普通用户具有当前角色权限
        if ("user".equals(user.getLevel())) {
            profileResult = new ProfileResult(user);
        } else {
            HashMap<String, Object> map = new HashMap<>();
            if ("coAdmin".equals(user.getLevel())) {
                map.put("enVisible", "1");
            }
            List<Permission> all = permissionService.findAll(map);
            profileResult = new ProfileResult(user, all);
        }
        return new Result(ResultCode.SUCCESS, profileResult);
    }

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
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE,name = "api-user-delete")
    public Result delete(@PathVariable(value = "id") String id) {
        userService.deleteById(id);
        return new Result(ResultCode.SUCCESS);
    }
}
