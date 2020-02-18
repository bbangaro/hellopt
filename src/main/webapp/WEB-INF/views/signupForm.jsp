<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<form:form action="${pageContext.request.contextPath}/user"
		method="POST" modelAttribute="user" enctype="multipart/form-data">
		<table>
			<tr>
				<td><form:label path="userId">아이디</form:label></td>
				<td><form:input path="userId" /></td>
				<td><form:errors path="userId"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="userPw">비밀번호</form:label></td>
				<td><form:input path="userPw" /></td>
				<td><form:errors path="userPw"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="userName">이름</form:label></td>
				<td><form:input path="userName" /></td>
				<td><form:errors path="userName"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="userGender">성별</form:label></td>
				<td><form:radiobutton path="userGender" value="M" />남자 <br />
					<form:radiobutton path="userGender" value="F" />여자 </td>
			</tr>
			<tr>
				<td><form:label path="userAddress">주소</form:label></td>
				<td><form:input path="userAddress" /></td>
			</tr>
			<tr>
				<td><form:label path="userBirth">생년월일</form:label></td>
				<td><form:input type="date" path="userBirth" /></td>
			</tr>
			<tr>
				<td><form:label path="userJob">직업</form:label></td>
				<td><form:input path="userJob"/></td>
			</tr>
			<tr>
				<td><form:label path="userRoot">알게된 경로</form:label></td>
				<td>
					<select name="userRoot">
						<option value="friend">친구를 통해서</option>
						<option value="advertise">광고를 보고</option>
						<option value="search">검색으로</option>
					</select>
				</td>
			<tr>
			<tr>
				<td><form:label path="userHeight">키</form:label></td>
				<td><form:input path="userHeight"/></td>
			</tr>
			<tr>
				<td><form:label path="userWeight">몸무게</form:label>
				<td><form:input path="userWeight"/></td>
			</tr>
			<tr>
				<td><label for="file">프로필 사진</label></td>
				<td><input type="file" name="file"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>