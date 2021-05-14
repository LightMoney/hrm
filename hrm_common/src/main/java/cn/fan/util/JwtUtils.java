package cn.fan.util;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.Date;
import java.util.Map;

@Getter
@Setter
@ConfigurationProperties("jwt.config")
public class JwtUtils {
    //签名私钥
    private String key;
    //签名的失效时间
    private Long ttl;

    /**
     * 设置认证token
     *      id:登录用户id
     *      subject：登录用户名
     *
     */
    public String createJwt(String id, String name, Map<String,Object> map) {
        //1.设置失效时间
        long now = System.currentTimeMillis();//当前毫秒
        long exp = now + ttl;
        //2.创建jwtBuilder
        JwtBuilder jwtBuilder = Jwts.builder().setId(id).setSubject(name)
                .setIssuedAt(new Date())
                .signWith(SignatureAlgorithm.HS256, key);
        //3.根据map设置claims
        for(Map.Entry<String,Object> entry : map.entrySet()) {
            jwtBuilder.claim(entry.getKey(),entry.getValue());
        }
        jwtBuilder.setExpiration(new Date(exp));
        //4.创建token
        String token = jwtBuilder.compact();
        return token;
    }


    /**
     * 解析token字符串获取clamis
     */
    public Claims parseJwt(String token) {
        Claims claims = Jwts.parser().setSigningKey(key).parseClaimsJws(token).getBody();
        return claims;
    }


//    public static void main(String[] args) {
//        JwtBuilder jwtBuilder = Jwts.builder().setId("22").setSubject("光源")
//                .setIssuedAt(new Date())
//                .signWith(SignatureAlgorithm.HS256, "colin")
//                .claim("companyId","554");//自定义信息
//        String token = jwtBuilder.compact();
//        System.out.println(token);

//        Claims colin = Jwts.parser().setSigningKey("colin").parseClaimsJws("eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMiIsInN1YiI6IuWFiea6kCIsImlhdCI6MTYyMDk3NDk1NCwiY29tcGFueUlkIjoiNTU0In0.sYFvb4dw1DRLWxOUJcpjmbCGljg8obDLKSdTuQ1GfCo").getBody();
//        String id = colin.getId();
//        Object companyId = colin.get("companyId");
//        System.out.println(id+":"+companyId);
//    }
}
