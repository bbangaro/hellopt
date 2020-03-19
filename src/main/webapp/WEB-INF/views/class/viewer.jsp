<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/live.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/style.css">
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

<script src="http://localhost:5000/socket.io/socket.io.js"></script>
<script>
	var userId = $("#userid").val();
	
	console.log("classIdx : " + ${classIdx });

	var roomId = ${classIdx };
	
	console.log("userId: " + userId);
	console.log("roomId: " + roomId);
	
	//채팅서버로 룸아이디, 유저아이디 전송
	setTimeout(function () {
		document.querySelector("#chat").contentWindow.postMessage(JSON.stringify({"roomId": roomId, "userId": userId}), "*");	
	}, 1000);
</script>  

<script src="${pageContext.request.contextPath }/resources/js/live/viewer.js"> </script>

</body>
</html>