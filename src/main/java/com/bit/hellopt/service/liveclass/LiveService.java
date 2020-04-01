package com.bit.hellopt.service.liveclass;

import java.util.List;

import com.bit.hellopt.vo.live.LiveClass;

public interface LiveService {
	//강의 제목 불러오기
	public String getClassName(int classIdx);
	
	//강의 개수 구하기
	public int countClasses();
	
	//강의 리스트 페이징
	public List<LiveClass> PagingClassList(int end);
}
