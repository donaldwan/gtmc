package cn.com.gtmc.glaf2.security;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

public class UrlAccessDecisionManager implements AccessDecisionManager {

    private static final Logger LOG = LoggerFactory.getLogger(UrlAccessDecisionManager.class);

    @Override
    public void decide(Authentication authentication, Object object,
                       Collection<ConfigAttribute> configAttributes) throws AccessDeniedException,
            InsufficientAuthenticationException {

        LOG.debug("decide...");
        if (configAttributes == null) {
            return;
        }

        for (ConfigAttribute ca : configAttributes) {
            String needRole = ca.getAttribute();
            LOG.debug("needRole:{}", needRole);
            for (GrantedAuthority ga : authentication.getAuthorities()) {
                LOG.debug("ga:{}", ga.getAuthority());
                if (needRole.equals(ga.getAuthority())) {
                    return;
                }
            }
        }
        throw new AccessDeniedException("No Permission");
    }

    @Override
    public boolean supports(ConfigAttribute arg0) {
        return true;
    }

    @Override
    public boolean supports(Class<?> arg0) {
        return true;
    }

}
