package com.bit.hellopt.data;

import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.User;

public interface UserMapper {
	@Select("SELECT FROM user_tb WHERE user_id = #{userId}")
	public User selectUserById(String userId);
}
