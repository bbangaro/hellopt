package com.bit.hellopt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.bit.hellopt.service.user.UserService;
import com.bit.hellopt.vo.User;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	UserService service;

	public LoginController(UserService service) {
		this.service = service;
	}

	@PostMapping("/login")
	public String login(@ModelAttribute User _user, HttpServletRequest request) {
		
		int result = service.existUser(_user);
		if (result == 0) {
			logger.info("로그인: 일치하는 아이디, 패스워드 없음");
		} else {
			logger.info(
					"addSessionAttributes :" + service.findByIdAndPw(_user.getUserId(), _user.getUserPw()).getName());
			/*
			 * attributes.addFlashAttribute("isUser",
			 * service.findByIdAndPw(_user.getUserId(), _user.getUserPw()).getName());
			 */
			HttpSession session = request.getSession();
			session.setAttribute("isUser", service.findByIdAndPw(_user.getUserId(), _user.getUserPw()).getName());
		}
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/signupform")
	public String signUpFrom(Model model) {
		model.addAttribute("user", new User());
		return "signupForm";
	}
}
