
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동정보 상세보기~!</title>
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
		<tr>
			<th>운동이름</th>
			<td>
				<input type="text" name="exerciseName"
					value="${exerciseInformation.exerciseName }">			
			</td>
		<tr>
			<th>운동부위</th>
			<td>
				<input type="text" name="exerciseParts"
					value="${exerciseInformation.exerciseParts }">
			</td>
		</tr>
		<tr>
			<th>운동사진</th>
			<td>
				<input type="text" name="exercisePictures"
					value="${exerciseInformation.exercisePictures }">
			</td>
		</tr>
		<tr>
			<th>운동비디오</th>
			<td>
				<input type="text" name="exerciseVideo"
					value="${exerciseInformation.exerciseVideo }">
			</td>
		</tr>
		<tr>
			<th>운동주의사항</th>
			<td>
				<input type="text" name="caution"
					value="${exerciseInformation.caution }">
			</td>
		</tr>
		<tr>
			<th>반복횟수</th>
			<td>
				<input type="text" name="repetition"
					value="${exerciseInformation.repetition }">
			</td>
		</tr>
		<tr>
			<th>세트반복횟수</th>		
			<td>
				<input type="text" name="setCount"
					value="${exerciseInformation.setCount }">
			</td>
		</tr>
		<tr>
			<th>휴식시간</th>
			<td>
				<input type="text" name="restTime"
					value="${exerciseInformation.restTime }">
			</td>
		</tr>
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