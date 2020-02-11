package com.bit.hellopt.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.User;
@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	UserService service;
	
	public UserController(UserService service) {
		this.service = service;
	}
	
	/**
	 * register user
	 * @param user
	 * @return
	 */
	@PostMapping("/user")
	public String insertUser(@ModelAttribute("user") @Valid User user, BindingResult bindingResult) {			
		if (bindingResult.hasErrors()) {
			logger.info("signupform user validation error");
			return "signupForm";
		} else {
			//임시 디폴트 role 설정
			user.setUserRole("trainee");
			service.save(user);
			logger.info("register user");
			return "redirect:/";
		}
		
	}
	
	/**
	 * find user
	 * @return
	 */
	@GetMapping("/user")
	public String selectUser() {
		logger.info(service.findAll().toString());
		return "redirect:/";
	}
	
}
