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
<style>
.error {
	color: #ff0000;
	font-style: italic;
}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/center.css">
</head>
<body>
	<h2>회원가입</h2>
	<form:form action="${pageContext.request.contextPath}/user"
		method="POST" modelAttribute="user" enctype="multipart/form-data">
		<table>
			<tr>
				<td><form:label path="userId">아이디</form:label></td>
				<td><form:input path="userId" /></td>
				<td><form:errors path="userId" cssClass="error"></form:errors></td>
				<td><input type="button" onclick="idCheck()" value="아이디 중복 확인"></td>
				<td><label id="idCheckResult"></label></td>
			</tr>
			<tr>
				<td><form:label path="userPw">비밀번호</form:label></td>
				<td><form:input path="userPw" /></td>
				<td><form:errors path="userPw" cssClass="error"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="userName">이름</form:label></td>
				<td><form:input path="userName" /></td>
				<td><form:errors path="userName" cssClass="error"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="userGender">성별</form:label></td>
				<td><form:radiobutton path="userGender" value="M" />남자 <br />
					<form:radiobutton path="userGender" value="F" />여자</td>
			</tr>
			<tr>
				<td><form:label path="userAddress">주소</form:label></td>
				<td><input type="button" onclick="getAddress()" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<td><form:input path="userAddress" id="roadAddr" /></td>
			</tr>
			<tr>
				<td><form:label path="userBirth">생년월일</form:label></td>
				<td><form:input type="date" path="userBirth" /></td>
			</tr>
			<tr>
				<td><form:label path="userJob">직업</form:label></td>
				<td><form:input path="userJob" /></td>
			</tr>
			<tr>
				<td><form:label path="userRoot">알게된 경로</form:label></td>
				<td><select name="userRoot">
						<option value="friend">친구를 통해서</option>
						<option value="advertise">광고를 보고</option>
						<option value="search">검색으로</option>
				</select></td>
			<tr>
			<tr>
				<td><form:label path="userHeight">키</form:label></td>
				<td><form:input path="userHeight" /></td>
			</tr>
			<tr>
				<td><form:label path="userWeight">몸무게</form:label>
				<td><form:input path="userWeight" /></td>
			</tr>
			<tr>
				<td><label for="file">프로필 사진</label></td>
				<td><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td><input type="button" onclick="formCheck()" value="회원가입"></td>
			</tr>
		</table>
	</form:form>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function getAddress() {
			new daum.Postcode({
		        oncomplete: function(data) {
		     		let roadAddr = data.roadAddress;
		            document.getElementById('roadAddr').value = roadAddr;
		        }
		    }).open();
		}
</script>
<script src="${pageContext.request.contextPath}/resources/static/js/idcheck.js"></script>
</body>
</html>