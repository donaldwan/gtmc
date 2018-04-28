package cn.com.gtmc.glaf2.mapper.security;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.RoleAuthentication;
import cn.com.gtmc.glaf2.entity.security.RoleScreen;

public interface RoleMapper extends BaseMapper {
    /**
     * 删除角色对应的权限
     *
     * @param roleId 角色ID
     * @return 结果
     */
    int deleteScreenByRole(java.io.Serializable roleId);

    /**
     * 删除角色对应的全量权限
     *
     * @param roleId 角色ID
     * @return 结果
     */
    int deleteAuthByRole(java.io.Serializable roleId);

    /**
     * 添加角色和菜单的对应关系
     *
     * @param roleScreen 角色和菜单
     * @return 结果
     */
    int insertRoleScreen(RoleScreen roleScreen);

    /**
     * 添加角色对应的按钮权限
     *
     * @param roleAuthentication 角色对应的按钮权限
     * @return 结果
     */
    int insertRoleAuth(RoleAuthentication roleAuthentication);

    /**
     * 删除角色和用户的对应关系
     *
     * @param roleId 角色ID
     * @return 结果
     */
    int deleteRoleUser(java.io.Serializable roleId);
}
