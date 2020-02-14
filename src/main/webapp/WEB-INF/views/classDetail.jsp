<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 상세정보</title>
</head>
<body>
		<table>
			<tr>
				<td>수업 이름</td>
				<td>${classDetail.className }</td>
			</tr>
			<tr>
				<td>수업 유형</td>
				<td>${classDetail.classType }</td>
			</tr>
			<tr>
				<td>수업 기간</td>
				<td>${classDetail.classLength }</td>
			</tr>
			<tr>
				<td>수업 시작일</td>
				<td>${classDetail.classStartDate }</td>
			</tr>
			<tr>
				<td>수업 요일</td>
				<td>${classDetail.classDay }</td>
			</tr>
			<tr>
				<td>수업 시간</td>
				<td>${classDetail.classTime }</td>
			</tr>
			<tr>
				<td>수업 인원</td>
				<td>${classDetail.totalMembers }</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${classDetail.price }</td>
			</tr>
			<tr>
				<td>			
					<input type="button" value="강의정보수정">
				</td>
				<td>			
					<input type="button" value="강의삭제" onclick="location.href='deleteclass?classIdx=${classDetail.classIdx }'">
				</td>
			</tr>
		</table>
</body>
</html>