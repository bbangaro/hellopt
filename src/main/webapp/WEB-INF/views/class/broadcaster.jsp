<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>     
<!DOCTYPE html>
<html>
<head>
<title>WebRTC Video Broadcasting</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/live.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/style.css">
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
	
	<style>
	    video {
	        vertical-align: top;
	        width: 100%;
	    }
	</style>
	
	<script>
	    document.createElement('article');
	</script>
</head>
<body>
	<div id="wrapper">
		<div class="tit-wr tit-wr-ani">
			<h2>라이브 스트리밍</h2>
		</div>
		<!-- //tit-wr -->

		<div class="sub-content">
			<article>
			    <section class="experiment">
			        <div class="video-info">
			        	<div id="videos-container">
			        		<video playsinline autoplay="autoplay"></video>
			        	</div>
			        	<div id="class-name"><p>${className } 강의입니다.</p></div>
			        </div>
			        <div id="chat-container">
						<iframe id="chat" src="http://localhost:3000" scrolling="no"></iframe>
			        </div>
			    </section>
			</article>
		</div>
		<!-- // sub-content -->
	</div>
	<!-- // wrapper -->

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<input type="hidden" value="${user.username }" id="userid">
	</sec:authorize>
	<input type="hidden" value="${className }" id="className">
	
	<script>
		var confirm = confirm("방송을 시작하려면 확인을 눌러주세요");
		
		if (!confirm) {
			alert("이전 페이지로 이동합니다.")
			history.back();
		}
    </script>
    
	<script src="http://localhost:5000/socket.io/socket.io.js"></script>
    <script>
    
		var userId = $("#userid").val();
		var roomId = ${classIdx };
		
		console.log("userId: " + userId);
		console.log("roomId: " + roomId);
		
		//채팅서버로 룸아이디, 유저아이디 전송
		setTimeout(function () {
			document.querySelector("#chat").contentWindow.postMessage(JSON.stringify({"roomId": roomId, "userId": userId}), "*");	
		}, 1000);
	</script>    
	
	<script src="${pageContext.request.contextPath }/resources/js/live/broadcaster.js"> </script>
	
</body>
</html>
