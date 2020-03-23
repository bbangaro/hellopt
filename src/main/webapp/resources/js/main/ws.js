//웹소켓 객체
var ws = null;

//페이지가 로딩된 후 소켓객체 생성
$(function() {
	// 서버의 웹소켓 객체 연결하기 
	ws = new WebSocket("ws://localhost:8000/hellopt/alarm");
	
	//정상 연결 됐을 때 
	ws.onopen = function () {
//		var result = document.getElementById('result');
//		var alarm = '<img src="${pageContext.request.contextPath}/resources/images/meeting/localtag.png">';
		
		console.log("웹 소켓 접속 성공");
	};
	
	//서버에서 메시지가 왔을 때, 메시지 객체를 매개변수로 받는다
	ws.onmessage = function (message) {
		console.log(message.data);
	};
	
	//웹소켓이 닫혔을 때
	ws.onclose = function () {
		console.log("웹 소켓 연결 종료");
	};
	
	//웹소켓에 에러가 발생했을 때
	ws.onerror = function (evt) {
		$("#result").oppend(evt.data + "<br>");
	};
	
});

