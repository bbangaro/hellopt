package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.user.User;

public interface UserMapper {
	@Select("SELECT * FROM users_tb WHERE user_id = #{userId}")
	public User selectUserById(String userId);
	
	@Insert("INSERT INTO users_tb (user_id, user_pw, user_role, user_name, user_gender"
			+ ", user_address, user_birth, user_job, user_root, user_height, user_weight, user_profile) "
			+ "VALUES (#{userId}, #{userPw}, #{userRole}, #{userName}, #{userGender}"
			+ ", #{userAddress}, TO_DATE(#{userBirth}, 'YYYY-MM-DD'), #{userJob}, #{userRoot}, #{userHeight}, #{userWeight}, #{userProfile})")
	public void insertUser(User user);
	
	@Select("SELECT count(*) FROM users_tb WHERE user_id = #{userId}")
	public int isUser(String userId);
	
	@Select("SELECT * FROM users_tb")
	public List<User> getUserList();
}
