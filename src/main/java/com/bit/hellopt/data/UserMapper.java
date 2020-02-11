package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.User;

public interface UserMapper {

	@Select("SELECT * FROM users_tb")
	public List<User> getAllUser(); 
	
	@Select("SELECT * FROM users_tb WHERE user_id = #{userId}")
	public User getUserById(String userId);
	
	@Select("SELECT * FROM users_tb WHERE user_id = #{userId} AND user_pw = #{userPw}")
	public User getUser(@Param("userId") String userId, @Param("userPw")String userPw);
	
	@Select("SELECT count(*) FROM users_tb WHERE user_id = #{userId} AND user_pw = #{userPw}")
	public int existUser(User user);
	
	@Insert("INSERT INTO users_tb (user_id, user_pw, name, role) values (#{userId}, #{userPw}, #{name}, #{role})")
	public void insertUser(User user);
}
