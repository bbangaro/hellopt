package com.bit.hellopt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Trainer {
	
	@GetMapping("/trainer")
	public String trainer() {
		return "trainer/trainer";
	}
	
	@GetMapping("/trainerinfo")
	public String trainerinfo() {
		return "trainer/trainerinfo";
	}
	
}
