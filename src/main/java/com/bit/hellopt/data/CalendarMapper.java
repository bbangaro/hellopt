package com.bit.hellopt.data;

import java.util.List;

import com.bit.hellopt.vo.calendar.CalendarVO;

public interface CalendarMapper {
	
	public List<CalendarVO> getMonth2(String month);
	
	/*
	public List<MeetingVO> getMeetingVO();
	
	public List<LocalVO> getLocalVO();
	
	public List<CategoryCodeVO> getCategoryCodeVO();

	public MeetingVO getMeetingOne(int meetingIdx);
	public List<MeetingFileVO> getMeetingOneFiles(int meetingIdx);
	
	public void insertMeeting(com.bit.hellopt.vo.meeting.MeetingVO meetingVO);
	public void insertMaxMeeting(com.bit.hellopt.vo.meeting.MeetingVO meetingVO);
	public void insertConsentYn(com.bit.hellopt.vo.meeting.MeetingVO meetingVO);
	public void insertMeetingFiles(HashMap<String, Object> HashMap);
	
	public void updateMeeting(com.bit.hellopt.vo.meeting.MeetingVO meetingVO);
	public void updateMaxMeeting(com.bit.hellopt.vo.meeting.MeetingVO meetingVO);
	
	
	public void deleteMeeting(int meetingIdx);
	*/
}
