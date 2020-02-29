package com.bit.hellopt.service.liveclass;

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

}
