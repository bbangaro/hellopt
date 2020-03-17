package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.meal.MealVO;

public interface MealMapper {
	
	@Select("SELECT * FROM MEAL_TB")
	public List<MealVO> getMeal();

}
