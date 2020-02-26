<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라이브 채팅</title>
<meta charset="utf-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/chat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/style.css">
</head>

<body>
	<script src="http://localhost:3000/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>

	<script>
	
		$(function() {
			/*
			var socket = io("http://localhost:3000");
			$("#msg").keydown(function(key) {
				
				//keyCode 13 = 엔터키
				if (key.keyCode == 13) {
					send.click();
				}
			});

 			 $("#send").click(function() {
				socket.emit("send_msg", $("#msg").val());
				$("#msg").val("");
			});

			socket.on("send_msg", function(msg) {
				$('<div></div>').text(' : ' + msg).appendTo("#txtLayout");
			}); */
		}); 
		
		function sendData(username) {
			var socket = io("http://localhost:3000");

			socket.emit("send_user", username);
			socket.emit("send_msg", $("#msg").val());
			$("#msg").val("");

			socket.on("send_msg", function(msg) {
				$('<div></div>').text(username + ' : ' + msg).appendTo("#txtLayout");
			});
		}
	</script>	


	<!-- 콘텐츠 시작 { -->
	<div id="wrapper">
		<div class="tit-wr tit-wr-ani">
	   	 <h2>라이브 스트리밍</h2>
	  	</div><!-- //tit-wr -->
	
		<div class="sub-content">
			<div class="chat_inner">
				<div class="stream-cont clfix">
				    <div id="video">
						<video autoplay playsinline></video>
					</div>
 					<button id="showVideo">Open camera</button>

					<!-- 채팅박스 -->
					<div id="chat_box" class="chat">
						<div class="txtLayout" id="txtLayout">
						</div>
						
						<div class="chatBtn">
						<sec:authorize access="isAuthenticated()">
						    <sec:authentication property="principal" var="user"/> 
							<input class="chattxt" type="text" id="msg" placeholder="Type a message" />
							<input type="button" class="chatbtn" id="send" value="보내기"
								onclick="sendData('${user.username}')">
						</sec:authorize>
						
						
							<!-- <button class="chatbtn" id="send">보내기</button>  -->
						</div>
					</div><!-- //chat_box -->		
				</div><!-- //stream-cont -->	
			</div><!-- //inner -->	
		</div><!-- // sub-content -->
	</div><!-- // wrapper -->

	<script src="${pageContext.request.contextPath}/resources/js/live/live.js"></script>

</body>
</html>