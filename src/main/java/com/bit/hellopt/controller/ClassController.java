package com.bit.hellopt.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.hellopt.service.liveclass.ClassMemberService;
import com.bit.hellopt.service.liveclass.LiveClassService;
import com.bit.hellopt.vo.live.ClassMember;
import com.bit.hellopt.vo.live.LiveClass;

@Controller
public class ClassController {
	
	@Autowired
	LiveClassService service;
	
	//------------ 강의 개설 ---------------
	@PostMapping("/openclass")
	public String insertClass(LiveClass info) {
		service.insertClass(info);
		System.out.println("라이브 클래스 생성 성공!!");
		return "redirect:/class/classlist";
	}
	
	@RequestMapping("/classlist")
	public String getLiveClass(Model model) {
		List<LiveClass> liveClassList = service.getLiveClass();
		System.out.println("라이브 클래스 정보 가져오기 성공!!");
		model.addAttribute("liveClassList", liveClassList);
		return "class/classList";
	}
	
	@RequestMapping("/classdetail")
	public String getClassDetail(int classIdx, Model model) {
		LiveClass classDetail = service.getClassDetail(classIdx);
		System.out.println("라이브 클래스 상세정보 가져오기 성공!!");
		model.addAttribute("classDetail", classDetail);
		return "class/classDetail";
	}
	
	@RequestMapping("/deleteclass")
	public String deleteClass(int classIdx) {
		service.deleteClass(classIdx);
		System.out.println("라이브 클래스 삭제 성공!!");
		return "redirect:/class/classlist";
	}
	
	
	//------------ 강의 신청 ---------------

	@Autowired
	ClassMemberService service2;
	
	@RequestMapping("/regclass")
	public String insertClassMember(ClassMember info, Principal principal) {
		//로그인 아이디를 VO에 setter로 저장
		info.setFkUserId(principal.getName());
		System.out.println(info.getFkUserId());
		
		service2.insertClassMember(info);
		System.out.println("강의 신청 성공!!");
		
		//리턴할 곳 수정(강의 신청 완료하면 보여줄 페이지)
		return "class/classList";
	}
	
	// *마이페이지에서 강의 신청 취소(delete or update)와 신청한 강의 보기(select) 가능하게 만들기
	
}
