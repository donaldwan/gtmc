package cn.com.gtmc.glaf2.base;

import org.junit.Before;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;

/**
* 所有模拟web请求的单元测试基类
* @Title: BaseTestWeb.java
* @Package cn.com.intasect.base
* @Description: TODO(用一句话描述该文件做什么)
* @author 陈万东  
* @date 2015年12月30日 下午4:36:42
* @version V1.0
 */
public class BaseTestWeb extends BaseTest{
	protected MockHttpServletRequest request;

	protected MockHttpServletResponse response;
	
	@Before
	public void init(){
		super.init();
		this.request = new MockHttpServletRequest();
		this.response = new MockHttpServletResponse();
		this.request.setCharacterEncoding("utf-8");
	}
}
