package cn.com.gtmc.glaf2.plugins.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import cn.com.gtmc.glaf2.context.SpringContextHolder;
import cn.com.gtmc.glaf2.service.security.DeptService;
import cn.com.gtmc.glaf2.service.security.UserService;
import cn.com.gtmc.glaf2.tools.log.Logger;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title OrgStructureSync
 * @Package cn.com.gtmc.glaf2.plugins.job
 * @Description:  组织结构同步job
 * @date 2017年8月22日 下午2:40:56 
 */
public class OrgStructureSync implements org.quartz.Job{
	
	private static final Logger LOG = Logger.getLogger(OrgStructureSync.class);
	
	@Override
	public void execute(JobExecutionContext jobexecutioncontext) throws JobExecutionException {
		LOG.info("job任务:组织结构信息同步");
		DeptService deptService = (DeptService)SpringContextHolder.getBean("deptServiceImpl");
		UserService userService = (UserService)SpringContextHolder.getBean("userServiceImpl");
		//同步部门信息
		deptService.syncDeptInfo();
		//同步员工信息
		userService.syncUserInfo();
	}

}
