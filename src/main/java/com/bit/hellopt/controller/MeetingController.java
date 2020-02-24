package com.bit.hellopt.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MeetingController {
	
	private static final Logger logger = LoggerFactory.getLogger(MeetingController.class);
	
	
	@GetMapping("/meeting")
	public String meeting(Principal principal) {
		logger.info("meeting controller get mapping");
		return "meeting";
	}
	
}
