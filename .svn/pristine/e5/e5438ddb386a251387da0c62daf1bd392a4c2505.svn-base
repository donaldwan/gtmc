package cn.com.gtmc.glaf2.service.common;

import java.io.Serializable;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.job.ScheduleJob;
import cn.com.gtmc.glaf2.tools.web.Page;

public interface ScheduleJobWebService extends BaseService{
	
	public String executeRequest(String jobUrl, String method, ScheduleJob scheduleJob);
	
	public Page<T> executeRequest(String jobUrl, String method, T t);
	
	public Map executeEdit(String jobUrl, String method, Serializable id);

}
