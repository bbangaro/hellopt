<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운동정보 리스트</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/exercise.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<div id="wrap">

	<!-- <div class="trainerbox_banner">
    <div class="${pageContext.request.contextPath}/resources/images/trainer/banner.png">  -->

	<div class="exercisebox_banner">
	<!-- 25행 resources/images내부에 사진 파일 작성하든지 처리할것! -->
	<div class="${pageContext.request.contextPath}/resources/images/exercise">
	
		<div class="bannertxtbox">
			<p class="bannertxt"><span class="bannertxt_big">헬로피티 운동정보</span><br>
	헬로피티에서 모두에게 제공하는 운동방법을 통해, 정확한 운동을 수행해보세요!<br>
	운동이름과 정보를 통해 운동지식을 쌓고, 멋지고 아름다운 몸을 가꿔보세요</p>
	
		</div>
	</div>
	</div>
	<div class="box">
	
		<div class="exercise_inner">
		<c:forEach var="exercise" items="${exerciseInfoList }">
			<div class="exercise">
				<a href="exerciseinfo?exerciseIdx${exercise.exerciseIdx }">
					<img src="${pageContext.request.contextPath}/resources/images/exercise/back.jpg" alt="운동사진" class="exerciseImg_img">
					<div class="exercise_caption">
						<p class="captiontitle">${exercise.exerciseName } </p>
						<pre class="captiontxt">${exercise.exerciseParts }</pre>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>

	<!-- 검색을 위한 폼 -->
	<div class="searchForm">
	<form action="exerciseinfolist" method="post">
		<div class="border-none">
		<p>
			<span>
				<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap }">
					<option value="${option.value }">${option.key }</option>
				</c:forEach>
				</select>
				
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</span>
		</p>
	</div>
	</form>
	</div>
	<!-- 데이터 표시 -->
    <!-- width color 등 설정해볼것~! -->
	<form>
    <div id="table">    
        <div class="row1">
            <p>
			<span class="cell col2">운동이름</span>
            <span class="cell col3">운동부위</span>
            <span class="cell col5">운동사진</span>
            </p>
        </div>
		
		<c:forEach var="exerciseInformation" items="${exerciseInformationList }">
            <div class="row2">
                <p>
			<span>
				<a href="exerciseinfo?exerciseIdx=${exerciseInformation.exerciseIdx }">
					${exerciseInformation.exerciseName }
				</a>
			</span>
			<span>${exerciseInformation.exerciseParts }</span>
			<span>${exerciseInformation.exercisePicturesName }</span>
                </p>
            </div>
		</c:forEach>
	</div>
    </form>
    </div>
	<p><a href="insertexerciseinformationform">운동정보글등록</a></p>
    </body>
</html>
