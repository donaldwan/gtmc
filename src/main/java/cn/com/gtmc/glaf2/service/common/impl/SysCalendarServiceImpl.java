package cn.com.gtmc.glaf2.service.common.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.common.SysCalendar;
import cn.com.gtmc.glaf2.mapper.common.SysCalendarMapper;
import cn.com.gtmc.glaf2.service.common.SysCalendarService;
import cn.com.gtmc.glaf2.tools.log.Logger;


/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SysCalendarServiceImpl
 * @Package cn.com.gtmc.glaf2.service.common.impl
 * @Description:  工作日历serviceImpl
 * @date 2017年4月7日 下午12:28:31 
 */
@Service
@Transactional
public class SysCalendarServiceImpl implements SysCalendarService {

	private static final Logger LOG = Logger.getLogger(SysCalendarServiceImpl.class);
	
	public SysCalendarServiceImpl(){
		LOG.info("init...");
	}
	 
	@Autowired
	private SysCalendarMapper sysCalendarMapper;
	
	@Override
	public BaseMapper getBaseMapper() {
		return this.sysCalendarMapper;
	}

	@Override
	public boolean isWorkDay() {
		return this.isWorkDay(new Date());
	}

	@Override
	public boolean isWorkDay(Date date) {
		try {
			SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");  
			SysCalendar sysCalendar = new SysCalendar();
			sysCalendar.setWorkdate(sdf.parse(sdf.format(date.getTime())));
			sysCalendar.setWorkdateType(0);
			List<SysCalendar> list = sysCalendarMapper.findList(sysCalendar);
			if(list.size()>0){
				return true;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Date> getWorkDay(Date startDate, Date endDate) {
		try {
			SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
			List<SysCalendar> list = sysCalendarMapper.findListByWorkdates(sdf.parse(sdf.format(startDate.getTime())) ,sdf.parse(sdf.format(endDate.getTime())));
			if(list.size() < 1){
				return null;
			}
			List<Date> dates = new ArrayList<Date>();
			for (int i = 0; i< list.size();i++) {
				dates.add(list.get(i).getWorkdate());
			}
			return dates;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Date> getWorkDay(int year, int month) {
		SysCalendar sysCalendar = new SysCalendar();
		sysCalendar.setWorkdateType(0);
		sysCalendar.setYearValue(year);
		sysCalendar.setMonthValue(month);
		List<SysCalendar> list = sysCalendarMapper.findList(sysCalendar);
		if(list.size() < 1){
			return null;
		}
		List<Date> dates = new ArrayList<Date>();
		for (int i = 0; i< list.size();i++) {
			dates.add(list.get(i).getWorkdate());
		}
		return dates;
	}

	@Override
	public String getMorningShift() {
		return this.getMorningShift(new Date());
	}

	@Override
	public String getMorningShift(Date date) {
		try {
			SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
			SysCalendar sysCalendar = new SysCalendar();
			sysCalendar.setWorkdate(sdf.parse(sdf.format(date.getTime())));
			sysCalendar.setWorkdateType(0);
			List<SysCalendar> list = sysCalendarMapper.findList(sysCalendar);
			if(list.size() > 0){
				return list.get(0).getMorningShift();
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String getNightShift() {
		return this.getNightShift(new Date());
	}

	@Override
	public String getNightShift(Date date) {
		try {
			SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
			SysCalendar sysCalendar = new SysCalendar();
			sysCalendar.setWorkdate(sdf.parse(sdf.format(date.getTime())));
			sysCalendar.setWorkdateType(0);
			List<SysCalendar> list = sysCalendarMapper.findList(sysCalendar);
			if(list.size() > 0){
				return list.get(0).getNightShift();
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
