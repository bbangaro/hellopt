package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.User;

public interface UserMapper {

	@Select("SELECT * FROM users")
	public List<User> getAllUser(); 
}
