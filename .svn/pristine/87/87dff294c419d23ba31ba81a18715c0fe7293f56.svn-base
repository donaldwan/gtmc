package cn.com.gtmc.glaf2.security.impl;

import cn.com.gtmc.glaf2.entity.security.Authentication;
import cn.com.gtmc.glaf2.entity.security.Resource;
import cn.com.gtmc.glaf2.entity.security.Screen;
import cn.com.gtmc.glaf2.mapper.security.AuthenticationMapper;
import cn.com.gtmc.glaf2.mapper.security.ResourceMapper;
import cn.com.gtmc.glaf2.mapper.security.ScreenMapper;
import cn.com.gtmc.glaf2.security.UrlAuthentication;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

@Component
public class UrlAuthenticationImpl implements UrlAuthentication {

    private static final Logger LOG = Logger.getLogger(UrlAuthenticationImpl.class);

    private static final String AUTH_CODE_SCREEN_PREFIX = "ROLE_SCREEN_";
    private static final String AUTH_CODE_AUTHEN_PREFIX = "ROLE_AUTHEN_";
    private static final String DEFAULT_AUTHENTICATION = "ROLE_ADMIN";

    @Autowired
    private ResourceMapper mResourceMapper;

    @Autowired
    private ScreenMapper mScreenMapper;

    @Autowired
    private AuthenticationMapper mAuthenticationMapper;

    private java.util.Map<String, java.util.Collection<ConfigAttribute>> urlMap = null;

    public UrlAuthenticationImpl() {
        LOG.debug("init ...");
        this.urlMap = new java.util.HashMap<>();
    }

    @Override
    public Collection<ConfigAttribute> getAuthenticationByUrl(String url) {
        LOG.debug("getAuthentication...{}", url);
        Collection<ConfigAttribute> collection = this.urlMap.get(url);
        if (collection != null) {
            return collection;
        }
        for (Map.Entry<String, Collection<ConfigAttribute>> entry : urlMap.entrySet()) {
            if (Util.regex(entry.getKey(), url)) {
                return this.urlMap.get(entry.getKey());
            }
        }
        return new ArrayList<>();
    }


    @Override
    public void loadUrlAuthentication() {
        LOG.debug("loadUrlAuthentication...");
        synchronized (urlMap) {
            this.urlMap.clear();
            java.util.List<Resource> resources = this.mResourceMapper.findAll();
            for (Resource resource : resources) {
                LOG.debug("resource url:{}", resource.getUri());
                if (!StringUtils.isEmpty(resource.getUri())) {
                    this.urlMap.put("/" + resource.getUri(), this.getConfigAttributesByResource(resource.getId()));
                }
            }
        }
    }

    private java.util.List<ConfigAttribute> getConfigAttributesByResource(java.io.Serializable pk) {
        LOG.debug("getConfigAttributesByResource...{}", pk);
        //查询资源对应的菜单权限
        java.util.List<Screen> screens = this.mScreenMapper.findScreenByResource(pk);
        java.util.List<ConfigAttribute> attributes = new java.util.ArrayList<>();
        for (Screen screen : screens) {
            LOG.debug("screenId:{}", screen.getId());
            attributes.add(new SecurityConfig(AUTH_CODE_SCREEN_PREFIX + screen.getId()));
        }

        //查询资源对应的权限集合
        java.util.List<Authentication> authentications = this.mAuthenticationMapper.findAuthByResource(pk);
        for (Authentication authentication : authentications) {
            LOG.debug("authenId:{}", authentication.getId());
            attributes.add(new SecurityConfig(AUTH_CODE_AUTHEN_PREFIX + authentication.getId()));
        }

        return attributes;
    }

    @Override
    public Collection<GrantedAuthority> getGrantedAuthorityByUser(Serializable userId) {
        LOG.debug("getGrantedAuthority...{}", userId);
        java.util.Set<GrantedAuthority> set = new java.util.HashSet<>();
        //查询菜单权限
        java.util.List<Screen> screens = this.mScreenMapper.findScreenByUser(userId);
        for (Screen screen : screens) {
            if (screen.getResourceId() != null && !screen.getResourceId().equals(0)) {
                LOG.debug("screenId:{}", screen.getId());
                set.add(new SimpleGrantedAuthority(AUTH_CODE_SCREEN_PREFIX + screen.getId()));
            }
        }

        //查询权限集合
        java.util.List<Authentication> authentications = this.mAuthenticationMapper.findAuthByUser(userId);
        for (Authentication authentication : authentications) {
            LOG.debug("authenId:{}", authentication.getId());
            set.add(new SimpleGrantedAuthority(AUTH_CODE_AUTHEN_PREFIX + authentication.getId()));
        }

        set.add(new SimpleGrantedAuthority(DEFAULT_AUTHENTICATION));

        return set;
    }
}
