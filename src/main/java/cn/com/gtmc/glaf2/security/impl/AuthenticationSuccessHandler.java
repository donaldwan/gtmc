package cn.com.gtmc.glaf2.security.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

import cn.com.gtmc.glaf2.entity.security.LogLogin;
import cn.com.gtmc.glaf2.mapper.security.UserMapper;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;

/**
 * 登录成功后的回调<br />
 * 在此可根据用户的不同角色跳转不同的页面
 * @author chenwandong
 *
 */
public class AuthenticationSuccessHandler implements org.springframework.security.web.authentication.AuthenticationSuccessHandler{

	private static final Logger LOG = Logger.getLogger(AuthenticationSuccessHandler.class);
	
	private String defaultTargetUrl = "main#home";
	
	@Autowired
	private UserMapper mUserMapper;
	
	public String getDefaultTargetUrl() {
		return defaultTargetUrl;
	}

	public void setDefaultTargetUrl(String defaultTargetUrl) {
		this.defaultTargetUrl = defaultTargetUrl;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	        Authentication authentication) throws IOException, ServletException {
		LOG.debug("onAuthenticationSuccess...");
		LoginUser loginUser = Util.getLoginUser();
		LogLogin log = new LogLogin();
		log.setUserId(loginUser.getId());
		log.setLoginName(loginUser.getUsername());
		log.setLoginIp(this.getLoginIp(request));
		log.setCreatedTime(new java.util.Date());
		this.mUserMapper.insertLoginLog(log);
		
		response.sendRedirect(this.defaultTargetUrl);
	}
	
	/**
	 * 获取登录人IP地址
	 * @param request
	 * @return
	 */
	private String getLoginIp(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        String unknown = "unknown";
        if (ip == null || ip.length() == 0 || unknown.equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || unknown.equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || unknown.equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || unknown.equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || unknown.equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
	
}
