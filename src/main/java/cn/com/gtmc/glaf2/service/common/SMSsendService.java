package cn.com.gtmc.glaf2.service.common;

import cn.com.gtmc.glaf2.base.BaseService;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SMSsendService
 * @Package cn.com.gtmc.glaf2.service.common
 * @Description:  
 * @date 2017年4月21日 上午11:25:30 
 */
public interface SMSsendService extends BaseService{
	
	/**
	 * 发送短信
	 * @param mobileNo  手机号码
	 * @param message   发送的短息内容
	 * @param smType    短信类型
	 * @param userId    发送人id
	 * @param flag      是否保存短信内容到数据库(true:保存,false:不保存)
	 * @return
	 */
	public boolean send(String mobileNo, String message, int smType,int userId,Boolean flag);
	
	
}
