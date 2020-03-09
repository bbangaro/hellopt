package com.bit.hellopt.service.liveclass;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.ClassMemberMapper;
import com.bit.hellopt.vo.live.ClassMember;

@Service
public class ClassMemberServiceImpl implements ClassMemberService {
	
	@Autowired
	ClassMemberMapper classMemberMapper;
	
	@Override
	public void insertClassMember(ClassMember info) {
		classMemberMapper.insertClassMember(info);
	}

	//강의번호, 아이디로 조회
	@Override
	public List<ClassMember> getClassMember(ClassMember info) {
		return classMemberMapper.getClassMember(info);
	}

	//아이디로 조회
	@Override
	public List<ClassMember> getClassMem(ClassMember info) {
		return classMemberMapper.getClassMem(info);
	}

	//강의번호로 조회
	@Override
	public ClassMember getClassM(int classMemberIdx) {
		return classMemberMapper.getClassM(classMemberIdx);
	}

}
