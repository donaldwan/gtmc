package cn.com.gtmc.glaf2.mapper.security;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.AuthenticationResource;
import cn.com.gtmc.glaf2.entity.security.Resource;

public interface ResourceMapper extends BaseMapper {
    /**
     * 根据权限，查找对应资源
     *
     * @param authenticationResource 权限
     * @return 资源
     */
    java.util.List<Resource> findByAuthentication(AuthenticationResource authenticationResource);

    /**
     * 根据菜单id，查询资源
     *
     * @param screenId 菜单id
     * @return 资源
     */
    Resource findByScreenId(String screenId);
}
