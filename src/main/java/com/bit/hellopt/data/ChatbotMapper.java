package com.bit.hellopt.data;

import java.util.List;
import java.util.Map;

import com.bit.hellopt.vo.chatbot.ChatbotVO;

public interface ChatbotMapper {	//DAO
	public List<Map<String, Object>> chatList(Map<String, Object> map);
	public List<ChatbotVO> selectChatbotVOList(Map<String, Object> map);
	public void insertChatbotVO(ChatbotVO vo);
}
