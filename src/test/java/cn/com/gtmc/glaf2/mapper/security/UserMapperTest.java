package cn.com.gtmc.glaf2.mapper.security;

import javax.annotation.Resource;
import javax.persistence.Table;

import org.apache.poi.hssf.record.chart.BeginRecord;
import org.junit.Assert;
import org.junit.Test;

import cn.com.gtmc.glaf2.base.BaseEntity;
import cn.com.gtmc.glaf2.base.BaseTest;
import cn.com.gtmc.glaf2.entity.security.Role;
import cn.com.gtmc.glaf2.entity.security.User;
import cn.com.gtmc.glaf2.mapper.security.UserMapper;
import cn.com.gtmc.glaf2.tools.Util;

public class UserMapperTest extends BaseTest{
	
	@Resource
	private UserMapper mUserMapper;
	
	//@Test
	public void findByLoginNameTest(){
		String loginName = "admin";
		User user = this.mUserMapper.findByLoginName(loginName);
		System.out.println(Util.toJson(user));
	}
	
	//@Test
	public void insertTest(){
		User user = new User();
		user.setLoginName("AAA");
		user.setLoginPass("bbb");
		user.setName("ABC");
		user.setSex("M");
		user.setEmail("aaa@aaa.com");
		user.setStatus("A");
		this.mUserMapper.insert(user);
		System.out.println("ID:" + user.getId());
		
	}
	
	@Test
	public void findByIdTest(){
		User user = this.mUserMapper.findByLoginName("admin");
		System.out.println(user.getId());
	}
	
}