<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챗봇맨</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/chatbot.css">
</head>
<body>
	<!-- 챗 메인. 채팅봇 css 어떻게 꾸밀지 생각해볼것 -->
	<div class="chatMain">
		<button>연문버튼</button>
	</div>
	<!-- 로그인한 userId 얻어오기 -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<input type="hidden" value="${user.username }" id="userid">
	</sec:authorize>

<script src="${pageContext.request.contextPath}/resources/js/chatbot/chatbot.js"></script>

<script type="text/javascript">

	//안녕하십니까? 그룹운동 No.1 플랫폼 헬로피티입니다.
	document.addEventListener("DOMContentLoaded", function(){
		chat(1)
	});
	
	function chat(chatting_Idx) {
		var param = 'chatting_Idx='+chatting_Idx
		_ajaxGET(
				//'/jsm/jsm10110/jsm10110List.do'
				'chatbot/ChatbotVO'
				,param
				,function success(data){
					//실행되면 처음 우리 헬로피티 인삿말 출력
					vData = data.ChatbotVOList[0];
					//퀘스쳔 앤스워
					$('.chatMain').append('<div class="qt"><div class="cont">'+vData.CONT+'</div></div>');
					
					$('.chatMain .as').each( function() {
						$(this).prop('onclick','');
					});
					
					if( vData.NXT_IDX != null){
						var nxtIdx = vData.NXT_IDX.split(',');
						var nxtContent = vData.NXT_CONTENT.split(',');
							
						for(var idx = 0; idx < nxtIdx.length; idx++){
							$('.chatMain').append('<div class="as" onclick="chat('+nxtIdx[idx]+')"><div class="cont">'+nxtContent[idx]+'</div></div>');
						}
					}
					
				});
	}
	
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>