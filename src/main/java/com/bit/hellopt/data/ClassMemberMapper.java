package com.bit.hellopt.data;

import org.apache.ibatis.annotations.Insert;

import com.bit.hellopt.vo.live.ClassMember;

public interface ClassMemberMapper {
	@Insert("INSERT INTO CLASS_MEMBER_TB (CLASS_MEMBER_IDX, FK_CLASS_IDX, FK_USER_ID, PAY_STATUS)"
			+ "VALUES(CLASS_MEMBER_TB_SEQ.NEXTVAL, #{fkClassIdx}, #{fkUserId}, '결제대기')")
	public void insertClassMember(ClassMember info);
}
