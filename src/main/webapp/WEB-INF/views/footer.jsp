<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/chatbot.css">

<div class="navigation_inner footer">
	<!-- 
	<ul class="sns_list">
		<li><a class="sns_00" href="#" target="_blank">twitter</a></li>
		<li><a class="sns_01" href="#" target="_blank">facebook</a></li>
		<li><a class="sns_02" href="#" target="_blank">instagram</a></li>
		<li><a class="sns_03" href="#" target="_blank">youtube</a></li>
	</ul>
	 -->
	<p>Term</p>
	<p>Privacy policy</p>
	<p class="footer_info">BIT CAMP</p>
	<p class="copyright">ALL RIGHTS RESERVED. Â© 2019 HelloPT</p>
	<div id ="chatalk">
		<div id="chatinit_Close">
			<p class="ymtext">&nbsp;&nbsp;HelloPT Fitness&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/dumbell.jpg" width="25px;" height="25px;"></p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="chatinit" onclick="init()"><img src="${pageContext.request.contextPath}/resources/images/exercise/return.jpg" width="25px;" height="25px;" alt="처음으로"></span>
			<span id="chatalkClose">&nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/close.png" width="25px;" height="25px;"></span>
			</div>
		<div class="talkMain"></div>
	</div>
	<button id="chatalkIcon"><img src="${pageContext.request.contextPath}/resources/images/exercise/chatboticon.png" width="50px;" height="50px;"></button>
	
	<script src="${pageContext.request.contextPath}/resources/js/main/ws.js"></script>
</div>
<script type="text/javascript">

	//로컬저장소에 채팅 내용 저장, 내가 찾는 내용 기억하게 해줌
    var stg = localStorage.getItem('chatBot');
    
	//로컬저장소에 저장된 내용이 있을시, chatBot에 저장된 내용을 가져옴, 아닐경우 첫번째 내용을 가져옴
    if(stg != '' && stg != null ){
    	$(".talkMain").html(stg);
    } else { 
    	chatSeq(1,"first");
    } 
    
	$('#chatalkIcon').click( function() {
		$(this).css( "display", "none" );
		$('#chatalk').css( "display", "block" );
	});
	
	$('#chatalkClose').click(function(){
		$('#chatalk').css("display", "none");
		$('#chatalkIcon').css("display", "block");
	});
	
	function init(){
		$('.talkMain').children().remove();
		chatSeq(1,"first");
		
	}
	
	function chatSeq(seq, flag){
		//여기에 if절로 이것저것 넣을것 가령 예를 들어, idx값이 1번이면 뭐시기뭐시기 2번이면 저시기저시기하게 img를 넣어줘야함
		//url 링크 걸기 해볼것~!~!~!
 		if(flag != "first"){
			var vHtml = '<div class="asMain"><div class="cont">'+$('#astalk_'+seq).text()+'</div>';
			
			$('#astalk_'+seq).parent().parent().remove();
			$('.talkMain').append(vHtml);
		} 
		
		
		console.log(seq)
		$.ajax({
	         url: "chatbot.ajax?chatting_Idx="+seq,
	         type:"GET",
	         async: false ,
	         data: "",
	         dataType:'json',
	         timeout: 5000,
	         contentType : 'application/json; charset=UTF-8',
	         error: function (request, status, error) {      
	        	 alert("처리중오류발생");
	         }, success: function (data) {
	        	 
	        	 console.log(data)
	        	var data = data.ChatList;
	        	
	        	//메인 원래 나와야하는 내용! ㅇㅇ
	        	if(seq == 1) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+' &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/muscle.png" width="18px;" height="18px;"><br>궁금한 사항을 선택해주세요!</div></div>');
	        	}
	        	//강의 개설하려면 어떻게 해야하나욤? ㅇㅇ
	        	else if(seq == 2) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+' &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/class.png" width="18px;" height="18px;"><br>회원의 경우 로그인 한 후 클래스 항목에 들어가 원하시는 강의를 선택후, 강의 신청 버튼만 누르시면 됩니다. &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/happy.png" width="18px;" height="18px;"><br><a href="http://hellopt.info/classlist">http://hellopt.info/classlist</a></div></div>');
	        	} 
	        	//스트리밍 방송을 보려면 어떻게 해야하나요? ㅇㅇ
	        	else if(seq == 3) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+' &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/happy.png" width="18px;" height="18px;">&nbsp;&nbsp;<a href="http://hellopt.info/classlist">http://hellopt.info/classlist</a></div></div>');
	        	}
	        	//오프라인 모임은 어떻게 신청하는 건가요? ㅇㅇ
	        	else if(seq == 4) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+' &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/happy.png" width="18px;" height="18px;">&nbsp;&nbsp;<a href="http://hellopt.info/meeting">http://hellopt.info/meeting</a></div></div>');	
	        	}
	        	//영상을 안 올리면 어떻게되나요? ㅇㅇ
	        	else if(seq == 5) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+'</div></div>');
	        	}
	        	//나의 식단은 어떻게 확인하나요? 식단 url주소로 수정할것
	        	else if(seq == 6) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+' &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/calories.png" width="18px;" height="18px;"><br><a href="http://hellopt.info/meal">http://hellopt.info/meal</a></div></div>');
	        	}
	        	//헬로피티 내 트레이너들은 어떤 사람들인가요? 트레이너 url주소값 맞는지 확인할것
	        	else if(seq == 7) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+' &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/happy.png" width="18px;" height="18px;"><br><a href="http://hellopt.info/trainer">http://hellopt.info/trainer</a></div></div>');
	        	}
	        	//마스크 관련해서! mask url주소로 수정할것
	        	else if(seq == 8) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+' &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/mask.png" width="18px;" height="18px;"><br><a href="http://hellopt.info/mask">http://hellopt.info/mask</a></div></div>');
	        	}
	        	//아이디, 비밀번호를 잃어버렸을때 어떻게 하나요? 비밀번호 찾기 url으로 수정할것
	        	else if(seq == 9) {
	        		$('.talkMain').append('<div class="qtMain">	<div class="cont">'+data[0].CHATTING_CONTENT+' &nbsp;<img src="${pageContext.request.contextPath}/resources/images/exercise/key.png" width="18px;" height="18px;"><br><a href="http://hellopt.info/trainer">http://hellopt.info/trainer</a></div></div>');
	        	}
	        	
	        	if(data[0].NXT_IDX != '' && data[0].NXT_IDX != null){
	        		
	        		var asSeqList = data[0].NXT_IDX.split(',');
		        	var asContList = data[0].NXT_CONTENT.split(',');
		        	
		        	var tHtml = "<div>";
		        	for(var idx = 0; idx < asSeqList.length; idx++){
		        		tHtml += '<div class="asMain"><div class="cont" id="astalk_'+asSeqList[idx]+'" onClick="chatSeq('+asSeqList[idx]+')">'+asContList[idx]+'</div></div>'
		        	};
		        	tHtml += "</div>";
		        	$('.talkMain').append(tHtml);
		        	
	        	} 
	        	
	         }, beforeSend: function () {
	        	 
	         }
	     });
		 localStorage.setItem('chatBot',$(".talkMain").html());
	}

	
</script>
<!-- <div class="dim_bg"></div> -->