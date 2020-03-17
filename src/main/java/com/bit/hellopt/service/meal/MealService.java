package com.bit.hellopt.service.meal;

import java.util.List;

import com.bit.hellopt.vo.meal.MealVO;

public interface MealService {
	//전체조회
	List<MealVO> getMealList();
}
