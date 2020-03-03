package com.bit.hellopt.service.meeting;

import java.util.List;

import com.bit.hellopt.vo.meeting.CategoryCodeVO;
import com.bit.hellopt.vo.meeting.LocalVO;
import com.bit.hellopt.vo.meeting.MeetingVO;

public interface MeetingService {
	
	// 미팅 테이블 전체 조회
	List<MeetingVO> getMeetingVO();
	
	// 지역 카테고리 조회
	List<LocalVO> getLocalVO();
	
	// 모임 카테고리 조회
	List<CategoryCodeVO> getCategoryCodeVO();
		
	
	// 게시글 상세 조회
	MeetingVO getMeetingOne(int meetingIdx);
	
	// 게시글 입력
	void insertMeeting(MeetingVO meetingVO);
	// 게시글 입력 > 최대인원수
	void insertMaxMeeting(MeetingVO meetingVO);
	
	// 게시글 수정
	void updateMeetingOk(MeetingVO meetingVO);
	// 게시글 수정 > 최대인원수
	void updateMaxMeeting(MeetingVO meetingVO);
	
	
	// 게시글 삭제
	void deleteMeeting(int meetingIdx);
	
	

}
