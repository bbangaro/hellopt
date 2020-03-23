package com.bit.hellopt.controller.meeting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bit.hellopt.service.meeting.MeetingService;
import com.bit.hellopt.vo.meeting.MeetingVO;

//https://bloodfinger.tistory.com/40?category=366386
@Component("meetingAlarmHandler")
public class MeetingAlarmHandler extends TextWebSocketHandler {
	
	@Autowired
	MeetingService service;
	
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대 1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	// 로그
	private static Logger logger = LoggerFactory.getLogger(MeetingAlarmHandler.class);
	
	//※클라이언트 연결 된 후
	//WebSocketSession을 매개 변수로 받고 클라이언트가 연결된 후 
	//해당 클라이언트의 정보를 가져와 연결확인 작업을한다.
	//클라이언트의 세션을 세션 저장 리스트에 add()로 추가 한다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessions.add(session);
		System.out.println("소켓연결 : " + session.getId());
		
	
		
	}

	//※클라이언트와 연결이 끊어진 경우
	//add()와 반대로 remove()를 이용해서 세션리스트에서 제거한다.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
		logger.info("{} 끝", session.getId());
		System.out.println("소켓연결끝 : " + session.getId());
	}
	// 웹 소켓 서버로 데이터를 전송했을 경우
	//연결된 모든 클라이언트에게 메시지 전송 : 리스트
	//연결된 모든 사용자에게 보내야 하므로 for문으로 세션리스트에 있는 모든 세션들을 돌면서
	// sendMessage()를 이용해 데이터를 주고 받는다.
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		for (WebSocketSession sess : sessions ) {
			sess.sendMessage(new TextMessage("소켓메시지"+message.getPayload()));
		}
	}
	
	   public void progressCount(String progressSt) throws Exception {
		//미팅 게시글이 등록된 후 게시글 상태가 '대기'인 항목들이 있을 경우 관리자에게 알람 전송
		
		Iterator<WebSocketSession> iterator = sessions.iterator();
		
		while(iterator.hasNext()) {
			WebSocketSession session = iterator.next();
			try {
				String progressCnt = service.progressCnt(progressSt).toString();
				//전송할 메시지가 있는 경우를 text 객체로 만든다
				TextMessage message = new TextMessage(progressCnt);
				System.out.println("message : "+message);
				//TextMessage를 클라이언트에게 전송한다.
				session.sendMessage(message);
			} catch (IOException e){
				//전송중 에러가 발생하든 해당 클라이언트와 통신을 담당하는 WebSocketSession 객체를 삭제한다
				iterator.remove();
			}
		}
		
	}
	
	
	/*
	//서버에 접속이 성공 했을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		
		String insertMeeting = getProgressSt(session);
		userSessionsMap.put(insertMeeting, session);
	}
	
	//소켓에 메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// String insertMeeting = getProgressSt(session0;
		// 모든 유저에게 보낸다 - 브로드 캐스팅
		// for (WebSocketSession sess : sessions) {
		// 			sess.sendMessage(new TextMessage(senderNickname + ": " + message.getPayload()));
		// }
		
		// protocol : 게시글 번호, 게시글 상태, 글 작성자, 관리자
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 1) {
				// 핸들러는 String 타입밖에 못받음
				String progressSt = strs[0];
				
				//작성자가 로그인 해서 있다면
				WebSocketSession boardWriterSession = userSessionsMap.get(progressSt);
				
				if(progressSt.equals("대기")) {
					TextMessage alarm = new TextMessage("<a href=''>대기중인 모임신청 게시물이 있습니다</a>");
					boardWriterSession.sendMessage(alarm);
				}
				
			}
		}
	}
	
	//연결 해제될 떼
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	     userSessionsMap.remove(session.getId());
		 sessions.remove(session);
	}
	
	//웹소켓 progressSt 가져오기
	private String getProgressSt(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MeetingVO progressSt = (MeetingVO)httpSession.get("meetingVO");
		
		if (progressSt== null) {
			return session.getId();
		} else {
			return progressSt.getProgressSt();
		}
		
	}
	*/
	
}
