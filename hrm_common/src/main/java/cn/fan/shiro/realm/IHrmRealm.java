package cn.fan.shiro.realm;


import cn.fan.domain.system.response.ProfileResult;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.awt.*;
import java.util.HashSet;
import java.util.Set;

/**
 * 自定义realm域   公共的realm  只需授权
 */
public class IHrmRealm extends AuthorizingRealm {
    @Override
    public void setName(String name) {
        super.setName("ihrmRealm");
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        return null;
    }

    /**
     * 授权方法
     *      操作的时候，判断用户是否具有响应的权限
     *          先认证 -- 安全数据
     *          再授权 -- 根据安全数据获取用户具有的所有操作权限
     *
     *
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
//获取安全数据
        ProfileResult primaryPrincipal = (ProfileResult) principalCollection.getPrimaryPrincipal();
//        获取权限信息(api接口权限标识)
        Set<String> apisPerm = (Set<String>)primaryPrincipal.getRoles().get("apis");
//        构造返回
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.setStringPermissions(apisPerm);
        return simpleAuthorizationInfo;
    }



}
