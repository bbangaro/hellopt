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
	<form:form action="user" method="POST" modelAttribute="user">
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
				<td><form:label path="name">이름</form:label></td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="email">이메일</form:label></td>
				<td><form:input path="email"/></td>
				<td><form:errors path="email"></form:errors>
			<tr>
				<td><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>