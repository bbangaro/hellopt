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
	 * 회원 가입
	 * @param user 회원 정보
	 * @param bindingResult 회원 정보 유효성 검사 결과
	 * @param file 프로필 사진
	 * @return 회원 가입 후 메인 화면으로
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
	 * 회원 가입 양식
	 * @param model 회원 정보를 담기위한 model
	 * @return 회원가입 양식 view
	 */
	@GetMapping("/user/registrationform")
	public String getRegistrationform(Model model) {
		model.addAttribute("user", new User());
		return "signupForm";
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

}
