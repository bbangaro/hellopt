package com.bit.hellopt.controller.calender;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalenderController {
	
	
	
	@GetMapping("/calender")
	public String calender(Principal principal) {
		return "calender/calender";
	}
	
}
