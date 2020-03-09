package com.bit.hellopt.service.calender;

import java.util.List;

import com.bit.hellopt.vo.calendar.CalendarVO;

public interface CalendarService {
	
	//월 뽑기
	List<CalendarVO> getMonth2(String month);
	/*
	// 미팅 테이블 전체 조회
	List<MeetingVO> getMeetingVO();
	
	// 지역 카테고리 조회
	List<LocalVO> getLocalVO();
	
	// 모임 카테고리 조회
	List<CategoryCodeVO> getCategoryCodeVO();
		
	// 게시글 상세 조회
	MeetingVO getMeetingOne(int meetingIdx);
	List<MeetingFileVO> getMeetingOneFiles(int meetingIdx);
	
	// 게시글 입력
	void insertMeeting(MeetingVO meetingVO);
	// 게시글 입력 > 최대인원수
	void insertMaxMeeting(MeetingVO meetingVO);
	// 게시글 입력 > 승인 테이블
	void insertConsentYn(MeetingVO meetingVO);
	// 게시글 입력 > 업롣 파일
	void insertMeetingFiles(int fkMeetingIdx, String mOriImg, String mSysImg, String filePath);
	
	// 게시글 수정
	void updateMeetingOk(MeetingVO meetingVO);
	// 게시글 수정 > 최대인원수
	void updateMaxMeeting(MeetingVO meetingVO);
	
	
	// 게시글 삭제
	void deleteMeeting(int meetingIdx);
	*/
	

}