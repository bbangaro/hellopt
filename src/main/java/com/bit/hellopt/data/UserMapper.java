package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.User;

public interface UserMapper {

	@Select("SELECT * FROM users")
	public List<User> getAllUser(); 
	
	@Select("SELECT * FROM users WHERE user_id = #{userId}")
	public User getUserById(String userId);
	
	@Select("SELECT * FROM users WHERE user_id = #{userId} AND user_pw = #{userPw}")
	public User getUser(@Param("userId") String userId, @Param("userPw")String userPw);
	
	@Insert("INSERT INTO users (user_id, user_pw, name, role) values (#{userId}, #{userPw}, #{name}, #{role})")
	public void insertUser(User user);
}
