<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<head>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/login.css">

</head>

<body>
	<div class="login">
	<h1>HelloPT!</h1>

	<form action="login" method="POST">
		<label for="userId">아이디</label> <input type="text" name="userId">
		<label for="userPw">비밀번호</label> <input type="text" name="userPw">
		<input type="submit" value="로그인" class="loginBtn">
	</form>
	</div>
</body>