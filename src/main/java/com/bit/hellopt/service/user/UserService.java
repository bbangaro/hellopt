package com.bit.hellopt.service.user;

import com.bit.hellopt.vo.user.User;

public interface UserService {
	public void regiserUser(User user);
	public int isUser(String userId);
}
