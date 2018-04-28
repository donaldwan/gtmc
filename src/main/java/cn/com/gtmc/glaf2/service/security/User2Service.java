package cn.com.gtmc.glaf2.service.security;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.User;
import cn.com.gtmc.glaf2.entity.security.UserProperty;
import cn.com.gtmc.glaf2.entity.security.UserRole;
import cn.com.gtmc.glaf2.tools.web.Page;


public interface User2Service extends BaseService {

    /**
     * 保存用户角色
     *
     * @param userRoleList userRoleList
     * @return 结果
     */
    int saveUserRole(List<UserRole> userRoleList);

    /**
     * 查询用户角色
     *
     * @param id 用户ID
     * @return 用户角色
     */
    List<UserRole> findUserRole(Serializable id);

    /**
     * 删除用户角色
     *
     * @param id 用户ID
     * @return 结果
     */
    int deleteUserRole(Serializable id);

    /**
     * 修改用户登录密码
     *
     * @param newLoginPassword newLoginPassword
     * @param userId           userId
     * @param pwdChangeTime    pwdChangeTime
     */
    void updateLoginPassword(String newLoginPassword, Integer userId, Date pwdChangeTime);
    
    /**
 	 * 自定义分页查询
 	 * @param userProperty
 	 * @return
 	 */
 	public HashMap<String, Object> findCustomPage(User user,List<UserProperty> userPropertyList);
 	
 	/**
 	 * 自定义分页查询2
 	 * @param userProperty
 	 * @return
 	 */
 	public Page<HashMap<String, Object>> findCustomPage2(HashMap<String, Object> userMap);

 	
 	/**
     * 从userTemp表同步用户信息
     */
    public void syncUserInfo();
 	
}
