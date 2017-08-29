package com.example.demo.test;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {

	@Bean
	public EchoHandler echoHandler() {
		return new EchoHandler();
	}
	
	
}
