package com.bit.hellopt.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalenderController {
	
	private static final Logger logger = LoggerFactory.getLogger(CalenderController.class);
	
	
	@GetMapping("/calender")
	public String calender(Principal principal) {
		logger.info("calender controller get mapping");
		return "calender";
	}
	
}
