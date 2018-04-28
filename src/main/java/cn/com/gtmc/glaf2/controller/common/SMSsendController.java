package cn.com.gtmc.glaf2.controller.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.common.SMSsend;
import cn.com.gtmc.glaf2.entity.common.SysCalendar;
import cn.com.gtmc.glaf2.service.common.SMSsendService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SMSsendController
 * @Package cn.com.gtmc.glaf2.controller.common
 * @Description:  
 * @date 2017年7月20日 上午11:56:51 
 */
@Controller
@RequestMapping("common/sendMessage")
public class SMSsendController implements BaseController<SMSsend>{

	private  static final Logger LOG = Logger.getLogger(SMSsendController.class);
	
	@Autowired
	private SMSsendService sendService;
	
	public SMSsendController(){
		LOG.info("init...");
	}
	
	@Override
	public BaseService getService() {
		return this.sendService;
	}

	
	
	
	@RequestMapping(value="send")
	@ResponseBody
	public ReturnMessage sendMessage(SMSsend sms){
		logger.debug("sendMessage...");
		int smType = 551;
		int userId = 12346;
		boolean flag = true;
		System.out.println(sms.getMobileNo() + " : "+ sms.getContent());
		boolean result = sendService.send(sms.getMobileNo(), sms.getContent(), smType, userId, flag);
		if(result){
			return this.ok();
		}else{
			return this.error();
		}
	}
	
	
}
