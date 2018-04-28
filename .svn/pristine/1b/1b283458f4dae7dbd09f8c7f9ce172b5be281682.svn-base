package cn.com.gtmc.glaf2.entity.common;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title SysCalendar
 * @Package cn.com.gtmc.glaf2.entity.common
 * @Description:  工作日历实体类
 * @date 2017年4月7日 上午10:48:58 
 */
public class SysCalendar extends DefaultIntegerEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1170523344795062038L;
	/**
	 * 日历类型  '0：工作日历(不区分A/B班) 1：工厂日历(区分A/B班)'
	 */
	private Integer calendarType;
	/**
	 * 生产线  '1：1线，2：2线，3：3线'
	 */
	private String produceLine;
	/**
	 * 工作日类型  '-1：无设值，0：是工作日，1：非工作日';
	 */
	private Integer workdateType;
	/**
	 * 工作日期
	 */
	@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
	private Date workdate;
	/**
	 * 日值
	 */
	private Integer dayValue;
	/**
	 * 周值
	 */
	private Integer weekValue;
	/**
	 * 月值
	 */
	private Integer monthValue;
	/**
	 *

	 */
	private Integer yearValue;
	/**
	 * 早班   'A班：A，B班：B';
	 */
	private String morningShift;
	/**
	 * 晚班   'A班：A，B班：B';
	 */
	private String nightShift;

	public Integer getCalendarType() {
		return calendarType;
	}

	public void setCalendarType(Integer calendarType) {
		this.calendarType = calendarType;
	}

	public String getProduceLine() {
		return produceLine;
	}

	public void setProduceLine(String produceLine) {
		this.produceLine = produceLine == null ? null : produceLine.trim();
	}

	public Integer getWorkdateType() {
		return workdateType;
	}

	public void setWorkdateType(Integer workdateType) {
		this.workdateType = workdateType;
	}

	public Date getWorkdate() {
		return workdate;
	}

	public void setWorkdate(Date workdate) {
		this.workdate = workdate;
	}

	public Integer getDayValue() {
		return dayValue;
	}

	public void setDayValue(Integer dayValue) {
		this.dayValue = dayValue;
	}

	public Integer getWeekValue() {
		return weekValue;
	}

	public void setWeekValue(Integer weekValue) {
		this.weekValue = weekValue;
	}

	public Integer getMonthValue() {
		return monthValue;
	}

	public void setMonthValue(Integer monthValue) {
		this.monthValue = monthValue;
	}

	public Integer getYearValue() {
		return yearValue;
	}

	public void setYearValue(Integer yearValue) {
		this.yearValue = yearValue;
	}

	public String getMorningShift() {
		return morningShift;
	}

	public void setMorningShift(String morningShift) {
		this.morningShift = morningShift == null ? null : morningShift.trim();
	}

	public String getNightShift() {
		return nightShift;
	}

	public void setNightShift(String nightShift) {
		this.nightShift = nightShift == null ? null : nightShift.trim();
	}
}
