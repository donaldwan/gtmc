package cn.com.gtmc.glaf2.controller.serialnumber;

import java.io.Serializable;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.gtmc.glaf2.idgenerator.serialnumber.SerialNumber;
import cn.com.gtmc.glaf2.service.common.CommonService;

/**
 * YYYYMM+3位流水号生成器
 * 
 * 不记状态生成流水号，规则：YYYYMM+3位流水号
 * 对象字段注解：@SN(value="yearMonthSerialNumber")
 * @author 高晓丹
 */
public class YearMonthSerialNumber implements SerialNumber{
	
	@Autowired
	private CommonService commonService;

	@Override
	public Serializable nextSerialNumber(Object object) {
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
	    int year = cal.get(Calendar.YEAR);
	    String mm = month < 10?("0" + month):("" + month);
	    String yyyymm = year + mm;
		String seq = commonService.findSeq("YEAR_MONTH_SERIAL_NUMBER");
		//超出3位重置序列号
		if("1000".equals(seq)){
			commonService.resetSeq("YEAR_MONTH_SERIAL_NUMBER");
			seq = commonService.findSeq("YEAR_MONTH_SERIAL_NUMBER");
		}
		int seqlen = seq.length();
		//3位流水，位数不够补零
		for(int i = 0; i < 3 - seqlen; i++){
			seq = "0" + seq; 
		}
		
//		string类型
//		return yyyymm+seq;
		
//		int类型
		return Integer.parseInt(yyyymm+seq);
	}

}
