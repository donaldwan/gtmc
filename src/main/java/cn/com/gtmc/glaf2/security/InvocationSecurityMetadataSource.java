package cn.com.gtmc.glaf2.security;

import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import java.util.ArrayList;
import java.util.Collection;


public class InvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    private static final Logger LOG = Logger.getLogger(InvocationSecurityMetadataSource.class);

    @Autowired
    private UrlAuthentication mUrlAuthentication;

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return new ArrayList<>();
    }

    @Override
    public Collection<ConfigAttribute> getAttributes(Object object)
            throws IllegalArgumentException {
        LOG.debug("getAttributes...");
        javax.servlet.http.HttpServletRequest request = ((org.springframework.security.web.FilterInvocation) object).getRequest();
        return this.mUrlAuthentication.getAuthenticationByUrl(request.getServletPath());
    }

    @Override
    public boolean supports(Class<?> arg0) {
        return true;
    }

    @SuppressWarnings("unused")
    private void loadResources() {
        this.mUrlAuthentication.loadUrlAuthentication();
    }
}
