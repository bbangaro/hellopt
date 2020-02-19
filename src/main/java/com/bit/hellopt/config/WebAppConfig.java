package com.bit.hellopt.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;


@EnableWebMvc
@ComponentScan(basePackages = { "com.bit.hellopt" })
@MapperScan("com.bit.hellopt.data")
@Configuration
							//웹설정 가능한 인터페이스 상속받아서... 뷰 리졸버같은거..쓴다.. 
							//디슾패셔써블릿 설정들..
public class WebAppConfig implements WebMvcConfigurer {

	DataSource dataSource;
	@Autowired
	ApplicationContext applicationContext;
	
	//rootConfig에 있는거 의존성 주입한거
	public WebAppConfig(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/main").setViewName("main");
		registry.addViewController("/hello").setViewName("hello");
		registry.addViewController("/login").setViewName("login");
	}

	//컨트롤러 받아주는 거..(위치 확인 , 확장자 확인)
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
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
	  SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
	  factoryBean.setDataSource(dataSource);
	  factoryBean.setConfigLocation(applicationContext.getResource("classpath:MyBatis-Config.xml"));
	  factoryBean.setMapperLocations(applicationContext.getResources("classpath:mappings/**.xml"));
	  return factoryBean.getObject();
	}
	
}
