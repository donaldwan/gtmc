package cn.com.gtmc.glaf2.service.security.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.RoleScreen;
import cn.com.gtmc.glaf2.mapper.security.RoleScreenMapper;
import cn.com.gtmc.glaf2.service.security.RoleScreenService;

@Transactional
@Service
public class RoleScreenServiceImpl implements RoleScreenService {
	
	@Autowired
	private RoleScreenMapper mRoleScreenMapper;
	
	@Override
	public BaseMapper getBaseMapper() {
		// TODO Auto-generated method stub
		return this.mRoleScreenMapper;
	}

	@Transactional
	@Override
	public void delRoleScreenByRoleAndScreen(RoleScreen roleScreen) {
		// TODO Auto-generated method stub
		this.mRoleScreenMapper.delRoleScreenByRoleAndScreen(roleScreen);
	}

	@Transactional
	@Override
	public void addRoleScreen(RoleScreen roleScreen) {
		java.util.List<RoleScreen> list = this.mRoleScreenMapper.findScreenByRole(roleScreen);
		if(list.size()==0){
			this.mRoleScreenMapper.insert(roleScreen);
		}	
	}
	
	@Transactional
	@Override
	public void delRoleScreenByRole(String roleId) {
		// TODO Auto-generated method stub
		this.mRoleScreenMapper.delRoleScreenByRole(roleId);
	}

	@Transactional
	@Override
	public void delRoleScreenByScreen(Serializable screenId) {
		// TODO Auto-generated method stub
		mRoleScreenMapper.delRoleScreenByScreen(screenId);
	}

}
