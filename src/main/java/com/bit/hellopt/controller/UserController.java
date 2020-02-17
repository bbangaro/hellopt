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
	UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
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
