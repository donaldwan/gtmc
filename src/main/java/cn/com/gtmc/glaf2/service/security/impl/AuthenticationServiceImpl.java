package cn.com.gtmc.glaf2.service.security.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.Authentication;
import cn.com.gtmc.glaf2.entity.security.AuthenticationResource;
import cn.com.gtmc.glaf2.mapper.security.AuthenticationMapper;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.security.AuthenticationService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

@Service
@Transactional
public class AuthenticationServiceImpl implements AuthenticationService {

    private static final Logger LOG = Logger.getLogger(AuthenticationServiceImpl.class);

    @Autowired
    private AuthenticationMapper mAuthenticationMapper;

    public AuthenticationServiceImpl() {
        LOG.debug("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.mAuthenticationMapper;
    }

    @Override
    public List<Authentication> findAuthByRole(java.io.Serializable roleId) {
        return this.mAuthenticationMapper.findAuthByRole(roleId);
    }

    @Override
    public List<Authentication> findByScreen(java.io.Serializable screenId) {
        return this.mAuthenticationMapper.findByScreen(screenId);
    }

    @Transactional
    @Override
    public void addAuthResources(String authId, String[] resources) {
    	
    	//删除权限资源
        this.mAuthenticationMapper.delAuthResourceByAuthId(authId);
        
        //新增权限资源
        java.util.Date date = new java.util.Date();
        LoginUser loginUser = this.getLoginUser();

        AuthenticationResource ar = new AuthenticationResource();
        ar.setAuthenticationId(authId);
        ar.setCreatedTime(date);
        ar.setCreatedUserId(loginUser.getId());
        ar.setCreatedUserName(loginUser.getUsername());

        for (int i = 0; i < resources.length; i++) {
            ar.setResourceId(resources[i]);
            java.util.List<AuthenticationResource> list = this.mAuthenticationMapper.findResourceByAuth(ar);
            if (list.isEmpty()) {
                this.mAuthenticationMapper.addAuthResource(ar);
            }
        }
    }

    @Override
    public List<Authentication> findAuthByUser(Serializable userId) {
        return this.mAuthenticationMapper.findAuthByUser(userId);
    }

    /**
     * 删除权限
     */
    @Transactional
	@Override
	public int deleteAuth(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
            try {
                //如果该按钮已经赋予给某个角色，则需要撤回这个角色的按钮权限
                mAuthenticationMapper.delRoleAuthByAuthId(ids[i]);
                //撤回该按钮的所有资源
                mAuthenticationMapper.delAuthResourceByAuthId(ids[i]);
                //最后再删除按钮权限
                this.mAuthenticationMapper.delete(ids[i]);
            } catch (Exception e) {
                LOG.error("delAuth error!", e);
            }
        }
		return 1;
	}

}
