package com.bit.hellopt.vo.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.bit.hellopt.annotation.ValidEmail;

public class User {
	@NotBlank
	@Size(min = 3, max = 10)
	private String userId;
	@NotBlank
	@Size(min = 5, max = 15)
	private String userPw;
	@NotBlank
	private String userName;
	private String userRole;
	@ValidEmail
	private String userEmail;
	
	public User() {}

	public User(@NotBlank @Size(min = 3, max = 10) String userId, @NotBlank @Size(min = 5, max = 15) String userPw,
			@NotBlank String userName, String userRole, String userRmail) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userRole = userRole;
		this.userEmail = userRmail;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getUserRmail() {
		return userEmail;
	}

	public void setUserRmail(String userRmail) {
		this.userEmail = userRmail;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userRole=" + userRole
				+ ", userRmail=" + userEmail + "]";
	}
	
}
