package cn.com.gtmc.glaf2.service.security.impl;

import cn.com.gtmc.glaf2.base.BaseEntity;
import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.Role;
import cn.com.gtmc.glaf2.entity.security.RoleAuthentication;
import cn.com.gtmc.glaf2.entity.security.RoleScreen;
import cn.com.gtmc.glaf2.mapper.security.RoleMapper;
import cn.com.gtmc.glaf2.notification.Notification;
import cn.com.gtmc.glaf2.notification.NotificationType;
import cn.com.gtmc.glaf2.service.security.RoleService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    private static final Logger LOG = Logger.getLogger(RoleServiceImpl.class);

    @Autowired
    private RoleMapper mRoleMapper;

    @Autowired(required = false)
    @Qualifier("wfNotification")
    private Notification mWfNotification;

    public RoleServiceImpl() {
        LOG.debug("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.mRoleMapper;
    }

    @Transactional
    @Override
    public void saveRoleScreenAuth(Role role) {
        this.mRoleMapper.deleteScreenByRole(role.getId());
        this.mRoleMapper.deleteAuthByRole(role.getId());

        if (!"".equals(Util.filter(role.getScreenIds()))) {
            RoleScreen rs = new RoleScreen();
            rs.setRoleId(role.getId());
            for (String id : role.getScreenIds().split(",")) {
                if (!"".equals(Util.filter(id))) {
                    rs.setScreenId(Integer.parseInt(id));
                    this.mRoleMapper.insertRoleScreen(rs);
                }
            }
        }

        if (!"".equals(Util.filter(role.getAuths()))) {
            RoleAuthentication ra = new RoleAuthentication();
            ra.setRoleId(role.getId());
            for (String id : role.getAuths().split(",")) {
                if (!"".equals(Util.filter(id))) {
                    ra.setAuthenticationId(Integer.parseInt(id));
                    this.mRoleMapper.insertRoleAuth(ra);
                }
            }
        }
    }

    @Transactional
    @Override
    public int delete(Serializable id) {
        this.mRoleMapper.deleteRoleUser(id);
        this.mRoleMapper.deleteScreenByRole(id);
        this.mRoleMapper.deleteAuthByRole(id);

        if (this.mWfNotification != null) {
            java.util.Map<String, Object> map = new java.util.HashMap<>();
            map.put("action", Notification.ACTION.GROUP);
            map.put("id", id.toString());
            map.put("prefix", Role.ROLE_PREFIX);
            this.mWfNotification.notification(NotificationType.DELETE, map);
        }

        return this.mRoleMapper.delete(id);
    }

    @Transactional
    @Override
    public <T extends BaseEntity<?>> int insert(T t) {
        Role role = (Role) t;
        this.getBaseMapper().insert(role);

        if (this.mWfNotification != null) {
            java.util.Map<String, Object> map = new java.util.HashMap<>();
            map.put("action", Notification.ACTION.GROUP);
            map.put("id", role.getId().toString());
            map.put("name", role.getRoleName());
            map.put("prefix", Role.ROLE_PREFIX);
            this.mWfNotification.notification(NotificationType.INSERT, map);
        }

        return 1;
    }
}
