package cn.com.gtmc.glaf2.service.security.impl;

import cn.com.gtmc.glaf2.base.BaseEntity;
import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.*;
import cn.com.gtmc.glaf2.mapper.security.DeptTempMapper;
import cn.com.gtmc.glaf2.mapper.security.UserMapper;
import cn.com.gtmc.glaf2.mapper.security.UserPropertyMapper;
import cn.com.gtmc.glaf2.mapper.security.UserTempMapper;
import cn.com.gtmc.glaf2.notification.Notification;
import cn.com.gtmc.glaf2.notification.NotificationType;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.security.User2Service;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.Page;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * 系统用户
 *
 * @author intasect
 */

@Transactional
@Service
public class UserService2Impl implements User2Service {

    private static final Logger LOG = Logger.getLogger(UserService2Impl.class);
    private static final String ACTION = "action";
    private static final String USER_ID = "userId";
    private static final String GROUP_ID = "groupId";
    private static final String PREFIX = "prefix";

    @Autowired
    private UserMapper mUserMapper;
    @Autowired
    private UserPropertyMapper userPropertyMapper;
    @Autowired(required = false)
    @Qualifier("wfNotification")
    private Notification mWfNotification;
    @Autowired
    private UserTempMapper userTempMapper;
    @Autowired
    private DeptTempMapper deptTempMapper;

