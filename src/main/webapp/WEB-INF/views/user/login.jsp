<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main/login.css">
<title>HelloPT</title>
</head>
<body>
	<h2>Login</h2>
	<c:if test="${param.error}">
			<p class="error">아이디 / 비밀번호가 일치하지 않습니다.</p>
	</c:if>
	<form name='f' action="login" method='POST'>
		<ul>
			<li>
				<input type='text' name='username' value='' placeholder='ID' required />
			</li>
			<li>
				<input type='password' name='password' placeholder='PASSWORD' required/>
			</li>
		</ul>
		<input name="submit" type="submit" value="로그인" />
		<span>Remember Me</span><input type="checkbox" name="remember-me" />
	</form>
</body>
</html>