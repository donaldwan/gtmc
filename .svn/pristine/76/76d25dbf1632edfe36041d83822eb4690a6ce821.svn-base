package cn.com.gtmc.glaf2.service.security;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.Authentication;

import java.io.Serializable;
import java.util.List;

public interface AuthenticationService extends BaseService {
    java.util.List<Authentication> findAuthByRole(java.io.Serializable roleId);

    /**
     * 根据菜单ID查询对应权限
     *
     * @param screenId 菜单ID
     * @return 权限
     */
    List<Authentication> findByScreen(java.io.Serializable screenId);

    /**
     * 添加权限资源
     *
     * @param authId 权限ID
     * @param ids    资源IDS
     */
    void addAuthResources(String authId, String[] ids);

    /**
     * 查询用户权限
     *
     * @param userId 用户ID
     * @return 权限
     */
    List<Authentication> findAuthByUser(Serializable userId);

    /**
     * 删除权限
     * @param id
     * @return
     */
	int deleteAuth(String[] ids);
}
