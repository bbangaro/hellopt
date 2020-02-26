package com.bit.hellopt.service.meeting;

import java.util.List;

import com.bit.hellopt.vo.LiveClass;
import com.bit.hellopt.vo.meeting.MeetingVO;

public interface MeetingService {
	
	// 전체 조회
	List<MeetingVO> getMeetingVO();
	
	// 게시글 상세 조회
	MeetingVO getMeetingOne(int meetingIdx);
	

}
