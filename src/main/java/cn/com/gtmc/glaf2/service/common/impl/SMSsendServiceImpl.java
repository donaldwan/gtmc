package cn.com.gtmc.glaf2.service.common.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.common.SMSsend;
import cn.com.gtmc.glaf2.mapper.common.SMSsendMapper;
import cn.com.gtmc.glaf2.service.common.SMSsendService;
import cn.com.gtmc.glaf2.tools.log.Logger;
/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SMSsendServiceImpl
 * @Package cn.com.gtmc.glaf2.service.common.impl
 * @Description:  
 * @date 2017年4月21日 上午11:26:49 
 */
@Service
@Transactional
public class SMSsendServiceImpl implements SMSsendService{

	private static final Logger LOG = Logger.getLogger(SMSsendServiceImpl.class);
	
	@Autowired
	private SMSsendMapper smssendmapper;
	
	public SMSsendServiceImpl(){
		LOG.info("init...");
	}
	
	@Override
	public BaseMapper getBaseMapper() {
		return this.smssendmapper;
	}
	
	@Override
	public boolean send(String mobileNo, String message, int smType,int userId,Boolean flag){
		LOG.info("开始发送:" + "发送号码：" + mobileNo + "，发送内容：" + message + "");
		System.out.println("开始发送:" + "发送号码：" + mobileNo + "，发送内容：" + message + "");
		Boolean send = false;
		String targetEendPoint = "";
		String sendSmsMessageMethod = "";
		//读取配置文件配置信息
		Properties prop =  new  Properties();   
        InputStream in = this.getClass().getClassLoader().getResourceAsStream("config.properties");    
         try{  
            prop.load(in);
            //webservice地址
            targetEendPoint = prop.getProperty("sendMessage.targetEendPoint").trim(); 
            //设置方法名 
            sendSmsMessageMethod = prop.getProperty("sendMessage.sendSmsMessageMethod").trim(); 
            
            if((null != targetEendPoint || !"".equals(targetEendPoint)) || (null != sendSmsMessageMethod || !"".equals(sendSmsMessageMethod))){
            	org.apache.axis.client.Service service = new org.apache.axis.client.Service();
    			org.apache.axis.client.Call call = (org.apache.axis.client.Call) service.createCall();
    			call.setTargetEndpointAddress(new java.net.URL(targetEendPoint));
    			call.setOperationName(new javax.xml.namespace.QName(
    					targetEendPoint, sendSmsMessageMethod));// 设置方法名
    			System.out.println("send1:" + send);
    			send = (Boolean) call.invoke(new Object[] { mobileNo, message,// 短信内容
    					smType, userId });// 短信类型，用户ID
    			System.out.println("send2:" + send);
    			if(send && flag){
    				SMSsend t =  new SMSsend();
    				t.setMobileNo(mobileNo);
    				t.setContent(message);
    				int result = insert(t);
    				if(result < 1){
    					LOG.info("写入数据失败...");
    					LOG.info("发送号码：" + mobileNo + "，发送内容：" + message);
    				}
    			}
    			System.out.println("结束发送:" + "发送号码：" + mobileNo + "，发送内容：" + message + "，返回状态：" + send);
    			LOG.info("结束发送:" + "发送号码：" + mobileNo + "，发送内容：" + message + "，返回状态：" + send);
            	
            }
            
        }catch (Exception e) {
        	e.printStackTrace();
			LOG.info("发送号码：" + mobileNo + "，发送内容：" + message + "，返回状态：" + send,e);
			send = false;
		}finally {
        	try {
    			if(in!=null){
    				in.close();
    				in = null;
    			}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return send;
	}
	
}
