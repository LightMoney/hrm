package cn.fan.copy;

import java.util.HashMap;

/**
 * 线程副本用于全局数据获取
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/28 16:10
 */
public class PrincipalThreadlocal {
    private static ThreadLocal<HashMap<String, Object>> local = new ThreadLocal();

    public static HashMap getContent() {
        return local.get();
    }

    public static void setContent(HashMap map) {
//        local.remove();
        local.set(map);
    }
}
