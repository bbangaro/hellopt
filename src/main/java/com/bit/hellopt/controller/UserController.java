package com.bit.hellopt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.User;
@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	UserService service;
	
	public UserController(UserService service) {
		this.service = service;
	}

	@PostMapping("/user")
	public RedirectView insertUser(@ModelAttribute User user) {
		user.setRole("trainee");
		logger.info(user.toString());
		service.save(user);
		return new RedirectView("/hellopt");
	}
	
	@GetMapping("/user")
	public RedirectView selectUser() {
		logger.info(service.findAll().toString());
		return new RedirectView("/hellopt");
	}
}
