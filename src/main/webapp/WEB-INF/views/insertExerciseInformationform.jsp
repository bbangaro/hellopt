<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동정보등록</title>
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
<c:if test="${not empty error }">
<h4 class=error>An error occurred :${error }</h4>
<br>
</c:if>

<div id="container">
	<h1>운동정보등록</h1>

	<hr>
	<form:form method="post" action="${pageContext.request.contextPath}/insertExerciseInformation"
			enctype="multipart/form-data">
	<table>
		<tr>
			<th>운동이름</th>
			<td>
				<input type="text" name="exerciseName" size="100">
			</td>
		</tr>
		<tr>
			<th>운동부위</th>
			<td>
				<input type="text" name="exerciseParts">
			</td>
		</tr>
		<tr>
			<th>운동방법</th>
			<td>
				<input type="text" name="howtoExercise">
			</td>
		</tr>
		<tr>
			<th>운동사진</th>
			<td>
				<input multiple="multiple" type="file" name="exercisePictures">
				<!-- name="file" -->
			</td>
		</tr>
		<tr>
			<th>운동동영상</th>
			<td>
				<input type="text" name="exerciseVideo">
			</td>
		</tr>
		<tr>
			<th>주의사항</th>
			<td>
				<input type="text" name="caution">
			</td>
		</tr>
		<tr>
			<th>세트당횟수</th>
			<td>
				<input type="text" name="repetition">
			</td>
		</tr>
		<tr>
			<th>세트횟수</th>
			<td>
				<input type="text" name="setCount">
			</td>
		</tr>
		<tr>
			<th>휴식시간</th>
			<td>
				<input type="text" name="restTime">
			</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="운동정보 등록">
			</td>			
		</tr>
	</table>		
	</form:form>
	<p><a href="exerciseinfolist">운동 정보 목록 가기</a></p>
</div>




</body>
</html>