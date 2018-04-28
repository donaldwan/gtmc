package cn.com.gtmc.glaf2.entity.common;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SMSsend  
 * @Package cn.com.gtmc.glaf2.entity.common
 * @Description:  发送短信实体类
 * @date 2017年4月21日 上午11:12:34 
 */
public class SMSsend extends DefaultIntegerEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2415524241481273759L;
	public SMSsend(){
		
	}
	public SMSsend(String mobileNo,String content){
		this.mobileNo = mobileNo;
	    this.content = content;	
	}
	//手机号
	private String mobileNo;
	
	//内容
	private String content;
	
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
