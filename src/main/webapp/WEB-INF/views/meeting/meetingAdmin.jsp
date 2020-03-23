<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	

<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/meeting.css">
	<script src="${pageContext.request.contextPath}/resources/js/meeting/meeting.js"></script>
</head>


<body>


<div class="hello_top">
	<div class="hello_body center">
		<div class="boarder-line">
				
			<div class="mAdminCenter">
					
				<c:forEach var="mAdmin" items="${meetingList}">
				<div>
					<span class="mAdmin">${mAdmin.mSubject}</span> 
				</div>
				<div class="mAdminBtn">
					<a class="mBtn" href="#">승낙</a> <a class="mBtn" href="#">거절</a></span>
				</div>
				</c:forEach>
				
			</div>
			
			
		</div>
	</div>
</div>
	
	
</body>