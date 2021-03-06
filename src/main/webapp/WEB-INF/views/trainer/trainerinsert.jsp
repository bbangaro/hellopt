<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/content.css">
<title>트레이너 정보 입력</title>

</head>

<body>
<!-- 콘텐츠 시작  -->
<div id="wrapper">
	<div class="con-wr contact">
		<div class="con-inner sub-sub">
		    <div class="tit-wr tit-wr-ani">
		      <h2>트레이너 정보 입력</h2>
		    </div>
		
			<div class="sub-content">
			  <div class="basic-table">
			    <form class="open" action="inserttrainer" method="post">
			        <ul>
			          <li>
			            <label for="className" class="sound_only">트레이너 이름</label>
			            <input type="text" name="trainerName" id="className" required value="" placeholder="트레이너이름">
			            <input type="text" name="fkUserId" hidden="" value="${param.userId}">
			          </li>
			          <li>
			            <label for="tel" class="sound_only">닉네임</label>
			            <input type="text" name="trainerNickname" id="classType" required value="" placeholder="닉네임">
			          </li>
			          <li>
			            <label for="classLength" class="sound_only">경력</label>
			            <input type="text" name="trainerCareer" id="classLength" required value="" placeholder="경력">
			          </li>
			          <li>
			            <label for="classDay" class="sound_only">한마디</label>
			            <input type="text" name="trainerTalk" id="classDay" required value="" placeholder="한마디">
			          </li>
			          <li>
			            <label for="classTime" class="sound_only">영상</label>
			            <input type="text" name="trainerMedia" id="classTime" required value="" placeholder="영상">
			          </li>
			        </ul>
			        <input type="submit" name="" value="Send" class="send-btn">
			    </form>
			  </div>
		 	</div>
		</div><!-- //con-inner-->
	</div><!-- //con-wr-->
</div>
<!-- 하단 끝 -->
</body>
</html>
