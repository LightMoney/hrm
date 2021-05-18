package cn.fan.interceptor;

import cn.fan.entity.ResultCode;
import cn.fan.exception.CommonException;
import cn.fan.util.JwtUtils;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.invoke.MethodHandle;

/**
 * TODO
 * preHandle  进入方法控制器之前执行
 * postHandle 执行完控制器方法之后
 * <p>
 * token拦截
 */
@Component
public class JwtInterceptor extends HandlerInterceptorAdapter {


    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String authorization = request.getHeader("Authorization");
        if (!StringUtils.isEmpty(authorization) && authorization.startsWith("Bearer")) {
            String token = authorization.substring(7);
            Claims claims = jwtUtils.parseJwt(token);
            if (claims != null) {

                String apis = (String) claims.get("apis");
                //给用户操作接口 带上name属性 为数据库中code相同
                HandlerMethod method = (HandlerMethod) handler;
                RequestMapping methodAnnotation = method.getMethodAnnotation(RequestMapping.class);
                String name = methodAnnotation.name();
                if (apis.contains(name)) {
                    request.setAttribute("user_claims", claims);
                    return true;
                } else {
                    throw new CommonException(ResultCode.UNAUTHORISE);
                }
            }
        }
        throw new CommonException(ResultCode.UNAUTHENTICATED);
    }

}
