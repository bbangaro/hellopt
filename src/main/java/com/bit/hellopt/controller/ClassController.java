package com.bit.hellopt.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.hellopt.service.liveclass.ClassMemberService;
import com.bit.hellopt.service.liveclass.LiveClassService;
import com.bit.hellopt.service.liveclass.LiveService;
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
		return "redirect:/classlist";
	}
	
	@RequestMapping("/classlist")
	public String getLiveClass(Model model, ClassMember info, Principal principal, String classType) {
		model.addAttribute("classType", classType);

		List<LiveClass> liveClassList = service.getLiveClass(classType);
		System.out.println("라이브 클래스 정보 가져오기 성공!!");
		model.addAttribute("liveClassList", liveClassList);
		
		info.setFkUserId(principal.getName());
		
		List<ClassMember> classMember = service2.getMyClass(info);
		System.out.println("클래스 멤버 정보 가져오기 성공!!");
		System.out.println("classMember : " + classMember);
		model.addAttribute("classMember", classMember);
		
		for(int i=0; i<classMember.size(); i++) {
			int classMemberIdx = classMember.get(i).getClassMemberIdx();
			System.out.println(classMemberIdx);
		}
		//ClassMember member = service2.getClassM(classMemberIdx);
		//model.addAttribute("member", member);
		
		
		System.out.println("classType: " + classType);
		System.out.println("..." + liveClassList);
		
		return "class/classList";
	}
	
	@RequestMapping("/classdetail")
	public String getClassDetail(int classIdx, Model model, Principal principal, ClassMember info) {
		LiveClass classDetail = service.getClassDetail(classIdx);
		System.out.println("라이브 클래스 상세정보 가져오기 성공!!");
		model.addAttribute("classDetail", classDetail);
		
		info.setFkUserId(principal.getName());
		info.setFkClassIdx(classIdx);
		
		int result = service2.getRegInfo(info);
		model.addAttribute("result", result);
		
		return "class/classDetail";
	}
	
	@RequestMapping("/deleteclass")
	public String deleteClass(int classIdx) {
		service.deleteClass(classIdx);
		System.out.println("라이브 클래스 삭제 성공!!");
		return "redirect:/classlist";
	}
	
	@RequestMapping("/updateclass")
	public String updateClass(int classIdx, Model model) {
		LiveClass classDetail = service.getClassDetail(classIdx);
		System.out.println("수정하기 위한 라이브 클래스 상세정보 가져오기 성공!!");
		model.addAttribute("classDetail", classDetail);
		return "class/classUpdate";
	}
	
	@RequestMapping("/updateclassok")
	public String classUpdate(LiveClass info) {
		service.updateClass(info);
		System.out.println("라이브 클래스 수정 성공!!");
		return "redirect:/classdetail?classIdx=" + info.getClassIdx();
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
		return "redirect:/classlist";
	}
	
	@RequestMapping("/dropclass")
	public String deleteClassMember(ClassMember info, Principal principal) {
		System.out.println("로그인 아이디 : " + principal.getName());
		info.setFkUserId(principal.getName());
		
		service2.deleteClassMember(info);
		
		System.out.println("강의 신청 취소 성공!!");
		
		return "redirect:/classdetail?classIdx=" + info.getFkClassIdx();
	}
	
	
	//------------- 강의 제목 가져오기 ---------------
	
	@Autowired
	LiveService service3;
	
	@RequestMapping("/broadcaster")
	public String getClassName(int classIdx, Model model) {
		String className = service3.getClassName(classIdx);
		System.out.println("강의 제목 가져오기 성공^^");
		
		model.addAttribute("classIdx", classIdx);
		model.addAttribute("className", className);
		return "class/broadcaster";
	}

	@RequestMapping("/viewer")
	public String getClassName2(int classIdx, Model model) {
		String className = service3.getClassName(classIdx);
		System.out.println("강의 제목 가져오기 성공^^");
		
		model.addAttribute("classIdx", classIdx);
		model.addAttribute("className", className);
		return "class/viewer";
	}
	
	@RequestMapping("/multi")
	public String getClassName3(int classIdx, Model model) {
		String className = service3.getClassName(classIdx);
		System.out.println("강의 제목 가져오기 성공^^");
		
		model.addAttribute("classIdx", classIdx);
		model.addAttribute("className", className);
		return "class/multi";
	}
	
	//페이징
	@RequestMapping("/pagingclasslist")
	public String getClassList(Model model, ClassMember info, Principal principal,
			@RequestParam(name = "end", defaultValue = "3") int end) {
		
		System.out.println("end : " + end);
		
		List<LiveClass> classList = service3.PagingClassList(end);
		
		model.addAttribute("classList", classList);
		
		info.setFkUserId(principal.getName());
		
		List<ClassMember> classMember = service2.getMyClass(info);
		System.out.println("클래스 멤버 정보 가져오기 성공!!");
		System.out.println("classMember : " + classMember);
		model.addAttribute("classMember", classMember);
		
		for(int i=0; i<classMember.size(); i++) {
			int classMemberIdx = classMember.get(i).getClassMemberIdx();
			System.out.println(classMemberIdx);
		}
		
		return "class/classList";
	}
	
	//ajax(더보기)
	@RequestMapping("/moreclass1")
	@ResponseBody
	public List<ClassMember> getMoreClass(ClassMember info, Principal principal, 
			@RequestParam(name = "end", defaultValue = "3") int end) {
		System.out.println("------ " + service3.PagingClassList(end));
		
		info.setFkUserId(principal.getName());
		
		List<ClassMember> classMember = service2.getMyClass(info);
		System.out.println("클래스 멤버 정보 가져오기 성공!!");
		System.out.println("classMember : " + classMember);
		
		for(int i=0; i<classMember.size(); i++) {
			int classMemberIdx = classMember.get(i).getClassMemberIdx();
			System.out.println(classMemberIdx);
		}
		return classMember;
	}
	
	@RequestMapping("/moreclass")
	@ResponseBody
	public List<LiveClass> getMore(@RequestParam(name = "end", defaultValue = "3") int end) {
		System.out.println("------ " + service3.PagingClassList(end));
		return service3.PagingClassList(end);
	}
	
	//------------------ 관리자 페이지 -------------------
	
	@RequestMapping("/manageclass")
	public String getLiveClass(Model model, String classType) {
		List<LiveClass> liveClassList = service.getLiveClass(classType);
		System.out.println("라이브 클래스 정보 가져오기 성공!!");
		model.addAttribute("liveClassList", liveClassList);
		return "class/manageClass";
	}
}
