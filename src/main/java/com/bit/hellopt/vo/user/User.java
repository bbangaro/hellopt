package com.bit.hellopt.vo.user;

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
	private String userName;
	private String userRole;
	private String userEmail;
	private String userGender;
	@Size(max = 100)
	private String userAddress;
	@Size(max = 20)
	private String userJob;
	@Size(max = 10)
	private String userBirth;
	private String userRoot;
	@Size(max = 300)
	private int userHeight;
	@Size(max = 1000)
	private int userWeight;
	private String userProfile;
	
	public User() {}

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

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserJob() {
		return userJob;
	}

	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserRoot() {
		return userRoot;
	}

	public void setUserRoot(String userRoot) {
		this.userRoot = userRoot;
	}

	public int getUserHeight() {
		return userHeight;
	}

	public void setUserHeight(int userHeight) {
		this.userHeight = userHeight;
	}

	public int getUserWeight() {
		return userWeight;
	}

	public void setUserWeight(int userWeight) {
		this.userWeight = userWeight;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	
}
