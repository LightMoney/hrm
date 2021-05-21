package cn.fan.user.shiro;

import cn.fan.domain.system.Permission;
import cn.fan.domain.system.User;
import cn.fan.domain.system.response.ProfileResult;
import cn.fan.shiro.realm.IHrmRealm;
import cn.fan.user.service.PermissionService;
import cn.fan.user.service.UserService;
import org.apache.shiro.authc.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/21 17:01
 */
public class UserRealm extends IHrmRealm {

    @Autowired
    private UserService userService;

    @Autowired
    private PermissionService permissionService;
//认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //1.获取登录的用户名密码（token）
        UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;
        String username = upToken.getUsername();
        String password = new String(upToken.getPassword());
        //2.根据用户名查询数据库
        User user = userService.findByMobile(username);
        //3.判断用户是否存在或者密码是否一致
        if (user != null && user.getPassword().equals(password)) {
            //4.如果一致返回安全数据（按理使用用户也可以但是数据太大了  权限  用户基本数据）
            ProfileResult profileResult = null;
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
            //构造方法：安全数据，密码，realm域名
            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(profileResult, user.getPassword(), this.getName());
            return info;
        }
        //5.不一致，返回null（抛出异常  用户名和密码不匹配）
        return null;
    }
}
