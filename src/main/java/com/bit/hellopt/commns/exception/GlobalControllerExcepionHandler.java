package com.bit.hellopt.commns.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalControllerExcepionHandler {

	@ExceptionHandler(Exception.class)
	public String handleException(Exception err, Model model) {
		model.addAttribute("err", err);
		return "exception";
	}
}
