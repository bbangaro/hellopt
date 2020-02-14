package com.bit.hellopt.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.bit.hellopt.data.UserMapper;
import com.bit.hellopt.vo.CustomUserDetail;
import com.bit.hellopt.vo.User;

public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = mapper.selectUserById(username);
		CustomUserDetail userDetail = new CustomUserDetail();
		return null;
	}
	
}
