package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.meal.MealVO;

public interface MealMapper {

	@Select("SELECT * FROM MEAL_TB WHERE ROWNUM <= 10")
	public List<MealVO> getMeal();

}
