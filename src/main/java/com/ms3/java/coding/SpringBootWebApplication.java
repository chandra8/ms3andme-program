package com.ms3.java.coding;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication
public class SpringBootWebApplication extends SpringBootServletInitializer {
	
	  @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder 
	            application) {
	        
	        return application.sources(SpringBootWebApplication.class);
	    }
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(SpringBootWebApplication.class, args);
	}

	
	/*public void addViewControllers(ViewControllerRegistry registry) {
	        registry.addViewController("/").setViewName("userinterface");
	    }*/
}
