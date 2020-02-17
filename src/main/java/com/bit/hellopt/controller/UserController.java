package com.bit.hellopt.controller;

import org.springframework.stereotype.Controller;
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
	public String regiserUser(@ModelAttribute User user) {
		userService.regiserUser(user);
		return "redirect:/";
	}
	
}
