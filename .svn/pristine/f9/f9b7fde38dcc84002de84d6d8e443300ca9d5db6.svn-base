package cn.com.gtmc.glaf2.service.common.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.mapper.common.DocumentMapper;
import cn.com.gtmc.glaf2.service.common.DocumentService;
import cn.com.gtmc.glaf2.tools.log.Logger;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title DocumentServiceImpl
 * @Package cn.com.gtmc.glaf2.service.common.impl
 * @Description:  文档管理系统DocumentServiceImpl
 * @date 2017年7月12日 下午4:13:13 
 */
@Service
@Transactional
public class DocumentServiceImpl implements DocumentService {

	private static final Logger LOG = Logger.getLogger(DocumentServiceImpl.class);
	
	@Autowired
	private DocumentMapper documentMapper;
	
	@Override
	public BaseMapper getBaseMapper() {
		return this.documentMapper;
	}

	public DocumentServiceImpl(){
		LOG.info("init...DocumentServiceImpl...");
	}
	
	
	
}
