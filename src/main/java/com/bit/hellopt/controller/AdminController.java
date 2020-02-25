package com.bit.hellopt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.user.User;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/admin/user")
	public String adminUserManagement(Model model) {
		model.addAttribute("userList", userService.getUserList());
		return "adminUserManagement";
	}
	
	@GetMapping("/admin/user/{userId}")
	public String adminUserManagementDetail(@PathVariable("userId")String userId, Model model) {
		User user = userService.findUserById(userId);
		model.addAttribute("user", user);
		return "adminUserManagementDetail";
	}
	
}
