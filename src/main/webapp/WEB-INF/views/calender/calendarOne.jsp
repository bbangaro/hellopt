<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	

<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/calender/calenderOne.css">

</head>


<body class="calBody">

	<div class="hello_body">

		<form action="" method="post">
			<div class="calHd">
				<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="user" />
				<div class="calName">작성자</div> <input type="text" class="calUser" id="" name="" value="${user.username}" readonly>
				</sec:authorize>
			</div>

			<div class="calHd2">
				<div class="calName">동영상</div>
				<video class="fileUpload" id="video" controls height="280"  src="${pageContext.request.contextPath}/s3/calendar/${oneCalendar.cSysVideo}" width="500" controls="controls"></video>
			</div>

			<div class="calHd3">
				<div class="calName">내용</div>
				<textarea cols="71" rows="10" class="calContent" id="mComment" name="mComment"	readonly>${oneCalendar.content}</textarea>
			</div>

			<input type="button" id="calInsert" class="calInsert "value="닫기">
		</form>



	</div>


</body>