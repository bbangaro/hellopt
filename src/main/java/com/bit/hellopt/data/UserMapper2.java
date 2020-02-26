package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.hellopt.vo.User;

public interface UserMapper2 {
	public List<User> getAllUser(); 
	
	public User getUserById(String userId);
	
	public User getUser(@Param("userId") String userId, @Param("userPw")String userPw);
	
	public int existUser(User user);
	
	public void insertUser(User user);
}
