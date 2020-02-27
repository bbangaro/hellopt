<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동정보 상세보기~!</title>

<link rel="stylesheet" href="http://www.kozofficial.com/theme/basic/skin/board/tour/style.css?ver=171222">
<link rel="stylesheet" href="http://www.kozofficial.com/theme/basic/css/content.css?ver=171222">
<link rel="stylesheet" href="http://www.kozofficial.com/theme/basic/css/default.css?ver=171222">
<link rel="stylesheet" href="http://www.kozofficial.com/theme/basic/css/style.css">
<link rel="stylesheet" href="http://www.kozofficial.com/theme/basic/css/content.css">

<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

<div id="container">
	<p class="textbold">대한민국 No.1 그룹운동 플랫폼 <b>헬로피티</b></p>
	<p class="txt">Hello 운동정보~!</p>
	<p class="txt">헬로피티에서 제공하는 운동방법을 통해<b> 건강하고 아름다운 몸</b>을 가꾸세요</p>
	
	<br>
	<hr>
	
	<div class="top">
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
		<p>
			<a href="insertexerciseinformation">글등록</a>
			<a href="deleteexerciseinformation?exerciseIdx=${exerciseInformation.getExerciseIdx() }">글삭제</a>
			<a href="getexerciseinformationlist">글목록</a>
		</p>
	</div>
	</div>


</body>
</html>