<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운동정보 상세보기~!</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/exercise.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div id="wrap">

		<div class="exercisebox">
			<div class="bannertxtbox">
				<p class="bannertxt"><span class="bannertxt_big">대한민국 No.1 그룹운동 플랫폼 헬로피티</span><br>
			헬로피티에서 제공하는 운동방법을 통해 건강하고 아름다운 몸을 가꾸세요.</p>
				</div>
			</div>
			</div>

		<div class="exercisebox">
		
			<div class="exercise_inner">
				<div class="exerciseImg">
					<img src="${pageContext.request.contextPath}/resources/images/exercise/exerciseA.jpg" alt="운동부위사진" class="exerciseImg_img">
				</div>
				<div class="exercise">
			
			<h1 align="center">운동정보 상세</h1>
			<img src="imgs/연무니.jpg" alt="인체사진">
			<hr>
			<form action="updateExerciseInformation" method="post">
			<input type="hidden" name="exerciseIdx" value="${exerciseInformation.exerciseIdx }">
			<div>
				<p>
        	<!-- <img src="resources/images/연문.jpg"> -->
        		<input type="text" name="exerciseName"
        			value="${exerciseInformation.exerciseName }">
        	</p>
        	<div class="youtubebox">
        		<!-- script 뭐시기 확인해 볼것~!!! -->
        		<iframe src="https://movie2.koreahosting.kr/traffic-unlimited-2/player/testdemo/player.php?file=376782349&autoplay=1&loop=0">
        		</iframe>
        		<p>
        		<!-- 나중에 동영상들도 다 내 컴퓨터에 저장해서 불러오는 형식으로 변경할것! --> 동영상 넣는곳~!
        		</p>
        	</div>
        	</div>
        	<hr>
        	<br>
        		<h2>상세설명</h2>
        	<br>
        	<hr>
	            <input type="file" name="exercisePicturesName"
	                value="${exerciseInformation.exercisePicturesName }">
	        
	        <div align="right">
	            <img src="images/신체가슴.jpg" width="250" height="250">
            </div>
            	<h2>${exerciseInformation.exerciseName }</h2>
            <h3>상세 설명</h3>
                <input type="text" name="exerciseParts"
                    value="${exerciseInformation.exerciseParts }">
            
                <img src="images/가슴.jpg" width="250" height="250">
                <input type="file" name="exercisePicturesName"
                    value="${exerciseInformation.exercisePicturesName }">
                <img src="images/딥스.jpg" width="250" height="250">
                <input type="file" name="exercisePicturesName"
                    value="${exerciseInformation.exercisePicturesName }">
                <img src="images/딥스2.jpg" width="250" height="250">
                <input type="file" name="exercisePicturesName"
                    value="${exerciseInformation.exercisePicturesName }">
                <input type="text" name="howtoExercise"
                    value="${exerciseInformation.howtoExercise }">
                <input type="text" name="caution"
                    value="${exerciseInformation.caution }">
                <input type="text" name="exerciseVideo"
                    value="${exerciseInformation.exerciseVideo }">
                <input type="text" name="repetition"
                    value="${exerciseInformation.repetition }">
                <input type="text" name="setCount"
                    value="${exerciseInformation.setCount }">
                <input type="text" name="restTime"
                    value="${exerciseInformation.restTime }">
			</form>
				</div>
			</div>
		</div>
</body>
</html>