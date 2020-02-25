package com.bit.hellopt.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Audition {
	
	@GetMapping("/audition")
	public String audition() {
		return "audition/audition";
	}
	
	
}
