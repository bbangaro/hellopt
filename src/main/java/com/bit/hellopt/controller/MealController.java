package com.bit.hellopt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.hellopt.service.meal.MealService;
import com.bit.hellopt.vo.meal.MealVO;

@Controller
public class MealController {
	
	@Autowired
	MealService service;
	
	@RequestMapping("/meal")
	public String getMeal(Model model) {
		List<MealVO> mealList = service.getMealList();
		System.out.println("음식리스트 가져오기 성공!");
		model.addAttribute("mealList", mealList);
		return "meal/meal";
	}
}
