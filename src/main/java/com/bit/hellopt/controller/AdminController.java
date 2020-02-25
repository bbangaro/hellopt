package com.bit.hellopt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bit.hellopt.service.user.UserService;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/admin/user")
	public String adminUserManagement(Model model) {
		model.addAttribute("userList", userService.getUserList());
		return "adminUserManagement";
	}
	
}
