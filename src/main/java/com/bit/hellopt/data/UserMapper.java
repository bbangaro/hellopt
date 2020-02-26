package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bit.hellopt.vo.User;

public interface UserMapper {

	@Select("SELECT * FROM users")
	public List<User> getAllUser();

	@Select("SELECT * FROM users WHERE user_id = #{userId}")
	public User getUserById(String userId);

	@Select("SELECT count(*) FROM users_tb WHERE user_id = #{userId}")
	public int isUser(String userId);

	@Select("SELECT * FROM users_tb")
	public List<User> getUserList();

	@Update("UPDATE users_tb SET user_role = #{userRole}, user_name = #{userName}, "
			+ "user_gender = #{userGender}, user_address = #{userAddress}, user_birth = TO_DATE(#{userBirth}, 'YYYY-MM-DD'), "
			+ "user_job = #{userJob}, user_root = #{userRoot}, user_height = #{userHeight}, user_weight = #{userWeight}, user_profile = #{userProfile} WHERE user_id = #{userId}")
	public void updateUser(User user);

	@Delete("DELETE FROM users_tb WHERE user_id = #{userId}")
	public void deleteUser(User user);
}
