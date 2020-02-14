<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스트리밍 강의 개설</title>
</head>
<body>
	<h2>스트리밍 강의 개설</h2>
	<form action="openclass" method="post">
		<table>
			<tr>
				<td>수업 이름</td>
				<td><input type="text" name="className"></td>
			</tr>
			<tr>
				<td>수업 유형</td>
				<td><input type="text" name="classType"></td>
			</tr>
			<tr>
				<td>수업 기간</td>
				<td><input type="text" name="classLength"></td>
			</tr>
			<!-- 
			<tr>
				<td>수업 시작일</td>
				<td><input type="text" name="classStartDate"></td>
			</tr>
			 -->
			<tr>
				<td>수업 요일</td>
				<td><input type="text" name="classDay"></td>
			</tr>
			<tr>
				<td>수업 시간</td>
				<td><input type="text" name="classTime"></td>
			</tr>
			<tr>
				<td>수업 인원</td>
				<td><input type="text" name="totalMembers"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="강의 개설">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>