<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				$('<div></div>').text('닉네임 : ' + msg).appendTo("#txtLayout");
			});
		});
	
	</script>	
	<!-- 콘텐츠 시작 { -->
	<div id="wrapper">
		<div class="tit-wr tit-wr-ani">
	   	 <h2>라이브 스트리밍</h2>
	  	</div><!-- //tit-wr -->
	
		<div class="sub-content">
			<div class="inner">
				<div class="stream-cont clfix">
				    <!-- 동영상 나중에 스트리밍 화면으로 대체 -->
				    <div id="video">
						<iframe src="https://www.youtube.com/embed/azxahQi6vFo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>	
					</div>
					
					<!-- 채팅박스 -->
					<div id="chat_box" class="chat">
						<div class="txtLayout" id="txtLayout">
						</div>
						<div class="chatBtn">
							<input class="chattxt" type="text" id="msg" placeholder="Type a message" />
							<button class="chatbtn" id="send">보내기</button> 
						</div>
					</div><!-- //chat_box -->		
				</div><!-- //stream-cont -->	
			</div><!-- //inner -->	
		</div><!-- // sub-content -->
	</div><!-- // wrapper -->
</body>
</html>