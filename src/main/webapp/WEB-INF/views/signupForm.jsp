<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div>
		<form action="user" method="POST">
			<label for="userId">아이디</label> <input type="text" name="userId">
			<label for="userPw">비밀번호</label> <input type="text" name="userPw">
			<label for="userName">이름</label> <input type="text" name="name">
			<input type="submit" value="회원가입">
		</form>
	</div>
</body>
</html>