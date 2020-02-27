package com.bit.hellopt.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.hellopt.service.user.UserProfileService;
import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.user.ProfileVO;
import com.bit.hellopt.vo.user.User;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	@Autowired
	UserProfileService profileService;
	
	@GetMapping("/admin/user")
	public String adminUserManagement(Model model) {
		model.addAttribute("userList", userService.getUserList());
		return "adminUserManagement";
	}
	
	@GetMapping("/admin/user/{userId}")
	public String adminUserManagementDetail(@PathVariable("userId") String userId, Model model) {
		User user = userService.findUserById(userId);

		ProfileVO profile = profileService.selectProfile(userId);
		if (profile != null) {
			user.setUserProfile(profile.getStoredFileName());
		}

		model.addAttribute("user", user);
		return "adminUserManagementDetail";
	}
	
	@PostMapping("/admin/user/update")
	public String adminUserDetailUpdate(@ModelAttribute User user,  @RequestParam MultipartFile file) {
			userService.updateUser(user);
			if(!file.isEmpty()) {
				profileService.insertProfile(user, file);
			}
			
		return "redirect:/admin/user";
	}
	
	@GetMapping("admin/user/delete")
	public String adminDeleteUser(@RequestParam String userId) {
		User user = new User();
		user.setUserId(userId);
		userService.deleteUser(user);
		return "redirect:/admin/user";
	}
	
}
