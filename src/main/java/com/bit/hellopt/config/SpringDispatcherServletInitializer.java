package com.bit.hellopt.config;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	@Autowired
	MultipartConfigElement multipartConfigElement;
	
	
	@Override
    protected Class <?> [] getRootConfigClasses() {
        return new Class[] {
        	RootConfig.class
        };
    }

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

	@Override
	protected void customizeRegistration(Dynamic registration) {
		registration.setMultipartConfig(multipartConfigElement);
	}
    
    
}
