package com.bit.hellopt.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.hellopt.service.chatbot.ChatbotService;
import com.bit.hellopt.vo.chatbot.ChatbotVO;

@Controller
@SessionAttributes("chatbot") //chatbot이라는 이름의 Model이 있으면 session에 저장
public class ChatBotController {
	
	@Autowired
	ChatbotService chatbotService;
	
	@RequestMapping("/chatbot.ajax")
	public String getChatList(Model model,
			@RequestParam(name = "chatting_Idx", defaultValue = "1") int chatting_Idx
			)throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chatting_Idx", chatting_Idx);
		
		List<Map<String, Object>> ChatList = chatbotService.ChatList(map);
		
		model.addAttribute("ChatList",ChatList);
		
		return "jsonView";
	}	
	
}
