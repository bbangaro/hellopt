package com.bit.hellopt.controller.meeting;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MeetingController {
	
	/*
	 로그 쓸 때
	private static final Logger logger = LoggerFactory.getLogger(MeetingController.class);
	logger.info("meeting controller get mapping");
	 */
	
	
	@GetMapping("/meeting")
	public String meeting(Principal principal) {
		return "meeting/meeting";
	}
	

	@GetMapping("/meetingWrite")
	public String meetingWrite(Principal principal) {
		return "meeting/meetingWrite";
	}
	
	@GetMapping("/meetingOne")
	public String meetingOne(Principal principal) {
		return "meeting/meetingOne";
	}
}
