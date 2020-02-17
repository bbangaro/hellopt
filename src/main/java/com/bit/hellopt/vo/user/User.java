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
	private String name;
	private String role;
	@ValidEmail
	private String email;
	
	public User() {}
	
	
	public User(@NotBlank @Size(min = 3, max = 10) String userId, @NotBlank @Size(min = 5, max = 15) String userPw,
			@NotBlank String name, String role, String email) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.name = name;
		this.role = role;
		this.email = email;
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
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", name=" + name + ", role=" + role + ", email="
				+ email + "]";
	}

}
