package com.bit.hellopt.data;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bit.hellopt.vo.live.ClassMember;

public interface ClassMemberMapper {
	@Insert("INSERT INTO CLASS_MEMBER_TB (CLASS_MEMBER_IDX, FK_CLASS_IDX, FK_USER_ID, PAY_STATUS)"
			+ "VALUES(CLASS_MEMBER_TB_SEQ.NEXTVAL, #{fkClassIdx}, #{fkUserId}, '결제대기')")
	public void insertClassMember(ClassMember info);
	
	//강의번호와 아이디로 조회...필요 없으면 삭제하기
	@Select("select * from class_member_tb where class_member_idx = (select class_member_idx from class_member_tb where fk_class_idx = #{fkClassIdx} and fk_user_id = #{fkUserId})")
	public List<ClassMember> getClassMember(ClassMember info);

	//아이디로 조회
	@Select("SELECT * FROM CLASS_MEMBER_TB WHERE FK_USER_ID = #{fkUserId}")
	public List<ClassMember> getClassMem(ClassMember info);
	
	//강의번호로 조회
	@Select("SELECT * FROM CLASS_MEMBER_TB WHERE CLASS_MEMBER_IDX = #{classMemberIdx}")
	public ClassMember getClassM(int classMemberIdx);
}
