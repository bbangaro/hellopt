package com.bit.hellopt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MealController {
	
	@GetMapping("/meal")
	public String meal() {
		return "meal/meal";
	}
}
