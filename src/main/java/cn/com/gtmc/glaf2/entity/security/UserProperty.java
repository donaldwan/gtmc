package cn.com.gtmc.glaf2.entity.security;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

/**
 * 
 * @author gaoxiaodan
 *
 */
public class UserProperty extends DefaultIntegerEntity{
	private static final long serialVersionUID = -7965945262773271751L;
	
	/**
	 * 属性Code
	 */
	private String propertyCode;
	/**
	 * 属性名称
	 */
	private String propertyName;
	/**
	 * 属性值正则表达式
	 */
	private String regular;
	/**
	 * 属性值（用于查询用户属性值）
	 */
	private String propertyValue;
	
	public String getPropertyCode() {
		return propertyCode;
	}
	public void setPropertyCode(String propertyCode) {
		this.propertyCode = propertyCode;
	}
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public String getRegular() {
		return regular;
	}
	public void setRegular(String regular) {
		this.regular = regular;
	}
	public String getPropertyValue() {
		return propertyValue;
	}
	public void setPropertyValue(String propertyValue) {
		this.propertyValue = propertyValue;
	}
}