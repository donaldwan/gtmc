package cn.com.gtmc.glaf2.service.security.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.Authentication;
import cn.com.gtmc.glaf2.entity.security.Screen;
import cn.com.gtmc.glaf2.mapper.security.AuthenticationMapper;
import cn.com.gtmc.glaf2.mapper.security.RoleScreenMapper;
import cn.com.gtmc.glaf2.mapper.security.ScreenMapper;
import cn.com.gtmc.glaf2.service.security.ScreenService;
import cn.com.gtmc.glaf2.tools.log.Logger;


@Service
@Transactional
public class ScreenServiceImpl implements ScreenService {

    private static final Logger LOG = Logger.getLogger(ScreenServiceImpl.class);

    @Autowired
    private ScreenMapper mScreenMapper;

    @Autowired
    private AuthenticationMapper mAuthenticationMapper;
    
    @Autowired
    private RoleScreenMapper mRoleScreenMapper;

    public ScreenServiceImpl() {
        LOG.debug("ScreenServiceImpl init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.mScreenMapper;
    }

    @Override
    public List<Screen> findScreenByUser(Serializable userId) {
        java.util.List<Screen> screens = new java.util.ArrayList<>();

        java.util.List<Screen> userScreens = this.mScreenMapper.findScreenByUser(userId);

        for (Screen screen : userScreens) {
            if (screen.getParentId() == null || 0 == screen.getParentId()) {
                this.findChildren(screen, userScreens);
                screens.add(screen);
            }
        }

        return screens;
    }

    private void findChildren(Screen parent, java.util.List<Screen> screens) {
        java.util.List<Screen> children = new java.util.ArrayList<>();
        for (Screen screen : screens) {
            if (parent.getId().equals(screen.getParentId())) {
                children.add(screen);
                this.findChildren(screen, screens);
            }
        }
        parent.setIsParent(!children.isEmpty());
        parent.setChildren(children);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Screen> findAll() {
        java.util.List<Screen> orderScreens = new java.util.ArrayList<>();
        java.util.List<Screen> screens = this.mScreenMapper.findAll();

        for (Screen s : screens) {
            if (s.getParentId() == null || 0 == s.getParentId()) {
                s.setLevel(0);
                s.setAuths(this.mAuthenticationMapper.findAuthByScreen(s.getId()));
                orderScreens.add(s);
                this.setChildren(s, screens, 0, orderScreens);
            }
        }

        return orderScreens;
    }

    private void setChildren(Screen parent, java.util.List<Screen> screens, int level, java.util.List<Screen> orderScreens) {
        for (Screen s : screens) {
            if (parent.getId().equals(s.getParentId())) {
                parent.setIsParent(true);
                parent.setLeaf(false);
                s.setAuths(this.mAuthenticationMapper.findAuthByScreen(s.getId()));
                s.setLevel(level + 1);
                orderScreens.add(s);
                this.setChildren(s, screens, level + 1, orderScreens);
            }
        }
    }

    @Override
    public List<Screen> findScreenByRole(Serializable roleId) {
        java.util.List<Screen> screens = this.mScreenMapper.findScreenByRole(roleId);
        java.util.List<Authentication> authentications = this.mAuthenticationMapper.findAuthByRole(roleId);
        java.util.List<Screen> newScreens = new java.util.ArrayList<>();
        for (Screen s : screens) {
            java.util.List<Authentication> auths = new java.util.ArrayList<>();
            for (Authentication a : authentications) {
                if (s.getId().equals(a.getScreenId())) {
                    auths.add(a);
                }
            }
            s.setAuths(auths);
            newScreens.add(s);
        }
        return newScreens;
    }

    @Override
    public Screen findByScreenId(Serializable id) {
        return this.mScreenMapper.findByScreenId(id);
    }

    @Override
    public Screen findByParentId(Serializable id) {
        return this.mScreenMapper.findByParentId(id);
    }

    @Transactional
    @Override
    public void updateResource(Screen mScreen) {
        this.mScreenMapper.updateResource(mScreen);
    }

    @Transactional
	@Override
	public void delScreens(Integer id) {
		List<Integer> idList = new ArrayList<>();
        idList.add(id);
        Screen mScreen = this.mScreenMapper.findByScreenId(id);
        //删除子菜单
        while (null != mScreen) {
            try {
                LOG.debug("del-screen..id.." + mScreen.getId());
                idList.add(mScreen.getId());
                mScreen = this.mScreenMapper.findByParentId(mScreen.getId());
            } catch (Exception e) {
                LOG.debug("del-screen..error.." + e);
            }
        }
        //从其根节点开始删除
        for (int i = idList.size() - 1; i >= 0; i--) {
            List<Authentication> mAuthenticationList = mAuthenticationMapper.findByScreen(idList.get(i));
            //删除菜单下所有按钮权限
            for (int j = 0; j < mAuthenticationList.size(); j++) {
                //如果该按钮已经赋予给某个角色，则需要撤回这个角色的按钮权限
            	mAuthenticationMapper.delRoleAuthByAuthId(mAuthenticationList.get(j).getId());
                //撤回该按钮的所有资源
            	mAuthenticationMapper.delAuthResourceByAuthId(mAuthenticationList.get(j).getId());
                //最后再删除按钮权限
                this.mAuthenticationMapper.delete(mAuthenticationList.get(j).getId());
            }
            //从关联表u_role_screen中删除相关数据
            mRoleScreenMapper.delRoleScreenByScreen(idList.get(i));
            //最后再删除菜单
            this.mScreenMapper.delete(idList.get(i));
        }
	}
}
