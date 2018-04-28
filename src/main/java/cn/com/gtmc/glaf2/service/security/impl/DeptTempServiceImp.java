package cn.com.gtmc.glaf2.service.security.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.service.security.DeptTempService;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title DeptTempServiceImp
 * @Package cn.com.gtmc.glaf2.service.security.impl
 * @Description:  
 * @date 2017年7月24日 上午10:27:48 
 */
@Service
@Transactional
public class DeptTempServiceImp implements DeptTempService{

	@Override
	public BaseMapper getBaseMapper() {
		
		return null;
	}


}
