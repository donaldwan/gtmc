package cn.com.gtmc.glaf2.entity.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

/**
 * 
 * @author chenwandong
 *
 */
public class User extends DefaultIntegerEntity implements LoginUser{
	
	private static final long serialVersionUID = -3513874558277546590L;
	
	private Collection<GrantedAuthority> authorities=null;
	
	private String deptId;
	private String deptName;
	private String loginName;
	private String loginPass;
	private String empCode;
	private String name;
	private String sex;
	private String telephone;
	private String mobile;
	private String email;
	private String userType;
	
	private Date pwdChangeTime;
	
	private List<UserPropertyValue> userPropertyValueList = new ArrayList<>(); 
	
	@SuppressWarnings("unchecked")
	@Override
	public Integer getId() {
		return super.getId();
	}
	
	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPass() {
		return loginPass;
	}

	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}


	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getPwdChangeTime() {
		return pwdChangeTime;
	}

	public void setPwdChangeTime(Date pwdChangeTime) {
		this.pwdChangeTime = pwdChangeTime;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return authorities;
	}

	public void setAuthorities(Collection<GrantedAuthority> authorities){
		
		this.authorities = authorities;
		
	}
	
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.getLoginPass();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.name;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	
	private java.util.List<Group> groups = new java.util.ArrayList<Group>();
	
	public void setGroups(java.util.List<Group> groups) {
		this.groups = groups;
	}

	@Override
	public List<Group> getGroups() {
		return this.groups;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getGroupIds() {
		java.util.List<String> ids = new java.util.ArrayList<String>();
		for(Group group : this.groups){
			ids.add(String.format("%s%s",group.getPrefix(),group.getId()));
		}
		return ids;
	}

	public List<UserPropertyValue> getUserPropertyValueList() {
		return userPropertyValueList;
	}

	public void setUserPropertyValueList(List<UserPropertyValue> userPropertyValueList) {
		this.userPropertyValueList = userPropertyValueList;
	}

}