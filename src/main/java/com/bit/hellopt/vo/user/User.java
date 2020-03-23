package com.bit.hellopt.vo.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {
	@Pattern(regexp = "^[0-9a-z-_]{5,20}$", message = "5~20 characters consisting of lowercase letters(a-z), numbers, or special characters (_, -)")
	private String userId;
	@Pattern(regexp = "^[\\w!@#$%^&*()-_]{5,20}$", message = "8~16 characters consisting of letters(A-Z, a-z), numbers, or special characters(!, @, #, $, %, ^, &, *, (, ), _, -).")
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
	private int userHeight;
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
		this.userBirth = userBirth.split(" ")[0];
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
