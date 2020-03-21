package com.bit.hellopt.vo.reviewboard;

import java.util.HashMap;
import java.util.Map;

public class commandMap {
	Map<String, Object> map = new HashMap<String, Object>();
	
	public void put(String key, Object value) {
		map.put(key, value);
	}
	public Object get(String key) {
		return map.get(key);
	}
	public boolean isEmpty() {
		return map.isEmpty();
	}
	public Map<String, Object> getMap(){
		
	}
}
