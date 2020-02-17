package com.bit.hellopt.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.UserMapper;
import com.bit.hellopt.vo.user.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper mapper;

	@Override
	public void regiserUser(User user) {
		mapper.insertUser(user);
	}
	
}
