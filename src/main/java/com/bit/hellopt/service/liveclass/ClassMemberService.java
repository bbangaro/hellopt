package com.bit.hellopt.service.liveclass;

import java.util.List;

import com.bit.hellopt.vo.live.ClassMember;

public interface ClassMemberService {
	//1. 강의 신청 멤버 등록
	void insertClassMember(ClassMember info);
	
	//2. 수정
	
	//3. 삭제
	
	//4. 조회
	//강의 번호, 아이디로 조회
	List<ClassMember> getClassMember(ClassMember info);

	//아이디로 조회
	List<ClassMember> getClassMem(ClassMember info);
	
	//강의번호로 조회
	ClassMember getClassM(int classMemberIdx);
}
	