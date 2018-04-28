package cn.com.gtmc.glaf2.service.security;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.Screen;

public interface ScreenService extends BaseService {

    /**
     * 查询某个用户对应的所有菜单
     *
     * @param userId userId
     * @return 所有菜单
     */
    java.util.List<Screen> findScreenByUser(java.io.Serializable userId);


    /**
     * 查询角色对应的权限
     *
     * @param roleId roleId
     * @return 权限
     */
    java.util.List<Screen> findScreenByRole(java.io.Serializable roleId);

    /**
     * 查询菜单详情
     *
     * @param id id
     * @return 菜单详情
     */
    Screen findByScreenId(java.io.Serializable id);

    /**
     * 根据父级ID查询子菜单详情
     *
     * @param id ID
     * @return 子菜单详情
     */
    Screen findByParentId(java.io.Serializable id);


    /**
     * 保存/修改菜单权限
     *
     * @param mScreen 菜单
     */
    void updateResource(Screen mScreen);

    /**
     * 删除菜单
     * @param id
     */
	void delScreens(Integer id);

}
