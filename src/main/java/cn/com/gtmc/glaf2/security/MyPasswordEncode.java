package cn.com.gtmc.glaf2.security;

import cn.com.gtmc.glaf2.tools.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;


/**
 * 自定义加密算法
 *
 * @author 陈万东
 * @version V1.0
 * @Title: MyPasswordEncode.java
 * @Package cn.com.intasect.security
 * @Description: 自定义加密算法
 * @date 2016年1月28日 上午9:52:13
 */
public class MyPasswordEncode implements PasswordEncoder {

    private static final Logger LOG = LoggerFactory.getLogger(MyPasswordEncode.class);

    @Override
    public String encode(CharSequence rawPassword) {
        LOG.debug("encode:{}", rawPassword);
        return rawPassword.toString();
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        LOG.debug("matches:rawPassword:{},encodedPassword:{}", rawPassword, encodedPassword);
        String password = Util.MD5(rawPassword.toString());
        LOG.debug("password:{},encodedPassword:{}", password, encodedPassword);
        boolean b = encodedPassword.equalsIgnoreCase(password);
        LOG.debug("matches:{}", b);
        return b;
    }

}
