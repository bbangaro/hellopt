package com.bit.hellopt.config;

import javax.servlet.Filter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.webapp.SiteMeshFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	//공통적으로 사용하는 설정들
	@Override
    protected Class <?> [] getRootConfigClasses() {
        return new Class[] {
        	RootConfig.class
        };
    }

	//웹싸이트마다 사용하는 설정들
    @Override
    protected Class <?> [] getServletConfigClasses() {
        return new Class[] {
            WebAppConfig.class
        };
    }

    
    @Override
    protected String[] getServletMappings() {
        return new String[] {
            "/"
        };
    }

    
    
}
