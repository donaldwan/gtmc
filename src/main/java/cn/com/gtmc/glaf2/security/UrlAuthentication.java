package cn.com.gtmc.glaf2.security;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.core.GrantedAuthority;

public interface UrlAuthentication {

    /**
     * 加载所有的资源权限
     */
    void loadUrlAuthentication();

    /**
     * 查询资源对应的权限
     *
     * @param url url
     * @return 资源对应的权限
     */
    java.util.Collection<ConfigAttribute> getAuthenticationByUrl(String url);

    /**
     * 查询用户对应的权限
     *
     * @param userId userId
     * @return 用户对应的权限
     */
    java.util.Collection<GrantedAuthority> getGrantedAuthorityByUser(java.io.Serializable userId);
}
