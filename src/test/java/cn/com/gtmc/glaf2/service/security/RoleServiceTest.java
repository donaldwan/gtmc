package cn.com.gtmc.glaf2.service.security;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import cn.com.gtmc.glaf2.base.BaseTest;
import cn.com.gtmc.glaf2.entity.security.Role;
import cn.com.gtmc.glaf2.service.security.RoleService;

public class RoleServiceTest extends BaseTest{
	@Autowired
	private RoleService roleService;
	
	@Transactional
	@Test
	@Rollback(true)
	public void addTest(){
		
	}
}
