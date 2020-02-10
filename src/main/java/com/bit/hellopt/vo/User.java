package com.bit.hellopt.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class User {
	@NotBlank
	@Size(min = 3, max = 10)
	private String userId;
	@NotBlank
	@Size(min = 5, max = 15)
	private String userPw;
	@NotBlank
	private String name;
	private String role;
	
	public User() {}
	
	public User(String userId, String userPw, String name, String role) {
		this.userId = userId;
		this.userPw = userPw;
		this.name = name;
		this.role = role;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", name=" + name + ", role=" + role + "]";
	}
	
}
