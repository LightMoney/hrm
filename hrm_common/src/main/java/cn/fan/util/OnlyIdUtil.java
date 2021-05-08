package cn.fan.util;

import org.springframework.util.StringUtils;

/**
 *
 * 雪花算法生成唯一码
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/8 10:52
 */
public class OnlyIdUtil {

    private final static String DEFAUT_PREFIX = "";
    private static IdWorker worker = new IdWorker();


    public static String generate(String prefix) {
        if (StringUtils.isEmpty(prefix)) {
            prefix = DEFAUT_PREFIX;
        }
        long id = worker.nextId();
        return prefix + id;
    }
}
