package com.bit.hellopt.service.calender;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.CalendarMapper;
import com.bit.hellopt.vo.calendar.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService {

		
	@Autowired
	CalendarMapper calenderMapper;
	
	// 월뽑기
	@Override
	public List<CalendarVO> getMonth2(String month) {
		return calenderMapper.getMonth2(month);
	}

	
	


}
