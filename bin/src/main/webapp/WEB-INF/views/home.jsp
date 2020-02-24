<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
</head>
<body>
	<h1>HelloPT!</h1>
	<c:choose>
		<c:when test="${empty isUser}">
			<a href="${pageContext.request.contextPath}/signupform">회원가입</a>
			<div>
				<form action="login" method="POST">
					<label for="userId">아이디</label> <input type="text" name="userId">
					<label for="userPw">비밀번호</label> <input type="text" name="userPw">
					<input type="submit" value="로그인">
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<p>환영합니다. ${isUser} 님!</p>
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
</body>
</html>