package cn.com.gtmc.glaf2.mapper.security;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.Screen;

import java.io.Serializable;

public interface ScreenMapper extends BaseMapper {

    /**
     * 查询资源对应的画面菜单
     *
     * @param resourceId resourceId
     * @return 画面菜单
     */
    java.util.List<Screen> findScreenByResource(java.io.Serializable resourceId);

    /**
     * 查询用户对应的菜单
     *
     * @param userId userId
     * @return 菜单
     */
    java.util.List<Screen> findScreenByUser(java.io.Serializable userId);

    /**
     * 查询角色对应的菜单权限
     *
     * @param roleId roleId
     * @return 菜单权限
     */
    java.util.List<Screen> findScreenByRole(java.io.Serializable roleId);

    /**
     * 查询菜单详情
     *
     * @param id ID
     * @return 菜单详情
     */
    Screen findByScreenId(Serializable id);

    /**
     * 根据父级ID查询子菜单详情
     *
     * @param id ID
     * @return 子菜单详情
     */
    Screen findByParentId(Serializable id);

    /**
     * 保存/修改菜单权限
     *
     * @param mScreen 菜单
     */
    void updateResource(Screen mScreen);
}
