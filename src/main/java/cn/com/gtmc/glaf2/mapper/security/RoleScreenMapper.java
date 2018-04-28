package cn.com.gtmc.glaf2.mapper.security;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.RoleScreen;

import java.util.List;

public interface RoleScreenMapper extends BaseMapper {
    int delRoleScreenByRoleAndScreen(RoleScreen roleScreen);

    List<RoleScreen> findScreenByRole(RoleScreen roleScreen);

    void delRoleScreenByRole(String roleId);

    void delRoleScreenByScreen(java.io.Serializable screenId);

}
