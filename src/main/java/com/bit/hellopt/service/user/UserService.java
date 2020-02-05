package com.bit.hellopt.service.user;

import java.util.List;

import com.bit.hellopt.vo.User;

public interface UserService {
	List<User> findAll();
	User findById(String userId);
	User findByIdAndPw(String userId, String userPw);
	void save(User user);
}
