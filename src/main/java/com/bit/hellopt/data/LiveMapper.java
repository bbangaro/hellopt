package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.live.LiveClass;

public interface LiveMapper {
	@Select("SELECT CLASS_NAME FROM CLASS_TB WHERE CLASS_IDX = #{classIdx}")
	public String getClassName(int classIdx);
	
	public int countClasses();
	
	public List<LiveClass> pagingClassList(@Param("end") int end);
	
	public LiveClass randomClass();
}
