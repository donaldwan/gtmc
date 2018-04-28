package cn.com.gtmc.glaf2.security.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import com.gtmc.sso.exception.SSOException;
import com.gtmc.sso.impl.SSOServiceImpl;
import com.gtmc.util.SSOLoginAuth;


/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SSOFilter
 * @Package cn.com.gtmc.glaf2.security.filter
 * @Description:  
 * @date 2017年7月20日 下午4:37:51 
 */
public class SSOsecurityFilter extends AbstractSecurityInterceptor implements Filter{

	private static final Log log = LogFactory.getLog(SSOsecurityFilter.class);
 
	
	private FilterInvocationSecurityMetadataSource securityMetadataSource;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		FilterInvocation fi = new FilterInvocation(request, response, chain);
		org.springframework.security.access.intercept.InterceptorStatusToken token = super.beforeInvocation(fi);
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String ctx = req.getContextPath();
		String uri = req.getRequestURI();
		System.out.println(uri);
		SSOServiceImpl authservice = SSOServiceImpl.getInstance();
		if(ctx==null){
			ctx="";
		}else{
			ctx=ctx.trim();
		}
		
		String selfLogin = "/main";//自登陆
		String ssoLogin = "/ssologin";//点单登录
		String selfLoginContex = ctx+selfLogin;
		
		if(selfLoginContex!=null && selfLoginContex.trim().equalsIgnoreCase(uri)){//如果是自登陆则标示为false，自登录标示后所有连接不做定时验证
			req.getSession().setAttribute("issso", "false");//标示后不在做定时验证
		}
		String ssoLoginContex = ctx+ssoLogin;
		if(ssoLoginContex!=null && ssoLoginContex.trim().equalsIgnoreCase(uri)){//如果是单点登录则标示为true，配置链接需要进行定时验证
			req.getSession().setAttribute("issso", "true");//标示后需要进行定时验证
			req.getSession().removeAttribute("lastvalidtime");//移除定时验证存储时间点
		}
		if(req.getSession().getAttribute("issso")==null){//issso登录方式标示为空时，标示用户登录已超时
			if(authservice.getTokenID(req)!=null){//认证标示（token）存在，说明为SSO登陆超时
				res.sendRedirect(SSOLoginAuth.TIMEOUT_URL);//跳转至SSO登陆超时页面
				return;
			}else{
				//此处添加自登陆超时页面设置，跳转至业务系统超时页面或登陆首页
				//res.sendRedirect("");
			}
		}
		if(req.getSession().getAttribute("issso").equals("true")){//当SSO登录标识为true时，说明由SSO登录，需要进行定时验证
			try {
				boolean isValiedPass =authservice.validByMinute(req);
				if(!isValiedPass){//如果不合法，跳转至登录
					if(authservice.getTokenID(req)!=null && authservice.getTokenID(req)!=""){//登陆超时情况下，跳转至超时提示页面
						res.sendRedirect(SSOLoginAuth.TIMEOUT_URL);
					}else{//未登陆情况下，跳转至SSO登陆页面
						res.sendRedirect(authservice.getLoginUrl());
					}
				}else{
					//chain.doFilter(request, response);
					try{
						fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
					}finally{
						super.afterInvocation(token,null);
					}
				}
			} catch (SSOException e) {//异常
				//验证不成功，提示，处理，跳转至SSO登录首页
				res.sendRedirect(authservice.getLoginUrl());
				e.printStackTrace();
				log.error("验证不成功，提示，处理，跳转至SSO登录首页.", e);
			}
			
		}else{
			//chain.doFilter(request, response);
			try{
				fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
			}finally{
				super.afterInvocation(token,null);
			}
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public Class<?> getSecureObjectClass() {
		// TODO Auto-generated method stub
		return FilterInvocation.class;
	}

	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		// TODO Auto-generated method stub
		return this.securityMetadataSource;
	}

	public void setSecurityMetadataSource(
			FilterInvocationSecurityMetadataSource securityMetadataSource) {
		this.securityMetadataSource = securityMetadataSource;
	}
	
	
	
	
}
