package com.bit.hellopt.service.calender;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.CalendarMapper;
import com.bit.hellopt.vo.calendar.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService {

		
	@Autowired
	CalendarMapper calendarMapper;
	
	// 월뽑기
	@Override
	public List<CalendarVO> getMonth2(String month) {
		return calendarMapper.getMonth2(month);
	}
	
	@Override
	public List<CalendarVO> getCalendar() {
		return calendarMapper.getCalendar();
	}
	
	// 게시글 상세 조회
	@Override
	public CalendarVO getOneCalendar(int calendarIdx) {
		return calendarMapper.getOneCalendar(calendarIdx);
	}


	@Override
	public void insertCalVideo(HashMap<String, Object> hm) {
		calendarMapper.insertCalVideo(hm);
	}


	
	


}
