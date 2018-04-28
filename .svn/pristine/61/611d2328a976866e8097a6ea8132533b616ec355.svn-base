package cn.com.gtmc.glaf2.service.common.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;

import cn.com.gtmc.glaf2.service.common.ScheduleJobWebService;
import cn.com.gtmc.glaf2.tools.web.Page;
import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.job.ScheduleJob;
import cn.com.gtmc.glaf2.entity.security.User;
import cn.com.gtmc.glaf2.http.HttpUtil;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.security.token.Constant;
import cn.com.gtmc.glaf2.security.token.JwtUtil;

/**
 * WebJob服务类
 *
 * @author LiHuaiJun
 */
@Service
@Transactional
public class ScheduleJobWebServiceImpl implements ScheduleJobWebService{

	@Autowired
	private JwtUtil jwt;
	
	@Override
	public String executeRequest(String jobUrl, String method, ScheduleJob scheduleJob) {
		// TODO Auto-generated method stub
		String token = createToken();
		User user = (User) LoginUser.getLoginUser();
		
		if(Constant.URL_CHANGE_STATUS.equals(method)){
			List<NameValuePair> jobList = new ArrayList<NameValuePair>();
			jobList.add(new BasicNameValuePair("id",scheduleJob.getId()));
			jobList.add(new BasicNameValuePair("status",scheduleJob.getStatus()));
			jobList.add(new BasicNameValuePair("token",token));
			jobList.add(new BasicNameValuePair("loginName",user.getLoginName()));
			return HttpUtil.post(jobUrl + method, jobList);
		}else if(Constant.URL_TRIGGER.equals(method)){
			List<NameValuePair> jobList = new ArrayList<NameValuePair>();
			jobList.add(new BasicNameValuePair("id",scheduleJob.getId()));
			jobList.add(new BasicNameValuePair("trigger",String.valueOf(scheduleJob.isTrigger())));
			jobList.add(new BasicNameValuePair("token",token));
			jobList.add(new BasicNameValuePair("loginName",user.getLoginName()));
			return HttpUtil.post(jobUrl + method, jobList);
		}else if(Constant.URL_SAVE.equals(method)){
			List<NameValuePair> jobList = new ArrayList<NameValuePair>();
			jobList.add(new BasicNameValuePair("id",scheduleJob.getId()));
			jobList.add(new BasicNameValuePair("jobName",scheduleJob.getJobName()));
			jobList.add(new BasicNameValuePair("jobType",scheduleJob.getJobType()));
			jobList.add(new BasicNameValuePair("jobObject",scheduleJob.getJobObject()));
			jobList.add(new BasicNameValuePair("cronExpression",scheduleJob.getCronExpression()));			
			jobList.add(new BasicNameValuePair("token",token));
			jobList.add(new BasicNameValuePair("loginName",user.getLoginName()));			
			return HttpUtil.post(jobUrl + method, jobList);
		}
		
		return "";
	}
	
	private String createToken(){
		User user = (User) LoginUser.getLoginUser();
		Map<String, Object> claims = JwtUtil.generateClaims(user);
		String token = "";
		String refreshToken = "";
		try {
			token = jwt.createJWT(Constant.JWT_ID, claims, Constant.JWT_TTL);
			refreshToken = jwt.createJWT(Constant.JWT_ID, claims, Constant.JWT_REFRESH_TTL);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return token;
	}

	@Override
	public BaseMapper getBaseMapper() {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<T> executeRequest(String jobUrl, String method, T t) {
		User user = (User) LoginUser.getLoginUser();
		String token = createToken();
		// TODO Auto-generated method stub		
		if(Constant.URL_FIND_PAGE.equals(method)){
			StringBuffer url = new StringBuffer();
			url.append(jobUrl).append(method).append("?loginName=").append(user.getLoginName())
				.append("&token=").append(token).append("&t").append(t);
			String response = HttpUtil.get(url.toString());
			return (Page<T>)JSON.parseObject(response, Page.class);
		}
		return null;
	}

	@Override
	public Map executeEdit(String jobUrl, String method, Serializable id) {
		User user = (User) LoginUser.getLoginUser();
		String token = createToken();
		// TODO Auto-generated method stub
		if(Constant.URL_EDIT.equals(method)){
			StringBuffer url = new StringBuffer();
			url.append(jobUrl).append(method).append("?loginName=").append(user.getLoginName())
				.append("&token=").append(token).append("&id=").append(id);
			String response = HttpUtil.get(url.toString());			
			return JSON.parseObject(response, Map.class);
		}
		return null;
	}
	

}
