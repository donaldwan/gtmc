package cn.com.gtmc.glaf2.mapper.security;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.Authentication;
import cn.com.gtmc.glaf2.entity.security.AuthenticationResource;

import java.io.Serializable;
import java.util.List;

public interface AuthenticationMapper extends BaseMapper {

    /**
     * 查询资源对应的权限
     *
     * @param resourceId resourceId
     * @return 资源对应的权限
     */
    java.util.List<Authentication> findAuthByResource(java.io.Serializable resourceId);

    /**
     * 查询用户对应的权限
     *
     * @param userId 用户ID
     * @return 用户对应的权限
     */
    java.util.List<Authentication> findAuthByUser(java.io.Serializable userId);

    /**
     * 查询某个菜单对应的权限
     *
     * @param screenId 菜单ID
     * @return 菜单对应的权限
     */
    java.util.List<Authentication> findAuthByScreen(java.io.Serializable screenId);

    /**
     * 查询角色对应的权限集合
     *
     * @param roleId 角色ID
     * @return 角色对应的权限集合
     */
    java.util.List<Authentication> findAuthByRole(java.io.Serializable roleId);

    /**
     * 查询菜单对应的权限
     *
     * @param screenId 菜单ID
     * @return 菜单对应的权限
     */
    List<Authentication> findByScreen(java.io.Serializable screenId);

    /**
     * 根据权限ID删除角色权限
     *
     * @param id 权限ID
     */
    void delRoleAuthByAuthId(Serializable id);

    /**
     * 根据权限ID删除权限资源
     *
     * @param id 权限ID
     */
    void delAuthResourceByAuthId(Serializable id);

    /**
     * 添加权限资源
     *
     * @param ar 权限资源
     */
    void addAuthResource(AuthenticationResource ar);

    /**
     * 查找权限资源
     *
     * @param ar 权限资源
     * @return 权限资源
     */
    List<AuthenticationResource> findResourceByAuth(AuthenticationResource ar);
}
