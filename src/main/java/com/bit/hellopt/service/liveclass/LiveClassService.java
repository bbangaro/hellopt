package com.bit.hellopt.service.liveclass;

import java.util.List;

import com.bit.hellopt.vo.LiveClass;

public interface LiveClassService {
	//1. 입력 - 파라미터명 수정하기!!
	void insertClass(LiveClass liveClass);
	//2. 수정
	
	//3. 삭제
	void deleteClass(int classIdx);
	
	//4. 조회
	//4-1. 전체 조회
	List<LiveClass> getLiveClass();
	
	//4-2. 하나만 조회
	LiveClass getClassDetail(int classIdx);
}	
