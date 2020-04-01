<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>챗봇맨</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/chatbot.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<div id="wrap">
	<header id="">
	
	</header>
		<div class="exercisebox_banner">
		<div class="${pageContext.request.contextPath}/resources/images/trainer/banner.png">
		<div class="bannertxtbox">
			<p class="bannertxt"><span class="bannertxt_big">이미지 버튼</span><br>
			<img src="images/exercise/exerciseA.jpg" alt="사진"></p>
			<div class="rrr">문의/상담은 여기!!</div>
		

		</div>
	</div>
	</div>
	<div class="container boostrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i>실시간 채팅창</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatlist" class="portlet-body chat-widget" style="overflow-y: auto; width:auto; height: 600px">
						</div>
						<div class="portlet-footer">
							<div class="row">
								<div class="form-group col-xs-4">
									<input style="height: 40px;" type="text" id="chatName" class="form-control" maxlength="8">
								</div>
							</div>
							<div class="row" style="height: 90px;">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent" class="form-control"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
									<div class="clearfix"></div>
								</div>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 챗 메인. 채팅봇 css 어떻게 꾸밀지 생각해볼것 -->
	<!-- 로그인한 userId 얻어오기 -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<input type="hidden" value="${user.username }" id="userid">
	</sec:authorize>
	
<script src="${pageContext.request.contextPath}/resources/js/chatbot/chatbot.js"></script>
<script type="text/javascript">
	
	</script>
</div>	
</body>
</html>