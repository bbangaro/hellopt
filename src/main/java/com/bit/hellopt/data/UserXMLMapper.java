package com.bit.hellopt.data;

import java.util.List;

import com.bit.hellopt.vo.user.User;

public interface UserXMLMapper {
	public User selectUser(String userId);
	public List<User> pagingUserList(int page);
	public int countUsers();
}
