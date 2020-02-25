package com.bit.hellopt.service.user;

import java.util.List;

import com.bit.hellopt.vo.user.User;

public interface UserService {
	public void regiserUser(User user);
	public int isUser(String userId);
	public List<User> getUserList();
	public User findUserById(String userId);
}
