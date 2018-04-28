package cn.com.gtmc.glaf2.mapper.common;

import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.common.SysCalendar;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SysCalendarMapper
 * @Package cn.com.gtmc.glaf2.mapper.common
 * @Description:  
 * @date 2017年4月7日 下午12:28:31 
 */
public interface SysCalendarMapper extends BaseMapper{
	
	public List<SysCalendar> findListByWorkdates(@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")Date startDate,
			@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")Date endDate);
	
}