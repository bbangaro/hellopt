package com.bit.hellopt.controller.meeting;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.hellopt.service.meeting.MeetingService;
import com.bit.hellopt.vo.LiveClass;
import com.bit.hellopt.vo.meeting.MeetingVO;

@Controller
public class MeetingController {
	
	/*
	 로그 쓸 때
	private static final Logger logger = LoggerFactory.getLogger(MeetingController.class);
	logger.info("meeting controller get mapping");
	 */
	@Autowired
	MeetingService service;
	
	@RequestMapping("/meeting")
	public String meeting(Principal principal , Model model) {
		//              저장 할 이름
		List<MeetingVO> meetingList = service.getMeetingVO();
		System.out.println("getMeetingList 성공");
		
		model.addAttribute("meetingList", meetingList);
		return "meeting/meeting";
	}
	
	@RequestMapping("/meetingOne")
	public String meetingOne(Principal principal, Model model, int meetingIdx) {
		MeetingVO meetingOne = service.getMeetingOne(meetingIdx);
		
		System.out.println("getMeetingOne 성공");
		model.addAttribute("meetingOne", meetingOne);
		return "meeting/meetingOne";
	}

	@GetMapping("/meetingWrite")
	public String meetingWrite(Principal principal) {
		return "meeting/meetingWrite";
	}
	
}
