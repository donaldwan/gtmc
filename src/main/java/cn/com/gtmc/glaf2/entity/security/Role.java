package cn.com.gtmc.glaf2.entity.security;

import com.fasterxml.jackson.annotation.JsonIgnore;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

public class Role extends DefaultIntegerEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7451636899053316545L;
	
	public static final String ROLE_PREFIX = "R_";
	
	private String roleName;
	private String roleCode;
	private String roleRemark;		
	
	@JsonIgnore
	private String screenIds;
	
	@JsonIgnore
	private String auths;
	
	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleRemark() {
		return roleRemark;
	}

	public void setRoleRemark(String roleRemark) {
		this.roleRemark = roleRemark;
	}

	public String getScreenIds() {
		return screenIds;
	}

	public void setScreenIds(String screenIds) {
		this.screenIds = screenIds;
	}

	public String getAuths() {
		return auths;
	}

	public void setAuths(String auths) {
		this.auths = auths;
	}
	
	
}
