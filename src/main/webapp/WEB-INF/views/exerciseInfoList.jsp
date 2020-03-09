<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동정보 게시판~!</title>
	<script src="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/exerciseInfoList.css"></script>

</head>
<body>

<div id="wrap">
	<h1>운동정보 목록</h1>
	<h3>${isUser}님 환영합니다~!!!</h3>

	<!-- 검색을 위한 폼 -->
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

	<!-- 데이터 표시 -->
    <!-- width color 등 설정해볼것~! -->
	<form>
    <div id="table">    
        <div class="row1">
            <p>
            <span class="cell col1">운동번호</span>
			<span class="cell col2">운동이름</span>
            <span class="cell col3">운동부위</span>
            <span class="cell col4">운동방법</span>
            <span class="cell col5">운동사진</span>
            <span class="cell col6">운동동영상</span>
            <span class="cell col7">주의사항</span>
            <span class="cell col8">세트당횟수</span>
            <span class="cell col9">세트횟수</span>
            <span class="cell col10">휴식시간</span>
            </p>
        </div>
		
		<c:forEach var="exerciseInformation" items="${exerciseInformationList }">
            <div class="row2">
                <p>
			<span class="center">${exerciseInformation.exerciseIdx }</span>
			<span>
				<a href="exerciseinfo?exerciseIdx=${exerciseInformation.exerciseIdx }">
					${exerciseInformation.exerciseName }
				</a>
			</span>
			<span>${exerciseInformation.exerciseParts }</span>
			<span>${exerciseInformation.howtoExercise }</span>
			<span>${exerciseInformation.exercisePicturesName }</span>
			<span>${exerciseInformation.exerciseVideo }</span>
			<span>${exerciseInformation.caution }</span>
			<span>${exerciseInformation.repetition }</span>
			<span>${exerciseInformation.setCount }</span>
			<span>${exerciseInformation.restTime }</span>
                </p>
            </div>
		</c:forEach>
	</div>
    </form>
    </div>
	<p><a href="insertExerciseInformationform">운동정보글등록</a></p>
    </body>
</html>
