package cn.com.gtmc.glaf2.service.common.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.mapper.common.LogImportDataMapper;
import cn.com.gtmc.glaf2.service.common.LogImportDataService;

@Service
@Transactional
public class LogImportDataServiceImpl implements LogImportDataService{

	@Autowired
	private LogImportDataMapper mLogImportDataMapper;
	
	@Override
	public BaseMapper getBaseMapper() {
		return this.mLogImportDataMapper;
	}
}
