<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동정보 게시판~!</title>

<style>
	
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
	<h1>운동정보 목록</h1>
	<h3>연문님 환영합니다~!!!</h3>

	<!-- 검색을 위한 폼 -->
	<form action="Exercise-InfoList" method="post">
	<table class="border-none">
		<tr>
			<td>
				<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap }">
					<option value="${option.value }">${option.key }</option>
				</c:forEach>
				</select>
				
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>

	<!-- 데이터 표시 -->
	<form>
	<table>
		<tr>
			<th width="80">운동번호</th>
			<th width="80">운동이름</th>
			<th width="80">운동부위</th>
			<th width="80">운동방법</th>
			<th width="80">운동사진</th>
			<th width="100">운동동영상</th>
			<th width="80">주의사항</th>
			<th width="100">세트당횟수</th>
			<th width="80">세트횟수</th>
			<th width="80">휴식시간</th>
		</tr>
		
		<c:forEach var="exerciseInformation" items="${exerciseInformationList }">
		<tr>
			<td class="center">${exerciseInformation.exerciseIdx }</td>
			<td>
				<a href="Exercise-Info?exerciseIdx=${exerciseInformation.exerciseIdx }">
					${exerciseInformation.exerciseName }
				</a>
			</td>
			<td>${exerciseInformation.exerciseParts }</td>
			<td>${exerciseInformation.howtoExercise }</td>
			<td>${exerciseInformation.exercisePicturesName }</td>
			<td>${exerciseInformation.exerciseVideo }</td>
			<td>${exerciseInformation.caution }</td>
			<td>${exerciseInformation.repetition }</td>
			<td>${exerciseInformation.setCount }</td>
			<td>${exerciseInformation.restTime }</td>
		</tr>
		</c:forEach>
	</table>
	</form>
	<p><a href="insertExerciseInformationform">운동정보글등록</a></p>
</div>


</body>
</html>