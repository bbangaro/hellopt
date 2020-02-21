package com.bit.hellopt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.hellopt.service.liveclass.LiveClassService;
import com.bit.hellopt.vo.LiveClass;

@Controller
public class ClassController {
	
	@Autowired
	LiveClassService service;
	
	@PostMapping("/openclass")
	public String insertClass(LiveClass info) {
		service.insertClass(info);
		System.out.println("라이브 클래스 생성 성공!!");
		return "redirect:/classlist";
	}
	
	@RequestMapping("/classlist")
	public String getLiveClass(Model model) {
		List<LiveClass> liveClassList = service.getLiveClass();
		System.out.println("라이브 클래스 정보 가져오기 성공!!");
		model.addAttribute("liveClassList", liveClassList);
		return "classList";
	}
	
	@RequestMapping("/classdetail")
	public String getClassDetail(int classIdx, Model model) {
		LiveClass classDetail = service.getClassDetail(classIdx);
		System.out.println("라이브 클래스 상세정보 가져오기 성공!!");
		model.addAttribute("classDetail", classDetail);
		return "classDetail";
	}
	
	@RequestMapping("/deleteclass")
	public String deleteClass(int classIdx) {
		service.deleteClass(classIdx);
		System.out.println("라이브 클래스 삭제 성공!!");
		return "redirect:/classlist";
	}
	
}
