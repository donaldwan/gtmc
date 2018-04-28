package cn.com.gtmc.glaf2.entity.security;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

public class Authentication extends DefaultIntegerEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8593719789070217660L;


	private Integer screenId;
	private String authName;
	private String authCode;
	private Screen screen;
	private Integer checked;
	private String roleId;

	public Integer getScreenId() {
		return screenId;
	}

	public void setScreenId(Integer screenId) {
		this.screenId = screenId;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public Integer getChecked() {
		return checked;
	}

	public void setChecked(Integer checked) {
		this.checked = checked;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public Screen getScreen() {
		return screen;
	}

	public void setScreen(Screen screen) {
		this.screen = screen;
	}
	
}
