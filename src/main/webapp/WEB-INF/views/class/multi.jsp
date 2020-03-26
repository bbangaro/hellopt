<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다대다</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/live.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/style.css">

<style>
	video {
		border: 1px solid white;
		width: 49.5%;
		height: 510px;
	}
	
	#class-name {
		padding: 20px;
		background: #fff;
		margin: 3px 0;
		width: 99.5%;
	}

	#class-name p {
		color: black;
	}
	
	.video-info {
		width: 90%;
		margin: auto;
	}
	button {
		color: white;
	}
</style>
<script src="${pageContext.request.contextPath }/resources/js/live/adapter-latest.js"></script>
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
			        		<video id="localVideo" autoplay ></video>
							<video id="remoteVideo1" class="remoteVideo" autoplay></video>
							<video id="remoteVideo2" class="remoteVideo" autoplay></video>
							<video id="remoteVideo3" class="remoteVideo" autoplay></video>
							<!-- <video id="remoteVideo4" class="remoteVideo" autoplay></video> -->
							
							<button id="startButton">Start</button>
							<button id="callButton">Call</button>
							<!-- <button id="hangupButton">Hangup</button> -->
			        	</div>
			        	<div id="class-name"><p>ㅇㅇㅇ 강의입니다.</p></div>
			        </div>
			    </section>
			</article>
		</div>
		<!-- // sub-content -->
	</div>
	<!-- // wrapper -->
	
	<!-- 로그인한 userId 얻어오기 -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<input type="hidden" value="${user.username }" id="userid">
	</sec:authorize>
	
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/live/multi.js"></script>
</body>
</html>