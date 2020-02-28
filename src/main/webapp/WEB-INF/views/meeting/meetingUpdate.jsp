<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	

<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/meeting.css">
	<script src="${pageContext.request.contextPath}/resources/js/meeting/meetingWrite.js"></script>
</head>


<body>

<div class="hello_top">

	<div class="hello_body center">
	
		<h2>Meeting</h2>
		
		<form  action="meetingUpdateOk" method="post">
			<div class="boarder-line">
				<h3 class="meeting-main">모임 개설 신청하기</h3>
				<hr class="meeting-line">
				<!-- 내용물 넣기 -->
					<div class="meeting-title">개 설 자
						<div class="meeting-content">
							<p class="meeting-profile"><img src="${pageContext.request.contextPath}/resources/images/meeting/profile.png"></p>
							<div class="profile-detail">
								
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal" var="user" />
								<input class="username" name="fkUserId" type="text" value="${user.username} " disabled>
							</sec:authorize>
								
								<input class="meeting-comment" name="mComment" value=${meetingOne.mComment }>
							</div>
							
							
							<div class="profile-detail">
								<select class="m-select" name="fkMCategoryNo">
							<c:forEach var="category" items="${categoryList}">
									<option value="${category.mCategoryNo }">${category.mCategory}</option>
							</c:forEach>
								</select>
							</div>
						</div>
							<div class="profile-detail">
								<select class="m-select" name="fkLocalNo">
								<c:forEach var="local" items="${localList}">
									<option value="${local.localNo }">${local.local }</option>
								</c:forEach>	
								</select>	
							</div>
							
							
							
					</div>
					
					<div class="meeting-title">모임일자
						<div class="meeting-content">
							<p class="meeting-calender"><img src="${pageContext.request.contextPath}/resources/images/meeting/calendar.png"></p>
							<input class="datepicker" name="mDate" type="text" value=${meetingOne.mDate}>						
						</div>
					</div>
					
					<div class="meeting-title">모임제목
						<div class="meeting-content">
							<input class="meeting-sub" name="mSubject" type="text" value=${meetingOne.mSubject }>						
						</div>
					</div>
					
					<div class="meeting-title">한줄소개
						<div class="meeting-content">
							<input class="meeting-sub" name="mMemo" type="text" value=${meetingOne.mMemo }>						
						</div>
					</div>
					
					<div class="meeting-title">상세정보
						<div class="meeting-content2">
							<input class="meeting-textarea" name="details"  value=${meetingOne.details }>
						</div>
					</div>
					
					<div class="meeting-title">포함사항
						<div class="meeting-content2">
							<input class="meeting-include" name="include" value=${meetingOne.include }>					
						</div>
					</div>
					
					<div class="meeting-title">모임위치
						<div class="meeting-content">
							<p class="meeting-profile"><img src="${pageContext.request.contextPath}/resources/images/meeting/map.png"></p>
							<div class="meeting-content2">
								<input class="meeting-mcomment" name="mLocation" value=${meetingOne.mLocation }>
								<input class="meeting-mcomment" name="mLocationC" value=${meetingOne.mLocationC }>
							</div>
						</div>
					</div>
					
					<div class="meeting-title">회　　비
						<div class="meeting-content">
							<input class="meeting-sub" name="mPrice" type="text" value=${meetingOne.mPrice }>						
						</div>
					</div>
					
					<input name="meetingIdx" type="hidden" value=${meetingOne.meetingIdx }>
				
				
				
				
					
				<!-- 내용물 넣기 -->				
				<hr class="meeting-line">
				 <input type="submit" name="" value="개설 신청하기" class="meeting-button">
				
				<a class="button" href="#" role="button">
				    <div class="icon">
				        <i class="fa fa-remove">
				        		 <img src="${pageContext.request.contextPath}/resources/images/meeting/meeting_write.png"/>
				        </i>
				    </div>
				</a>
			</div>	
	    </form>
			
	</div>
</div>
	
	<!-- js에서 태그들을 찾고 있어서 여기다가 위치 시켜야 함 -->
	
</body>