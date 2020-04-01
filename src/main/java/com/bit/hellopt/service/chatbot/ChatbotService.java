package com.bit.hellopt.service.chatbot;

import java.util.List;
import java.util.Map;

import com.bit.hellopt.vo.chatbot.ChatbotVO;

public interface ChatbotService {

	public List<Map<String, Object>> ChatList(Map<String, Object> map);

	public static ChatbotVO getChatbot(ChatbotVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	void insertChatbotVO(ChatbotVO vo);
	
}
