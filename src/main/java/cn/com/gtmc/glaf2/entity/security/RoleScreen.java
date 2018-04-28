package cn.com.gtmc.glaf2.entity.security;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

public class RoleScreen extends DefaultIntegerEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4043900841073513817L;

	private Integer roleId;
	private Integer screenId;
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getScreenId() {
		return screenId;
	}
	public void setScreenId(Integer screenId) {
		this.screenId = screenId;
	}

	
}
