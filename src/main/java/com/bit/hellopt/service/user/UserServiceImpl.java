package com.bit.hellopt.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.UserMapper;
import com.bit.hellopt.vo.user.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper mapper;
	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public void regiserUser(User user) {
		user.setUserRole("ROLE_USER");
		user.setUserPw(passwordEncoder.encode(user.getUserPw()));
		mapper.insertUser(user);
	}

	@Override
	public int isUser(String userId) {
		return mapper.isUser(userId);
	}
	
}
