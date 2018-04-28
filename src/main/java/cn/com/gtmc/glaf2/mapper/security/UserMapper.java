package cn.com.gtmc.glaf2.mapper.security;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.LogLogin;
import cn.com.gtmc.glaf2.entity.security.User;
import cn.com.gtmc.glaf2.entity.security.UserProperty;
import cn.com.gtmc.glaf2.entity.security.UserRole;
import cn.com.gtmc.glaf2.tools.web.Page;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface UserMapper extends BaseMapper {

    User findByLoginName(String loginName);

    int saveUserRole(UserRole userRole);

    List<UserRole> findUserRole(Serializable id);

    int deleteUserRole(Serializable id);

    /**
     * 添加登录日志
     *
     * @param log log
     * @return 结果
     */
    int insertLoginLog(LogLogin log);

    /**
     * 修改用户登录密码
     *
     * @param newLoginPassword newLoginPassword
     * @param userId           userId
     * @param pwdChangeTime    pwdChangeTime
     */
    void updateLoginPassword(String newLoginPassword, Integer userId, Date pwdChangeTime);
    
    List<HashMap<String, Object>> findCustomPage(@Param("user")User user,@Param("userPropertyList")List<UserProperty> userPropertyList);

    int findCustomTotalPage(User user);

    /**
     * 分页查询
     * @param page page
     * @return List<T>
     */
    List<HashMap<String, Object>> findCustomPage2(Page<HashMap<String, Object>> page);
}
