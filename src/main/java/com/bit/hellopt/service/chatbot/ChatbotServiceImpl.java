package com.bit.hellopt.service.chatbot;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.hellopt.data.ChatbotMapper;
import com.bit.hellopt.vo.chatbot.ChatbotVO;

@Service("chatbotService")
public class ChatbotServiceImpl implements ChatbotService {

	@Autowired
	ChatbotMapper mapper;
	
	public ChatbotServiceImpl() {
		System.out.println(">> ChatBotServiceImpl() 실행");
	}

	@Override
	public List<Map<String, Object>> ChatList(Map<String, Object> map) {
		return mapper.chatList(map);
	}

	@Override
	public void insertChatbotVO(ChatbotVO vo) {
		mapper.insertChatbotVO(vo);
	}

	
	
	
}
