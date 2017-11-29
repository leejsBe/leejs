package com.example.demo.test;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Test2Controller {

	
	@RequestMapping("/test2")
	public String Test2() {
			return "Hello World2!!";
		
	}
}
