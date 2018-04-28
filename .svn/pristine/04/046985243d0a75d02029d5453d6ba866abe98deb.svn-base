package cn.com.gtmc.glaf2.security.filter;

import cn.com.gtmc.glaf2.security.impl.XSSRequestWrapper;
import cn.com.gtmc.glaf2.tools.log.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class XSSFilter implements Filter {

    private static final Logger LOG = Logger.getLogger(XSSFilter.class);

    @Override
    public void destroy() {
        // empty
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // empty
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        LOG.debug("doFilter...");
        chain.doFilter(new XSSRequestWrapper((HttpServletRequest) servletRequest), servletResponse);
    }

}
