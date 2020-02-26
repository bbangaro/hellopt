package com.bit.hellopt.config;

import java.io.File;

import javax.servlet.MultipartConfigElement;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@ComponentScan(basePackages = {"com.bit.hellopt"})
@MapperScan("com.bit.hellopt.data")
@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	DataSource dataSource;
	@Autowired
	ApplicationContext applicationContext;

	public WebAppConfig(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		//registry.addViewController("/signupform").setViewName("signupForm");
		registry.addViewController("/insertform").setViewName("insertForm");
	}

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();

		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");

		return bean;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/file/**").addResourceLocations("file:///C:/hellopt_file/");
	}

	// MyBatis 연동을 위한 설정
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
	  SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
	  factoryBean.setDataSource(dataSource);
	  factoryBean.setConfigLocation(applicationContext.getResource("classpath:MyBatis-Config.xml"));
	  factoryBean.setMapperLocations(applicationContext.getResources("classpath:mappings/**.xml"));
	  return factoryBean.getObject();
	}

	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		//multipartResolver.setMaxUploadSize(100000000);
		return multipartResolver;
	}

	@Bean
	public MultipartConfigElement multipartConfigElement() {
		int maxUploadSize = 1024 * 1024;
		File uploadDirectory = new File(System.getProperty("java.io.tmpdir"));
		MultipartConfigElement configElement
			= new MultipartConfigElement(uploadDirectory.getAbsolutePath(), maxUploadSize, maxUploadSize * 2, maxUploadSize / 2);
		return configElement;
	}

}