    public UserService2Impl() {
        LOG.debug("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.mUserMapper;
    }

    @Transactional
    @Override
    public <T extends BaseEntity<?>> int insert(T t) {
        User user = (User) t;
        user.setLoginPass(Util.MD5("123456"));
        user.setLoginName(user.getEmpCode());
        user.setStatus(BaseEntity.Status.A);
        this.getBaseMapper().insert(user);

        //判断工程是否启用了工作流，如果是，需要将用户信息同步到同工作流引擎的相关表中
        if (this.mWfNotification != null) {
            java.util.Map<String, Object> map = new java.util.HashMap<>();
            map.put(ACTION, Notification.ACTION.USER);
            map.put("id", user.getId().toString());
            map.put("name", user.getUsername());
            map.put("email", user.getEmail());
            map.put("password", user.getPassword());
            this.mWfNotification.notification(NotificationType.INSERT, map);

            //同步用户与部门的关联关系
            if (!StringUtils.isBlank(user.getDeptId())) {
                map.clear();
                map.put(ACTION, Notification.ACTION.MEMBERSHIP);
                map.put(USER_ID, user.getId());
                map.put(GROUP_ID, user.getDeptId());
                map.put(PREFIX, Dept.GROUP_PREFIX);
                this.mWfNotification.notification(NotificationType.INSERT, map);
            }
        }

        //新增或修改用户属性值
        List<UserPropertyValue> userPropertyValueList = user.getUserPropertyValueList();
        for (int i = 0; i < userPropertyValueList.size(); i++) {
            UserPropertyValue userPropertyValue = new UserPropertyValue();
            userPropertyValue.setUserId(user.getId());
            userPropertyValue.setPropertyId(userPropertyValueList.get(i).getPropertyId());
            userPropertyValue.setPropertyValue(userPropertyValueList.get(i).getPropertyValue());
            userPropertyMapper.insertUserPropertyValue(userPropertyValue);
        }
        return 1;
    }

    @Transactional
    @Override
    public <T extends BaseEntity<?>> int update(T t) {
        User user = (User) t;
        if (this.mWfNotification != null) {
            User dbUser = this.getBaseMapper().findById(user.getId());
            if (!StringUtils.isBlank(dbUser.getDeptId())) {
                java.util.Map<String, Object> map = new java.util.HashMap<>();
                map.put(USER_ID, user.getId());
                map.put(GROUP_ID, dbUser.getDeptId());
                map.put(PREFIX, Dept.GROUP_PREFIX);
                map.put(ACTION, Notification.ACTION.MEMBERSHIP);
                this.mWfNotification.notification(NotificationType.DELETE, map);
            }

            if (!StringUtils.isBlank(user.getDeptId())) {
                java.util.Map<String, Object> map = new java.util.HashMap<>();
                map.clear();
                map.put(ACTION, Notification.ACTION.MEMBERSHIP);
                map.put(USER_ID, user.getId());
                map.put(GROUP_ID, user.getDeptId());
                map.put(PREFIX, Dept.GROUP_PREFIX);
                this.mWfNotification.notification(NotificationType.INSERT, map);
            }
        }
        this.getBaseMapper().update(user);

        userPropertyMapper.deleteUserPropertyValue(user.getPK());

        //新增或修改用户属性值（先删后增）
        List<UserPropertyValue> userPropertyValueList = user.getUserPropertyValueList();
        for (int i = 0; i < userPropertyValueList.size(); i++) {
            UserPropertyValue userPropertyValue = new UserPropertyValue();
            userPropertyValue.setUserId(user.getId());
            userPropertyValue.setPropertyId(userPropertyValueList.get(i).getPropertyId());
            userPropertyValue.setPropertyValue(userPropertyValueList.get(i).getPropertyValue());
            userPropertyMapper.insertUserPropertyValue(userPropertyValue);
        }
        return 1;
    }


    /**
     * 查询用户角色
     */
    @Override
    public List<UserRole> findUserRole(Serializable id) {
        return this.mUserMapper.findUserRole(id);
    }

    @Transactional
    @Override
    public int deleteUserRole(Serializable id) {
        if (this.mWfNotification != null) {
            java.util.Map<String, Object> map = new java.util.HashMap<>();
            map.put(ACTION, Notification.ACTION.MEMBERSHIP);
            map.put(USER_ID, id);
            this.mWfNotification.notification(NotificationType.DELETE, map);
        }

        return this.mUserMapper.deleteUserRole(id);
    }

    /**
     * 保存用户角色
     */
    @Override
    @Transactional
    public int saveUserRole(List<UserRole> userRoleList) {

        //删除用户角色
        deleteUserRole(userRoleList.get(0).getUserId());
        //新增用户角色
        LoginUser loginUser = this.getLoginUser();
        for (int i = 0; i < userRoleList.size(); i++) {
            userRoleList.get(i).setCreatedUserId(loginUser.getId());
            userRoleList.get(i).setCreatedTime(new Date());
            userRoleList.get(i).setCreatedUserName(loginUser.getUsername());

            if (this.mWfNotification != null) {
                // #4 bug fix
                // 修复不能重复添加同一角色的问题
                java.util.Map<String, Object> map = new java.util.HashMap<>();
                map.put(ACTION, Notification.ACTION.MEMBERSHIP);
                map.put(USER_ID, userRoleList.get(i).getUserId());
                map.put(GROUP_ID, userRoleList.get(i).getRoleId());
                map.put(PREFIX, Role.ROLE_PREFIX);
                this.mWfNotification.notification(NotificationType.DELETE, map);

                map.clear();
                map.put(ACTION, Notification.ACTION.MEMBERSHIP);
                map.put(USER_ID, userRoleList.get(i).getUserId());
                map.put(GROUP_ID, userRoleList.get(i).getRoleId());
                map.put(PREFIX, Role.ROLE_PREFIX);
                this.mWfNotification.notification(NotificationType.INSERT, map);
            }
            this.mUserMapper.saveUserRole(userRoleList.get(i));
        }
        return ReturnMessage.ResultCode.OK;
    }

    /**
     * 修改用户登录密码
     */
    @Transactional
    @Override
    public void updateLoginPassword(String newLoginPassword, Integer userId, Date pwdChangeTime) {
        this.mUserMapper.updateLoginPassword(newLoginPassword, userId, pwdChangeTime);
    }


    @Override
    public HashMap<String, Object> findCustomPage(User user, List<UserProperty> userPropertyList) {
        HashMap<String, Object> pageMap = new HashMap<>();
        List<HashMap<String, Object>> rows = this.mUserMapper.findCustomPage(user, userPropertyList);
        pageMap.put("rows", rows);

        int totalRecord = this.mUserMapper.findCustomTotalPage(user);
        pageMap.put("records", totalRecord);
        pageMap.put("page", user.getPage());
        int totalPage = totalRecord / user.getRows();
        if (totalRecord % user.getRows() == 0) {
            pageMap.put("total", totalPage);
        } else {
            pageMap.put("total", totalPage + 1);
        }
        return pageMap;
    }

    /**
     * 分页查询
     *
     * @param userMap 条件
     * @return 分页查询结果
     */
    public Page<HashMap<String, Object>> findCustomPage2(HashMap<String, Object> userMap) {

        Page<HashMap<String, Object>> pageMap = new Page<>();
        pageMap.setObject(userMap);
        pageMap.setRows(this.mUserMapper.findCustomPage2(pageMap));
        pageMap.setObject(null);
        return pageMap;
    }

    @Override
    public void syncUserInfo() {
        //根据login_name查询用户信息，
        List<UserTemp> userTemps = userTempMapper.findAll();
        int i = 0;
        int size = userTemps.size();
        for (; i < size; i++) {
            UserTemp userTemp = userTemps.get(i);
            User user = mUserMapper.findByLoginName(userTemp.getLoginName());
            DeptTemp deptTemp = deptTempMapper.findById(userTemp.getDeptId());
            //System.out.println("userTemp.getDeptId() = " + userTemp.getDeptId() + " deptTemp =" + deptTemp);
            if (user == null) {//不存在用户,添加用户
                user = new User();
                user.setLoginPass(Util.MD5("123456"));

                if (deptTemp != null && deptTemp.getDeptId() != null) {
                    user.setDeptId(deptTemp.getDeptId() + "");
                    user.setDeptName(deptTemp.getDeptName());
                }
                user.setLoginName(userTemp.getLoginName());
                user.setEmpCode(userTemp.getEmpCode());
                if (userTemp.getName() == null) {
                    user.setName("");
                } else {
                    user.setName(userTemp.getName());
                }
                if (userTemp.getSex() == null) {
                    user.setSex("");
                } else {
                    user.setSex(userTemp.getSex());
                }
                user.setTelephone(userTemp.getTelephone());
                user.setMobile(userTemp.getMobile());
                if (userTemp.getEmail() == null) {
                    user.setEmail("");
                } else {
                    user.setEmail(userTemp.getEmail());
                }
                user.setStatus(userTemp.getStatus());
                this.getBaseMapper().insert(user);
            } else {//存在用户，修改信息
                boolean flag = false;
                //目前依临时表数据
                if (userTemp.getDeptId() != null && !"".equals(userTemp.getDeptId())) {//部门id
                    if (deptTemp != null && !deptTemp.getDeptId().equals(user.getDeptId())) {
                        user.setDeptId(deptTemp.getDeptId() + "");
                        user.setDeptName(deptTemp.getDeptName());
                        flag = true;
                    }
                }

                if (userTemp.getLoginName() != null && !"".equals(userTemp.getLoginName())) {
                    if (!userTemp.getLoginName().equals(user.getLoginName())) {
                        user.setLoginName(userTemp.getLoginName());
                        flag = true;
                    }
                }
                if (userTemp.getEmpCode() != null && !"".equals(userTemp.getEmpCode())) {
                    if (!userTemp.getEmpCode().equals(user.getEmpCode())) {
                        user.setEmpCode(userTemp.getEmpCode());
                        flag = true;
                    }
                }

                if (userTemp.getName() != null && !"".equals(userTemp.getName())) {
                    if (!userTemp.getName().equals(user.getName())) {
                        user.setName(userTemp.getName());
                        flag = true;
                    }
                }
                if (userTemp.getSex() != null && !"".equals(userTemp.getSex())) {
                    if (!userTemp.getSex().equals(user.getSex())) {
                        user.setSex(userTemp.getSex());
                        flag = true;
                    }
                }
                if (user.getTelephone() != null && !"".equals(user.getTelephone())) {
                    if (!userTemp.getTelephone().equals(user.getTelephone())) {
                        user.setTelephone(userTemp.getTelephone());

                    }
                }
                if (user.getMobile() != null && !"".equals(user.getMobile())) {
                    if (!userTemp.getMobile().equals(user.getMobile())) {
                        user.setMobile(userTemp.getMobile());
                        flag = true;
                    }
                }
                if (user.getEmail() != null && !"".equals(user.getEmail())) {
                    if (!userTemp.getEmail().equals(user.getEmail())) {
                        user.setEmail(userTemp.getEmail());
                        flag = true;
                    }
                }
                if (user.getStatus() != null && !"".equals(user.getStatus())) {
                    if (!userTemp.getStatus().equals(user.getStatus())) {
                        user.setStatus(userTemp.getStatus());
                        flag = true;
                    }
                }
                this.getBaseMapper().update(user);
            }
        }
    }
}
