package com.bit.hellopt.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bit.hellopt.service.meeting.MeetingService;
import com.bit.hellopt.vo.meeting.MeetingVO;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MeetingService service;
	
	@GetMapping("/")
	public String home(Principal principal, Model model, String progressSt) {
	// 로그인 성공했을 때 인증된 유저 객체를 받을 수 있음(유저 아이디/비번)
	//public String home() {
		MeetingVO progressCnt = service.progressCnt(progressSt);
		
		model.addAttribute("progressCnt", progressCnt);
		
		logger.info("main controller get mapping");
		return "main";
	}
	@GetMapping("/main")
	public String main(Principal principal, Model model, String progressSt) {
	// 로그인 성공했을 때 인증된 유저 객체를 받을 수 있음(유저 아이디/비번)
	//public String home() {
		MeetingVO progressCnt = service.progressCnt(progressSt);
		
		model.addAttribute("progressCnt", progressCnt);
		
		logger.info("main controller get mapping");
		return "main";
	}
	
}