package cn.com.gtmc.glaf2.controller.common;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.common.SysCalendar;
import cn.com.gtmc.glaf2.service.common.SysCalendarService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;

/**
 * @author dream.li
 * @version V1.0
 * @Title SysCalendarController
 * @Package cn.com.gtmc.glaf2.controller.common
 * @Description:
 * @date 2017年4月7日 上午11:56:04
 */
@Controller
@RequestMapping("common/workCalendar")
public class SysCalendarController implements BaseController<SysCalendar> {
	private static final Logger LOG = Logger.getLogger(SysCalendarController.class);
	
	@Autowired
	private SysCalendarService sysCalendarService;

	public SysCalendarController() {
		LOG.info("init...");
	}

	@Override
	public BaseService getService() {
		return this.sysCalendarService;
	}
	
	@RequestMapping("workCalendar")
	public ModelAndView workCalendar() {
        logger.debug("workCalendar...");
        ModelAndView mv = new ModelAndView((new StringBuilder()).append(getViewPath()).append("/workCalendar").toString());
        return mv;
    }
	
	@RequestMapping("workCalendarAB")
	public ModelAndView workCalendarAB(){
        logger.debug("workCalendarAB...");
        ModelAndView mv = new ModelAndView((new StringBuilder()).append(getViewPath()).append("/workCalendarAB").toString());
        return mv;
    }
	
	/**
	 * 初始化页面信息
	 * @param request
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public ReturnMessage list(HttpServletRequest request,ModelMap modelMap) {
		LOG.info("list...");
		ReturnMessage result = new ReturnMessage();
		Map<Object,Object> map = new HashMap<Object,Object>();
		Calendar cal = Calendar.getInstance();
		//获取年
		Integer year = cal.get(Calendar.YEAR);
		//获取月
		Integer month = cal.get(Calendar.MONTH)+1;
		//日历类型
		Integer calendarType = 0;
		try{
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			calendarType = Integer.parseInt(request.getParameter("calendarType"));
        }catch(Exception ex){
        	LOG.error(ex.getMessage());
        }
		//获取生产线
		String produceLine = request.getParameter("produceLine");
		if (null == produceLine || "".equals(produceLine))
			produceLine = "1";
		//当前年这月的天数
		int daySize = this.getMonthDays(year, month);
		SysCalendar calendar = new SysCalendar();
		calendar.setCalendarType(calendarType);
		calendar.setProduceLine(produceLine);
		calendar.setYearValue(year);
		calendar.setMonthValue(month);
		//查找
		List<SysCalendar> list = sysCalendarService.findList(calendar);
		map.put("year", year);
		map.put("month", month);
		map.put("daySize", daySize);
		map.put("list", list);
		result.setObject(map);
		return result;
	}
	
	/**
	 * 保存
	 * @param listData  工作日历信息json
	 * @return
	 */
	@RequestMapping("saveAll")
	@ResponseBody
	public ReturnMessage save(String list) {
		try {
			LOG.info("saveAll");
			if(list == null || "".equals(list)){
				return this.error();
			}
			ObjectMapper mapper = new ObjectMapper();
			List<SysCalendar> lists = mapper.readValue(list,new TypeReference<List<SysCalendar>>(){});
			for(int i =0;i<lists.size();i++){
				SysCalendar t = lists.get(i);
				Calendar cal = Calendar.getInstance();
				cal.set(t.getYearValue(), t.getMonthValue()-1, t.getDayValue(), 0, 0, 0);
				t.setWorkdate(cal.getTime());
				if("".equals(Util.filter(t.getPK())) || "0".equals(Util.filter(t.getPK())))
	                getService().insert(t);
	            else
	                getService().update(t);
			}
			return ok();
			} catch (JsonParseException e) {
				LOG.error("save error!!!",e);
			} catch (JsonMappingException e) {
				LOG.error("save error!!!",e);
			} catch (IOException e) {
				LOG.error("save error!!!",e);
			}
		return this.error();
	}
	
	  public int getMonthDays(int year, int month)
	    {
	        int days = 31;
	        switch(month)
	        {
	        default:
	            break;
	
	        case 1: 
	        case 3: 
	        case 5: 
	        case 7: 
	        case 8: 
	        case 10:
	        case 12: 
	            days = 31;
	            break;
	
	        case 4: 
	        case 6: 
	        case 9: 
	        case 11:
	            days = 30;
	            break;
	
	        case 2: 
	            if(year % 4 == 0 || year % 100 == 0 || year % 400 == 0)
	                days = 29;
	            else
	                days = 28;
	            break;
	        }
	        return days;
	    }
}

