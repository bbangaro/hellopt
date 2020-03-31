package com.bit.hellopt.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bit.hellopt.data.UserMapper;
import com.bit.hellopt.data.UserXMLMapper;
import com.bit.hellopt.vo.user.User;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper mapper;
	@Autowired
	UserXMLMapper xmlMapper;
		
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	UserProfileService profileService;

	@Override
	public void registerUser(User user) {
		user.setUserRole("ROLE_USER");
		user.setUserPw(passwordEncoder.encode(user.getUserPw()));
		mapper.insertUser(user);
	}
	
	@Override
	public void registerUser(User user, MultipartFile file) {
		String profileFile = profileService.insertProfile(user, file);
		
		user.setUserProfile(profileFile);
		
		user.setUserRole("ROLE_USER");
		user.setUserPw(passwordEncoder.encode(user.getUserPw()));
		mapper.insertUser(user);
	}

	@Override
	public int isUser(String userId) {
		return mapper.isUser(userId);
	}

	@Override
	public List<User> getUserList() {
		return mapper.getUserList();
	}

	@Override
	public User findUserById(String userId) {
		return mapper.selectUserById(userId);
		//return xmlMapper.selectUser(userId);
	}

	@Override
	public void updateUser(User user) {
		mapper.updateUser(user);
	}
	
	

	@Override
	public void updateNormalUser(User user) {
		user.setUserPw(passwordEncoder.encode(user.getUserPw()));
		xmlMapper.updateUser(user);
	}

	@Override
	public void deleteUser(User user) {
		mapper.deleteUser(user);
	}

	@Override
	public List<User> pagingUserList(String search, String searchValue, int page) {
		return xmlMapper.pagingUserList(search, searchValue, page);
	}

	@Override
	public int getLastPage(String search, 
			String searchValue, int page) {
		int lastPage = xmlMapper.countUsers(search, searchValue) / 10 + 1;
		int _lastPage = page - (page % 10) + 10; 
		return lastPage > _lastPage ? _lastPage : lastPage;
	}

	@Override
	public void disableUser(User user) {
		mapper.disableUSer(user);
	}
	
}
