package cn.fan.user.web;

import cn.fan.controller.BaseController;
import cn.fan.copy.PrincipalThreadlocal;
import cn.fan.domain.system.Permission;
import cn.fan.domain.system.Role;
import cn.fan.domain.system.User;
import cn.fan.domain.system.response.ProfileResult;
import cn.fan.domain.system.response.UserResult;
import cn.fan.domain.system.response.UserSimpleResult;
import cn.fan.entity.PageResult;
import cn.fan.entity.Result;
import cn.fan.entity.ResultCode;
import cn.fan.exception.CommonException;
import cn.fan.swagger.ano.ApiVersion;
import cn.fan.swagger.interf.ApiVersionConstant;
import cn.fan.user.client.DepatmentFeign;
import cn.fan.user.easypoi.UserDataListener;
import cn.fan.user.service.PermissionService;
import cn.fan.user.service.UserService;
import cn.fan.user.theard.ImportTaskExcutor;
import cn.fan.util.JwtUtils;
import cn.fan.util.PermissionConstants;
import com.alibaba.excel.EasyExcel;
import io.jsonwebtoken.Claims;
import io.swagger.annotations.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.util.StopWatch;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.io.IOException;
import java.io.Serializable;
import java.util.*;

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

    @Autowired
    private DepatmentFeign depatmentFeign;

    @Autowired
    private ImportTaskExcutor importTaskExcutor;

    /**
     * 测试feign
     */
    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("测试")
    @GetMapping("/test")
    public Result testFeign() {
        return depatmentFeign.findAll();
    }


    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("员工图片上传")
    @RequestMapping("/user/upload/{id}")
    public Result upload(@PathVariable String id, @RequestParam(name = "file") MultipartFile file) throws IOException {
        //1.调用service保存图片（获取到图片的访问地址（dataUrl | http地址））
        String imgUrl = userService.uploadImage(id, file);
        //2.返回数据
        return new Result(ResultCode.SUCCESS, imgUrl);
    }


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
    public Result login(@RequestBody Map<String, String> loginMap) throws CommonException {
        String mobile = loginMap.get("mobile");
        String password = loginMap.get("password");
        try {
//            String s = new Md5Hash(password, mobile, 3).toString();//加密后可使用
            UsernamePasswordToken token = new UsernamePasswordToken(mobile, password);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            String sessionId = (String) subject.getSession().getId();
            return new Result(ResultCode.SUCCESS, sessionId);
        } catch (Exception e) {
            throw new CommonException(ResultCode.MOBILE_ERROR);
        }


//        User user = userService.findByMobile(mobile);
//        if (user == null || !user.getPassword().equals(password)) {
//            return new Result(ResultCode.MOBILE_ERROR);
//        } else {
//            //登录成功  获取api权限字
//            StringBuilder sb = new StringBuilder();
//            for (Role role : user.getRoles()) {
//                Set<Permission> permissions = role.getPermissions();
//                for (Permission p : permissions) {
//                    if (p.getType() == PermissionConstants.PERMISSION_API) {
//                        sb.append(p.getCode()).append(",");
//                    }
//                }
//            }
//            HashMap<String, Object> map = new HashMap<>(3);
//            map.put("apis", sb.toString());
//            map.put("companyId", user.getCompanyId());
//            map.put("companyName", user.getCompanyName());
//            String token = jwtUtils.createJwt(user.getId(), user.getUsername(), map);
//            return new Result(ResultCode.SUCCESS, token);
//        }

    }

    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("登陆后返回相应的用户信息接口")
    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public Result profile() throws CommonException {
        //获取session中的安全数据
        Subject subject = SecurityUtils.getSubject();
        //1.subject获取所有的安全数据集合
        PrincipalCollection principals = subject.getPrincipals();
        //2.获取安全数据
        ProfileResult result = (ProfileResult) principals.getPrimaryPrincipal();

///        String id = claims.getId();
//        User user = userService.findById(id);
//        ProfileResult profileResult = null;
//        //saas管理员具有所有权限
//        //企业管理员具有企业所有权限
//        //企业普通用户具有当前角色权限
//        if ("user".equals(user.getLevel())) {
//            profileResult = new ProfileResult(user);
//        } else {
//            HashMap<String, Object> map = new HashMap<>();
//            if ("coAdmin".equals(user.getLevel())) {
//                map.put("enVisible", "1");
//            }
//            List<Permission> all = permissionService.findAll(map);
//            profileResult = new ProfileResult(user, all);
//        }
//        return new Result(ResultCode.SUCCESS, profileResult);
        return new Result(ResultCode.SUCCESS, result);


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
    @RequiresPermissions("api-user-delete")
    @ApiVersion(group = ApiVersionConstant.FAP_APP100)
    @ApiOperation("删除用户")
//    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE, name = "api-user-delete")
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public Result delete(@PathVariable(value = "id") String id) {
        userService.deleteById(id);
        return new Result(ResultCode.SUCCESS);
    }

    @RequestMapping(value = "/user/import", method = RequestMethod.POST)
    public Result importDatas(@RequestParam(name = "file") MultipartFile attachment) throws Exception {
        StopWatch watch = new StopWatch();

        watch.start();
//        Workbook wb = new XSSFWorkbook(attachment.getInputStream());
//        //2.获取Sheet
//        Sheet sheet = wb.getSheetAt(0);//参数：索引
//        //3.获取Sheet中的每一行，和每一个单元格
//        ArrayList<User> users = new ArrayList<>();
//        for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
//            Row row = sheet.getRow(rowNum);//根据索引获取每一个行
//            ArrayList<Object> objects = new ArrayList<>();
//            for (int cellNum = 1; cellNum < row.getLastCellNum(); cellNum++) {
//                //根据索引获取每一个单元格
//                Cell cell = row.getCell(cellNum);
//                //获取每一个单元格的内容
//                Object value = getCellValue(cell);
//                objects.add(value);
//            }
//            users.add(new User(objects));
//        }
//        userService.saveAll(users, companyId, companyName);
//        UserDataListener<User> userUserDataListener = new UserDataListener<User>( importTaskExcutor);
        UserDataListener<User> userUserDataListener = new UserDataListener<User>();
        List<User> users = EasyExcel.read(attachment.getInputStream(), User.class, userUserDataListener).sheet().doReadSync();
        System.out.println(watch.getTotalTimeSeconds());
        execute(users);
        watch.stop();
        System.out.println(watch.getTotalTimeSeconds());
        return new Result(ResultCode.SUCCESS);
    }

    public void execute(List<User> templates) {
        int size = templates.size();
        int start = 0;
        int end = start + 1000;
        HashMap content = PrincipalThreadlocal.getContent();
        String companyId = (String) content.get("companyId");
        String companyName = (String) content.get("companyName");
        while (start < size) {
            if (end > size) {
                end = size;
            }
            List<User> users = templates.subList(start, end);
            importTaskExcutor.doTaskTest(users, companyId, companyName);
            start = end;
            end = start + 1000;
        }
    }

    public static Object getCellValue(Cell cell) {
        //1.获取到单元格的属性类型
//        poi 4.0  getCellType()
        CellType cellType = cell.getCellTypeEnum();
        //2.根据单元格数据类型获取数据
        Object value = null;
        switch (cellType) {
            case STRING:
                value = cell.getStringCellValue();
                break;
            case BOOLEAN:
                value = cell.getBooleanCellValue();
                break;
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    //日期格式
                    value = cell.getDateCellValue();
                } else {
                    //数字
                    value = cell.getNumericCellValue();
                }
                break;
            case FORMULA: //公式
                value = cell.getCellFormula();
                break;
            default:
                break;
        }
        return value;
    }

    @RequestMapping(value = "/user/simple", method = RequestMethod.GET)
    public Result simple() throws Exception {
        List<UserSimpleResult> list = new ArrayList<>();
        List<User> users = userService.findAll(companyId);
        for (User user : users) {
            list.add(new UserSimpleResult(user.getId(),user.getUsername()));
        }
        return new Result(ResultCode.SUCCESS,list);
    }
}
