package com.bit.hellopt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.user.User;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	UserService service;
	
	public UserController(UserService service) {
		this.service = service;
	}
	
	@PostMapping("user")
	public String registerUser(@ModelAttribute User user) {
		userService.regiserUser(user);
		return "redirect:/";
	}
	
	@GetMapping("user/registrationform")
	public String getRegistrationform(Model model) {
		model.addAttribute("user", new User());
		return "signupForm";
	}
}
