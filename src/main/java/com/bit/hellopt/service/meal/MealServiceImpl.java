package com.bit.hellopt.service.meal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.MealMapper;
import com.bit.hellopt.vo.meal.MealVO;

@Service
public class MealServiceImpl implements MealService{
	
	@Autowired
	MealMapper mealMapper;
	
	@Override
	public List<MealVO> getMealList() {
		return mealMapper.getMeal();
	}
}
