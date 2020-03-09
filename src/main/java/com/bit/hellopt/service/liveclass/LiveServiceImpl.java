package com.bit.hellopt.service.liveclass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.LiveMapper;

@Service
public class LiveServiceImpl implements LiveService {
	
	@Autowired
	LiveMapper liveMapper;
	
	@Override
	public String getClassName(int classIdx) {
		return liveMapper.getClassName(classIdx);
	}

}
