package com.bit.hellopt.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@GetMapping("/")
	public String home(Principal principal) {
	// 로그인 성공했을 때 인증된 유저 객체를 받을 수 있음(유저 아이디/비번)
	//public String home() {
		//System.out.println(principal.getName());
		logger.info("main controller get mapping");
		return "main";
	}
	
}
