package com.bit.hellopt.service.liveclass;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.LiveMapper;
import com.bit.hellopt.vo.live.LiveClass;

@Service
public class LiveServiceImpl implements LiveService {
	
	@Autowired
	LiveMapper liveMapper;
	
	@Override
	public String getClassName(int classIdx) {
		return liveMapper.getClassName(classIdx);
	}

	@Override
	public int countClasses() {
		return liveMapper.countClasses();
	}

	@Override
	public List<LiveClass> PagingClassList(int end) {
		return liveMapper.PagingClassList(end);
	}
}
