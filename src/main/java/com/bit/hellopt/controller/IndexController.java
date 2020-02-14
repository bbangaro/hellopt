package com.bit.hellopt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
//	@GetMapping("/index")
//	public String home() {
//		logger.info("home controller get mapping");
//		return "index";
//	}
	
	@GetMapping("/decorator")
	public String home() {
		logger.info("home controller get mapping");
		return "decorator";
	}
	
}
