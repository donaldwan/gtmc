package cn.com.gtmc.glaf2.service.common;

import java.util.Date;
import java.util.List;
import cn.com.gtmc.glaf2.base.BaseService;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SysCalendarService
 * @Package cn.com.gtmc.glaf2.service.common
 * @Description:  
 * @date 2017年4月7日 下午12:27:25 
 */
public interface SysCalendarService extends BaseService{
	
	
	/**
	 * 判断当天是否是工作日
	 * @return
	 */
	public boolean isWorkDay();
	
	/**
	 * 判断传入的日期是否是工作日
	 * @param date
	 * @return
	 */
	public boolean isWorkDay(Date date);
	
	/**
	 * 返回开始日期与结束日期之间的所有工作日
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<Date> getWorkDay(Date startDate,Date endDate);
	
	/**
	 * 返回year年month月的所有工作日
	 * @param year
	 * @param minth
	 * @return
	 */
	public List<Date> getWorkDay(int year,int month);
	
	/**
	 * 返回当天早班的值
	 * @return
	 */
	public String getMorningShift();
	
	/**
	 * 返回日期date的早班值
	 * @param date
	 * @return
	 */
	public String getMorningShift(Date date);
	
	/**
	 * 返回当天晚班的值
	 * @return
	 */
	public String getNightShift();
	
	/**
	 * 返回日期date的晚班值
	 * @param date
	 * @return
	 */
	public String getNightShift(Date date);
}
