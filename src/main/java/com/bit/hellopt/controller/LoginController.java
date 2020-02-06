package com.bit.hellopt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.User;

@Controller
@SessionAttributes("user")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	UserService service;
	
	public LoginController(UserService service) {
		this.service = service;
	}

	@PostMapping("/login")
	public RedirectView login(@ModelAttribute("user") User _user, RedirectAttributes attributes) {
		User user = null;
		user = service.findByIdAndPw(_user.getUserId(), _user.getUserPw());
		if(user != null) {
			logger.info("set session attribute : user: " + user.toString());
			attributes.addFlashAttribute("user", user);
		}
		return new RedirectView("/hellopt");
	}
	
	@GetMapping("/login")
	public RedirectView logout(SessionStatus status) {
		status.setComplete();
		return new RedirectView("/hellopt");
	}
		
	@ModelAttribute("user")
	public User setUser() {
		return new User();
	}
}
