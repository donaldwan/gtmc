package cn.com.gtmc.glaf2.controller.system;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gtmc.sso.entity.SSOUser;
import com.gtmc.sso.exception.SSOException;
import com.gtmc.sso.impl.SSOServiceImpl;

import cn.com.gtmc.glaf2.entity.security.LogLogin;
import cn.com.gtmc.glaf2.entity.security.User;
import cn.com.gtmc.glaf2.mapper.security.UserMapper;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.security.UrlAuthentication;
import cn.com.gtmc.glaf2.tools.Util;


/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SsoLoginController
 * @Package cn.com.gtmc.glaf2.controller.system
 * @Description:  通过单点登录获取用户信息，存放session，记录日志
 * @date 2017年7月21日 上午9:45:29 
 */
@Controller
public class SsoLoginController {

	private static final Logger LOG = LoggerFactory.getLogger(SsoLoginController.class);
	@Autowired
    private UserMapper mUserMapper;

    @Autowired
    private UrlAuthentication mAuthentication;
	
	@RequestMapping("loginSSOSession")
	public void setLoginUserInfo(HttpServletRequest request,HttpServletResponse response)throws UsernameNotFoundException{
		//由session中得到用户信息，ssouser名称固定
		//SSOUser ssoUser = (SSOUser)request.getSession().getAttribute("ssouser");
		SSOServiceImpl ssoServiceImpl = SSOServiceImpl.getInstance();
		SSOUser ssoUser = null;
		String username = "";
		try {
			ssoUser = ssoServiceImpl.loadUser(request);
			if(ssoUser == null){
				response.sendRedirect(ssoServiceImpl.getLoginUrl());
			}
			//单点登用户名
			username = ssoUser.getSamma();
		} catch (SSOException | IOException e1) {
			e1.printStackTrace();
		}
		//根据用户名username加载userDetails
	    User user = this.mUserMapper.findByLoginName(username);
        if (user == null) {
            throw new UsernameNotFoundException(username);
        }
        user.setAuthorities(this.mAuthentication.getGrantedAuthorityByUser(user.getId()));
		UserDetails userDetails = user;
		//根据userDetails构建新的Authentication,这里使用了
		//PreAuthenticatedAuthenticationToken当然可以用其他token,如UsernamePasswordAuthenticationToken    
		PreAuthenticatedAuthenticationToken authentication = 
		      new PreAuthenticatedAuthenticationToken(userDetails, userDetails.getPassword(),userDetails.getAuthorities());
		//设置authentication中details
		authentication.setDetails(new WebAuthenticationDetails(request));
		//存放authentication到SecurityContextHolder
		SecurityContextHolder.getContext().setAuthentication(authentication);
		HttpSession session = request.getSession(true);
		//在session中存放security context,方便同一个session中控制用户的其他操作
		session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
		try {
			LogLogin log = new LogLogin();
			LoginUser loginUser = Util.getLoginUser();
			log.setUserId(loginUser.getId());
			log.setLoginName(loginUser.getUsername());
			log.setLoginIp(this.getLoginIp(request));
			log.setCreatedTime(new java.util.Date());
			this.mUserMapper.insertLoginLog(log);
			response.sendRedirect(request.getContextPath() + "/main#home");
		} catch (IOException e) {
			LOG.error("ssologin error!!!", e);
		}
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
