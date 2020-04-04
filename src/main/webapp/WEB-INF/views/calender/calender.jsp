<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>		

<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/calender/calender.css">

</head>


<body>
		<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<input type="hidden" id="userName" value="${user.username} ">	
		</sec:authorize>
	

	<div class="hello_body">
	    <div class="center">
	    <!-- 달력이 생성될 위치 -->
		<div id="eventCalendar"></div>
	    </div>
	
	</div>
	

		
	    <script>
	    var userName = '${user.username}';
	    console.log("ㅜㅜ:" + userName);
	    </script>
	    
		<script src="${pageContext.request.contextPath}/resources/js/calender/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/calender/calender.js"></script>
</body>
