package cn.com.gtmc.glaf2.base;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


/**
* 所有单元测试的基类
* @Title: BaseTest.java
* @Package cn.com.intasect.base
* @Description: TODO(用一句话描述该文件做什么)
* @author 陈万东  
* @date 2015年12月30日 下午4:33:27
* @version V1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml","classpath:spring-mvc.xml"})
@WebAppConfiguration
public abstract class BaseTest {
	
	@Before
	public void init(){
		this.getClass().getClassLoader().setDefaultAssertionStatus(false);
		//以下针对：BeanUtils.copyProperties(dest, orig);
		//不知道什么原因，部署在tomcat时，不会出现异常，在用junit时始终出现问题，因此在单元测试时，注册对应类的实现方法
		//对应的实现方法仅仅让其不报错，无其他任何实现
		//ConvertUtils.register(new DateConverter(),java.util.Date.class);
		//ConvertUtils.register(new TimestampConvert(),java.sql.Timestamp.class);
	}
}
