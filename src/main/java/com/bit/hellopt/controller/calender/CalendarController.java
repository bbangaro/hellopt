package com.bit.hellopt.controller.calender;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.hellopt.service.calender.CalendarService;
import com.bit.hellopt.vo.calendar.CalendarVO;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService service;
	
	@RequestMapping("/calender")
	public String calender(Principal principal) {
		return "calender/calender";
	}
	
	@RequestMapping("/calenderWrite")
	public String calenderWrite(Principal principal) {
		return "calender/calenderWrite";
	}
	
	@RequestMapping("/selectMonth")
	@ResponseBody // @ResponseBody 객체의 몸체(body)에 데이터 전달 (크롬브라우저만 가능)
	public List<CalendarVO> selectMonth(String month) {
		
		List<CalendarVO> calenderList = service.getMonth2(month);
		
		System.out.println(month);
		
		return calenderList;
	}
}
