package com.bit.hellopt.data;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.user.User;

public interface UserMapper {
	@Select("SELECT * FROM users_tb WHERE user_id = #{userId}")
	public User selectUserById(String userId);
	
	@Insert("INSERT INTO users_tb (user_id, user_pw, user_role, user_name) VALUES (#{userId}, #{userPw}, #{userRole}, #{userName})")
	public void insertUser(User user);
}
