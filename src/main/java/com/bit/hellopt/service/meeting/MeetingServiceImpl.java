package com.bit.hellopt.service.meeting;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.MeetingMapper;
import com.bit.hellopt.vo.meeting.CategoryCodeVO;
import com.bit.hellopt.vo.meeting.LocalVO;
import com.bit.hellopt.vo.meeting.MeetingFileVO;
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
	// 미팅 상세리스트 파일 조회
	@Override
	public List<MeetingFileVO> getMeetingOneFiles(int meetingIdx) {
		return meetingMapper.getMeetingOneFiles(meetingIdx);
	}



	// 모임 개설 인서트
	@Override
	public void insertMeeting(MeetingVO meetingVO) {
		meetingMapper.insertMeeting(meetingVO);
	}
	// 모임 최대 인원수
	@Override
	public void insertMaxMeeting(MeetingVO meetingVO) {
		meetingMapper.insertMaxMeeting(meetingVO);
	}
	// 모임 승낙 테이블
	@Override
	public void insertConsentYn(MeetingVO meetingVO) {
		meetingMapper.insertConsentYn(meetingVO);
	}
	// 파일 업로드
	@Override
	public void insertMeetingFiles(int fkMeetingIdx, String mOriImg, String mSysImg, String filePath) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("fkMeetingIdx", fkMeetingIdx);
		hm.put("mOriImg", mOriImg);
		hm.put("mSysImg", mSysImg);
		hm.put("filePath", filePath);
		
		meetingMapper.insertMeetingFiles(hm);
	}

	// 모임 수정 
	@Override
	public void updateMeetingOk(MeetingVO meetingVO) {
		meetingMapper.updateMeeting(meetingVO);
	}
	// 모임 최대 인원수
	@Override
	public void updateMaxMeeting(MeetingVO meetingVO) {
		meetingMapper.updateMaxMeeting(meetingVO);
	}
	
	// 모임 삭제
	@Override
	public void deleteMeeting(int meetingIdx) {
		meetingMapper.deleteMeeting(meetingIdx);
		
	}

	


}
