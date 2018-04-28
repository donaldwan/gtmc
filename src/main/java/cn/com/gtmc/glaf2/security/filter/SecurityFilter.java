package cn.com.gtmc.glaf2.security.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

/**
 * 
 * @author wl
 *Filter 可以实现URL级别的权限访问控制、过滤敏感词汇、压缩响应信息等一些高级功能
 *在HttpServletRequest/HttpServletResponse到达 Servlet/ 客户端之前，拦截客户的HttpServletRequest/HttpServletResponse 。
 *根据需要检查HttpServletRequest/HttpServletResponse，也可以修改HttpServletRequest /HttpServletResponse头和数据
 */
public class SecurityFilter extends AbstractSecurityInterceptor implements Filter {

	private FilterInvocationSecurityMetadataSource securityMetadataSource;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 把doFilter传进来的request,response和FilterChain对象保存起来，供FilterSecurityInterceptor的处理代码调用
		FilterInvocation fi = new FilterInvocation(request, response, chain);
		org.springframework.security.access.intercept.InterceptorStatusToken token = super.beforeInvocation(fi);
		try{
			//	将请求转发给过滤器链下一个filter , 如果没有filter那就是你请求的资源
				fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		}finally{
			super.afterInvocation(token,null);
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
