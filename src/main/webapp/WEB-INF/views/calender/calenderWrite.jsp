<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	

<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/calender/calenderWrite.css">

</head>


<body class="calBody">

	<div class="hello_body">

		<form action="calWriteOk" method="post">
			<div class="calHd">
				<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="user" />
				<div class="calName">작성자</div> <input type="text" class="calUser" id="" name="" value="${user.username}" readonly>
				</sec:authorize>
			</div>

			<div class="calHd2">
				<div class="calName">동영상</div> <input type="file" class="fileUpload" id="uploadFile" name="uploadFile">
			</div>

			<div class="calHd3">
				<div class="calName">내용</div>
				<textarea cols="72" rows="10" class="calContent" id="mComment" name="mComment"	placeholder="내용을 입력해주세요. "></textarea>
			</div>

			<input type="button" class="calInsert "value="등록">
		</form>



		<script
			src="${pageContext.request.contextPath}/resources/js/calender/calenderWrite.js"></script>

	</div>


</body>