<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/meeting.css">
	<script src="${pageContext.request.contextPath}/resources/js/meeting/meeting.js"></script>
</head>


<body>

<div class="hello_top">

	<div class="hello_body center">
	
		<h2>나에게 꼭 맞는 모임을 찾아 참여하세요</h2>
		
			<div class="boarder-line">
			
				<div class="meeting-category">
					<p class="meeting-main">함께 하는 즐거움과 시너지를 통해 운동하는</p>
					<p class="meeting-main">오프라인 모임!</p>
	
					<div class="search-container">
						<input type="text" placeholder="Search...">
						<div class="meeting-search"></div>
					</div>
	
					<!-- 안이뻐서 보류
					<img class="category-img" src="${pageContext.request.contextPath}/resources/images/meeting/mountain.png">
					<img class="category-img" src="${pageContext.request.contextPath}/resources/images/meeting/sea.jpg">
					<img class="category-img" src="${pageContext.request.contextPath}/resources/images/meeting/tracking.jpg">
					<img class="category-img" src="${pageContext.request.contextPath}/resources/images/meeting/indoor.jpg">
					<img class="category-img" src="https://i.imgur.com/SkFZNy4.jpg">
					 -->
				</div>
	
				
			<div class="container">
			
			<c:forEach var="meeting" items="${meetingList}">
			  <div class="service-details">
			    <img src="${pageContext.request.contextPath}/resources/images/meeting/sample3.jpg" alt="realm">
			    <div class="service-hover-text">
			      <h3>${meeting.mSubject}</h3>
			      <h4 class="mlocal">${meeting.fkLocalNo }</h4>
			      <p>30일 남음 </p>
			    </div>
			    <div class="service-white service-text">
			      <a class="mcategory">${meeting.mCategory}</a><a class="mpro">${meeting.progressSt}</a>
			      <div class="minner">
			      <p class="msub"><a href="${pageContext.request.contextPath}/meetingOne?meetingIdx=${meeting.meetingIdx }">${meeting.mSubject}</a></p>
			      <a class="mcategory">${meeting.local }</a><a class="mprice">회비 ${meeting.mPrice }원</a>
			      </div>
			    </div>
			  </div>
			  
			  <br>
			</c:forEach>
			  
			</div>
	
			 <input type="submit" name="" value="모임 개설하기" class="send-btn">
	
	<%--  버튼 디자인 변경
	    	<a class="button" href="#" role="button">
			    <span class="meeting-button">모임 개설하기</span>
			    <div class="icon">
			        <i class="fa fa-remove">
			        		 <img src="${pageContext.request.contextPath}/resources/images/meeting/meeting_write.png"/>
			        </i>
			    </div>
			</a>
	 --%>    
		</div>
	    
	</div>
</div>
	
	<!-- js에서 태그들을 찾고 있어서 여기다가 위치 시켜야 함 -->
	
</body>