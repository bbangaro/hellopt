<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main/login.css">
<meta charset="UTF-8">
<title>유저 관리</title>
</head>
<body>
<h2>회원 정보 관리</h2>
	<form:form action="${pageContext.request.contextPath}/#" method="POST"
		modelAttribute="user" enctype="multipart/form-data">
		<ul>
			<li><form:label path="userId">아이디</form:label> <form:input
					path="userId" disabled="true" /></li>
			<li><form:label path="userName">이름</form:label> <form:input
					path="userName" placeholder="NAME" /> <form:errors path="userName"
					cssClass="error"></form:errors></li>
			<li><form:label path="userGender">성별</form:label> <br /> <form:radiobutton
					path="userGender" value="M" /><span>남자</span><br /> <form:radiobutton
					path="userGender" value="F" /><span>여자</span><br /></li>
			<li><form:label path="userAddress">주소</form:label> <input
				type="button" onclick="getAddress()" value="우편번호 찾기"> <form:input
					path="userAddress" id="roadAddr" placeholder="ADDRESS" /></li>
			<li><form:label path="userBirth">생년월일</form:label> <form:input type="date"
					path="userBirth" value="${ user.userBirth }"/></li>
			<li><form:label path="userJob">직업</form:label> <form:input
					path="userJob" placeholder="JOB" /></li>
			<li>
			<form:label path="userRole">회원 등급</form:label>
			<select
				name="userRole">
					<c:choose>
						<c:when test="${user.userRole eq 'ROLE_USER' }">
							<option value="ROLE_USER" selected="selected">일반 회원</option>
						</c:when>
						<c:otherwise>
							<option value="ROLE_USER">일반 회원</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${user.userRoot eq 'ROLE_TRAINER' }">
							<option value="ROLE_TRAINER" selected="selected">트레이너</option>
						</c:when>
						<c:otherwise>
							<option value="ROLE_TRAINER">트레이너</option>
						</c:otherwise>
					</c:choose>
			</select>
			</li>
			<li><form:label path="userRoot">알게된 경로</form:label> <select
				name="userRoot">
					<c:choose>
						<c:when test="${user.userRoot eq 'friend' }">
							<option value="friend" selected="selected">친구를 통해서</option>
						</c:when>
						<c:otherwise>
							<option value="friend">친구를 통해서</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${user.userRoot eq 'advertise' }">
							<option value="advertise" selected="selected">광고를 보고</option>
						</c:when>
						<c:otherwise>
							<option value="advertise">광고를 보고</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${user.userRoot eq 'search' }">
							<option value="search" selected="selected">검색으로</option>
						</c:when>
						<c:otherwise>
							<option value="search">검색으로</option>
						</c:otherwise>
					</c:choose>
			</select></li>
			<li><form:label path="userHeight">키</form:label> <form:input
					path="userHeight" placeholder="170" /></li>
			<li><form:label path="userWeight">몸무게</form:label> <form:input
					path="userWeight" placeholder="80" /></li>
			<li><label for="file">프로필 사진</label> 
				<input type="file"
				name="file" /></li>

		</ul>
		<input type="button" onclick="formCheck()" value="회원 정보 수정">
		<input type="button" onclick="" value="회원 삭제">
	</form:form>
</body>
</html>