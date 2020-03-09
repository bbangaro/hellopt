package com.bit.hellopt.data;

import org.apache.ibatis.annotations.Select;

public interface LiveMapper {
	@Select("SELECT CLASS_NAME FROM CLASS_TB WHERE CLASS_IDX = #{classIdx}")
	public String getClassName(int classIdx);
}
