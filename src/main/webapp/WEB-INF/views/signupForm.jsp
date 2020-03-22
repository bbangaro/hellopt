<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main/login.css">
</head>
<body>
	<h2>회원가입</h2>
	<form:form action="${pageContext.request.contextPath}/user"
		method="POST" modelAttribute="user" enctype="multipart/form-data">
		<ul>
			<li>
				<form:label path="userId">아이디</form:label> 
				<form:input path="userId" placeholder="ID" />
				<label id="id-info"></label>
				<form:errors path="userId" cssClass="error"></form:errors>
				<input type="button" onclick="idCheck()" value="아이디 중복 확인">
				<label id="idCheckResult"></label></li>
			<li>
				<form:label path="userPw">비밀번호</form:label> 
				<form:input path="userPw" placeholder="PASSWORD"/> 
				<label id="pw-info"></label>
				<input type="text" id="userPwConfirm" placeholder="PASSWORD CONFIRM" >
				<label id="pw-cfm-info"></label>
				<form:errors path="userPw" cssClass="error"></form:errors>
			</li>
			<li>
				<form:label path="userName">이름</form:label> 
				<form:input path="userName" placeholder="NAME"/> 
				<form:errors path="userName" cssClass="error"></form:errors>
			</li>
			<li>
				<form:label path="userGender">성별</form:label> <br />
				<form:radiobutton path="userGender" value="M" />
				<span>남자</span><br /> 
				<form:radiobutton path="userGender" value="F" />
				<span>여자</span><br/>
			</li>
			<li>
				<form:label path="userAddress">주소</form:label> 
				<input type="button" onclick="getAddress()" value="우편번호 찾기">
				<form:input path="userAddress" id="roadAddr" placeholder="ADDRESS" />
			</li>
			<li>
				<form:label path="userBirth">생년월일</form:label> 
				<form:input type="date" path="userBirth" />
				<form:errors path="userBirth" cssClass="error"></form:errors>
			</li>
			<li>
				<form:label path="userJob">직업</form:label> 
				<form:input path="userJob" placeholder="JOB" />
			</li>
			<li>
				<form:label path="userRoot">알게된 경로</form:label> 
				<select name="userRoot">
					<option value="friend">친구를 통해서</option>
					<option value="advertise">광고를 보고</option>
					<option value="search">검색으로</option>
				</select>
			</li>
			<li>
				<form:label path="userHeight">키</form:label> 
				<form:input type="number" min="0" max="300" path="userHeight" placeholder="170" />
			</li>
			<li>
				<form:label path="userWeight">몸무게</form:label> 
				<form:input type="number" min="0" max="300" path="userWeight" placeholder="80" />
			</li>
			<li>
				<label for="file">프로필 사진</label> 
				<input type="file" name="file" onchange="loadPreviewImg(this, 'preview-profile')" />
				<img src="" id="preview-profile" alt="">
			</li>
		</ul>
		<input type="button" onclick="formCheck()" value="회원가입">
	</form:form>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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