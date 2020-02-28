package com.bit.hellopt.controller.meeting;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.hellopt.service.meeting.MeetingService;
import com.bit.hellopt.vo.meeting.CategoryCodeVO;
import com.bit.hellopt.vo.meeting.LocalVO;
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

	@RequestMapping("/meetingWrite")
	public String meetingWrite(Principal principal,  Model model) {
		
		List<LocalVO> localList = service.getLocalVO();
		List<CategoryCodeVO> categoryList = service.getCategoryCodeVO();
		System.out.println("getMeetingWrite 성공");
		
		model.addAttribute("localList", localList);
		model.addAttribute("categoryList", categoryList);
		return "meeting/meetingWrite";
	}
	
	@PostMapping("/meetingWriteOk")
	public String meetingWriteOk(Principal principal, MeetingVO meetingVO) {
		service.insertMeeting(meetingVO);
		System.out.println("getMeetingOk 성공");
		return "redirect:/meeting";
	}
	
	@RequestMapping("/meetingUpdate")
	public String meetingUpdate(Principal principal, Model model, int meetingIdx) {
	MeetingVO meetingOne = service.getMeetingOne(meetingIdx);
	System.out.println("getMeetingUpdate 성공");

	List<LocalVO> localList = service.getLocalVO();
	List<CategoryCodeVO> categoryList = service.getCategoryCodeVO();
	
	model.addAttribute("localList", localList);
	model.addAttribute("categoryList", categoryList);
	model.addAttribute("meetingOne", meetingOne);
	
	
	return "meeting/meetingUpdate";
	}
	
	@PostMapping("/meetingUpdateOk")
	public String meetingUpdateOk(Principal principal, MeetingVO meetingVO) {
		service.updateMeetingOk(meetingVO);
		System.out.println("getmeetingUpdateOk 성공");
		return "redirect:/meeting";
	}
	
	@RequestMapping("/meetingDelete")
	public String meetingDelete(int meetingIdx) {
		service.deleteMeeting(meetingIdx);
		System.out.println("getMeetingDelete 성공");
	
	return "meeting/meeting";
	}
}
