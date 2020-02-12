package com.bit.hellopt.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.UserMapper;
import com.bit.hellopt.data.UserMapper2;
import com.bit.hellopt.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	UserMapper userMapper;
	@Autowired
	UserMapper2 userMapper2;
	
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public List<User> findAll() {
		return userMapper.getAllUser();
	}

	@Override
	public User findById(String userId) {
		return userMapper.getUserById(userId);
	}

	@Override
	public void save(User user) {
		//userMapper.insertUser(user);
		userMapper2.insertUser(user);
	}

	@Override
	public User findByIdAndPw(String userId, String userPw) {
		return userMapper.getUser(userId, userPw);
	}

	@Override
	public int existUser(User user) {
		return userMapper.existUser(user);
	}
	
}
