package com.bit.hellopt.service.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.MeetingMapper;
import com.bit.hellopt.vo.meeting.CategoryCodeVO;
import com.bit.hellopt.vo.meeting.LocalVO;
import com.bit.hellopt.vo.meeting.MeetingVO;

@Service
public class MeetingServiceImpl implements MeetingService {
	
	//매퍼 주입
	@Autowired
	MeetingMapper meetingMapper;

	// 미팅TB 조회
	@Override
	public List<MeetingVO> getMeetingVO() {
		return meetingMapper.getMeetingVO();
	}
	
	// 지역TB조회
	@Override
	public List<LocalVO> getLocalVO() {
		return meetingMapper.getLocalVO() ;
	}
	
	// 모임유형TB 조회
	@Override
	public List<CategoryCodeVO> getCategoryCodeVO() {
		return meetingMapper.getCategoryCodeVO();
	}
	
	// 미팅 상세 리스트 조회
	@Override
	public MeetingVO getMeetingOne(int meetingIdx) {
		return meetingMapper.getMeetingOne(meetingIdx);
	}

	// 모임 개설 인서트
	@Override
	public void insertMeeting(MeetingVO meetingVO) {
		meetingMapper.insertMeeting(meetingVO);
		
	}

	// 모임 수정 
	@Override
	public void updateMeetingOk(MeetingVO meetingVO) {
		meetingMapper.updateMeeting(meetingVO);
		
	}
	
	// 모임 삭제
	@Override
	public void deleteMeeting(int meetingIdx) {
		meetingMapper.deleteMeeting(meetingIdx);
		
	}

}
