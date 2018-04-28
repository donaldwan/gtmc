package cn.com.gtmc.glaf2.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

/**
 * 读取配置文件信息
 * 
 * @author LiHuaiJun
 *
 */
@Configuration
@PropertySource("classpath:config.properties")
public class PropertyConfig {
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
}
