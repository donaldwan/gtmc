package cn.com.gtmc.glaf2.entity.security;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

public class RoleAuthentication extends DefaultIntegerEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4712715738633076955L;

	private Integer roleId;

	private Integer authenticationId;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getAuthenticationId() {
		return authenticationId;
	}

	public void setAuthenticationId(Integer authenticationId) {
		this.authenticationId = authenticationId;
	}
	
	
}
