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
	<h1>운동정보 상세</h1>
	<hr>
	<form action="updateExerciseInformation" method="post">
		<input type="hidden" name="exerciseIdx" value="${exerciseInformation.exerciseIdx }">
	<table>
		<thead>
        	<tr>
            <!-- <img src="resources/images/서정.jpg"> -->
	            <input type="file" name="exercisePicturesName"
	                value="${exerciseInformation.exercisePicturesName }">
	            <div align="right">
	            <img src="images/신체가슴.jpg" width="250" height="250">
            </div>
            
        </tr>
		
			<tr><h2>${exerciseInformation.exerciseName }</h2></tr>
            <h3>상세 설명</h3>
		</thead>
		<tbody>
                <input type="text" name="exerciseParts"
                    value="${exerciseInformation.exerciseParts }">
            <tr>
                <img src="images/가슴.jpg" width="250" height="250">
                <input type="file" name="exercisePicturesName"
                    value="${exerciseInformation.exercisePicturesName }">
            </tr>
            <tr>
                <img src="images/딥스.jpg" width="250" height="250">
                <input type="file" name="exercisePicturesName"
                    value="${exerciseInformation.exercisePicturesName }">
            </tr>
            <tr>
                <img src="images/딥스2.jpg" width="250" height="250">
                <input type="file" name="exercisePicturesName"
                    value="${exerciseInformation.exercisePicturesName }">
            </tr>
            <tr>
                <input type="text" name="howtoExercise"
                    value="${exerciseInformation.howtoExercise }">
            </tr>
            <tr>
                <input type="text" name="caution"
                    value="${exerciseInformation.caution }">
            </tr>
            <tr>
                <input type="text" name="exerciseVideo"
                    value="${exerciseInformation.exerciseVideo }">
            </tr>
            <tr>
                <input type="text" name="repetition"
                    value="${exerciseInformation.repetition }">
            </tr>
            <tr>
                <input type="text" name="setCount"
                    value="${exerciseInformation.setCount }">
            </tr>
            <tr>
                <input type="text" name="restTime"
                    value="${exerciseInformation.restTime }">
            </tr>
		</tbody>
		<tfoot>
		
		</tfoot>
	</table>
	</form>
	<p>
		<a href="insertExerciseInformation">글등록</a>
		<a href="deleteExerciseInformation?exerciseIdx=${exerciseInformation.getExerciseIdx() }">글삭제</a>
		<a href="getExerciseInformationList">글목록</a>
	</p>
</div>

</body>
</html>