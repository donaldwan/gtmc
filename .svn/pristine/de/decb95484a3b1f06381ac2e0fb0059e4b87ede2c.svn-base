package cn.com.gtmc.glaf2.service.security;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.AuthenticationResource;
import cn.com.gtmc.glaf2.entity.security.Resource;

import java.util.List;

public interface ResourceService extends BaseService {

    /**
     * 根据权限，查找对应资源
     *
     * @param mAuthenticationResource 权限
     * @return 资源
     */
    List<Resource> findByAuthentication(AuthenticationResource mAuthenticationResource);

    /**
     * 根据菜单id，查询资源
     *
     * @param screenId 菜单id
     * @return 资源
     */
    Resource findByScreenId(String screenId);

    /**
     * 批量删除资源
     * @param ids
     * @return
     */
	int deleteResourceList(String[] ids);

}
