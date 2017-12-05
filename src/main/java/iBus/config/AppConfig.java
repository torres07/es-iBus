package iBus.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import iBus.interceptor.GeneralInterceptor;

@Configuration
public class AppConfig extends WebMvcConfigurerAdapter{
	@Autowired
	private GeneralInterceptor interceptadorGeral;
	
	public void addInterceptors(InterceptorRegistry registry){
		registry.addInterceptor(interceptadorGeral);
	}
}
