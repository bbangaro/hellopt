package com.bit.hellopt.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.hellopt.service.chatbot.ChatbotService;
import com.bit.hellopt.vo.chatbot.ChatbotVO;

@Controller
@SessionAttributes("chatbot") //chatbot이라는 이름의 Model이 있으면 session에 저장
public class ChatBotController {
	
	@Autowired
	ChatbotService chatbotService;
	
	//--------채팅 내역 넣기 ---------------
	@PostMapping("/insertchat")
	@ResponseBody
	public void insertChatbotVO(ChatbotVO vo) {
		chatbotService.insertChatbotVO(vo);
	}

	public ChatBotController(ChatbotService chatbotService) {
		this.chatbotService = chatbotService;
	}
	
	@RequestMapping("/chatbot")
	@ResponseBody
	public void getChatbotList(ChatbotVO vo, Model model) {
		System.out.println("챗봇리스트다");
		ChatbotVO chatbot = ChatbotService.getChatbot(vo);
		
		System.out.println("챗봇 URL실행시 vo에 담긴값 출력 " + vo);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("chatting_content", "대충 세상이 망한뒤");
		map.put("nxt_content", "김성모작가 만화");
		map.put("chatting_idx", 1);
		map.put("nxt_idx", 2);
	}
	
	
	
	
}
