package com.bit.hellopt.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.hellopt.service.user.UserProfileService;
import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.user.ProfileVO;
import com.bit.hellopt.vo.user.User;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	UserService userService;
	@Autowired
	UserProfileService profileService;
	
	public UserController(UserService service) {
		this.userService = service;
	}
	
	/**
	 * 회원 가입
	 * @param user 회원 정보
	 * @param bindingResult 회원 정보 유효성 검사 결과
	 * @param file 프로필 사진
	 * @return 회원 가입 후 메인 화면 view
	 */
	
	@PostMapping("/user")
	public String registerUser(@ModelAttribute @Valid User user, BindingResult bindingResult, @RequestParam MultipartFile file) {
		
		if(bindingResult.hasErrors()) {
			logger.info("signupform: user validation error");
			return "signupForm";
		} else {
			String profileFile = null;
			
			if(!file.isEmpty()) {
				profileFile = profileService.insertProfile(user, file);
				
			}
			user.setUserProfile(profileFile);
			logger.info("register user Birth:", user.getUserBirth());
			userService.regiserUser(user);
			
		}
		return "redirect:/";
	}
	
	/**
	 * 회원 가입 양식
	 * @param model 회원 정보를 담기위한 model
	 * @return 회원가입 양식 view
	 */
	@GetMapping("/user/registrationform")
	public String getRegistrationform(Model model) {
		model.addAttribute("user", new User());
		return "user/signupForm";
	}
	
	/**
	 * 아이디 중복 검사
	 * @param userId 회원 아이디
	 * @return 0 : 중복 없음, 1 : 중복 있음
	 */
	@PostMapping("/user/idcheck")
	@ResponseBody
	public int isUserId(@RequestBody String userId) {
		Gson gson = new Gson();
		User user = gson.fromJson(userId, User.class);
		return userService.isUser(user.getUserId());
	}
	
	@GetMapping("/auth/{userId}")
	public String getUserDetails(@PathVariable("userId") String userId, Model model, Principal principal) {
		if(!userId.equals(principal.getName())) {
			return "redirect:/";
		} else {
			User user = userService.findUserById(userId);
			user.setUserPw("");

			ProfileVO profile = profileService.selectProfile(userId);
			
			if (profile != null) {
				user.setUserProfile(profile.getStoredFileName());
			}

			model.addAttribute("user", user);
			return "user/userDetails";
		}
	}
	
	@PostMapping("/auth/update")
	public String adminUserDetailUpdate(@ModelAttribute User user,  @RequestParam MultipartFile file) {
			userService.updateUser(user);
			if(!file.isEmpty()) {
				profileService.updateProfile(user, file);
			}
			
		return "redirect:/admin/user";
	}
	
	@GetMapping("auth/delete")
	public String adminDeleteUser(@RequestParam String userId) {
		User user = new User();
		user.setUserId(userId);
		//userService.deleteUser(user);
		userService.disableUser(user);
		return "redirect:/admin/user";
	}
	
}
