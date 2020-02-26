package com.bit.hellopt.service.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.MeetingMapper;
import com.bit.hellopt.vo.meeting.MeetingVO;

@Service
public class MeetingServiceImpl implements MeetingService {
	
	@Autowired
	MeetingMapper meetingMapper;

	@Override
	public List<MeetingVO> getMeetingVO() {
		return meetingMapper.getMeetingVO();
	}

	@Override
	public MeetingVO getMeetingOne(int meetingIdx) {
		return meetingMapper.getMeetingOne(meetingIdx);
	}
	

}
