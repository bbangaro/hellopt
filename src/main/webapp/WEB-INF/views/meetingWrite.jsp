<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/meeting.css">
	<script src="${pageContext.request.contextPath}/resources/js/meeting/meetingWrite.js"></script>
</head>


<body>

<div class="hello_top">

	<div class="hello_body center">
	
		<h2>Meeting</h2>
		
			<div class="border-line">
				
				<h3 class="meeting-main">모임 개설 신청하기</h3>
				<hr class="meeting-line">
				<!-- 내용물 넣기 -->
				
					<div class="meeting-title">개설자
						<div class="meeting-content">
							<p class="meeting-profile"><img src="${pageContext.request.contextPath}/resources/images/meeting/profile.png"></p>
							<div class="profile-detail">
								<input class="username" type="text" value="밀가루">
								<textarea class="meeting-comment" rows="2" cols="50" placeholder="숨쉬기 운동 마스터 입니다. 함께 하실분 : )"></textarea>
							</div>
						</div>
					</div>
					
					<div class="meeting-title">모임일자
						<div class="meeting-content">
							<p class="meeting-calender"><img src="${pageContext.request.contextPath}/resources/images/meeting/calendar.png"></p>
							<input class="datepicker" type="text" placeholder="2020/04/03">						
						</div>
					</div>
					
					<div class="meeting-title">모임제목
						<div class="meeting-content">
							<input class="meeting-sub" type="text" placeholder="제목">						
						</div>
					</div>
					
					<div class="meeting-title">한줄소개
						<div class="meeting-content">
							<input class="meeting-sub" type="text" placeholder="8시간 소요, 자차 이동, 최대 8명">						
						</div>
					</div>
					
					<div class="meeting-title">상세정보
						<div class="meeting-content2">
							<textarea class="meeting-textarea" rows="12" cols="100" placeholder="모임소개  &#13;&#10; 1. 최소인원 : &#13;&#10; 2. 출발시간 : &#13;&#10; 3. 도착시간 : &#13;&#10; 4. 점       심 : &#13;&#10; 5. 준  비  물 : "></textarea>
						</div>
					</div>
					
					<div class="meeting-title">포함사항
						<div class="meeting-content2">
							<textarea class="meeting-include" rows="2" cols="50" placeholder="점심식사, 간식"></textarea>						
						</div>
					</div>
					
					<div class="meeting-title">모임위치
						<div class="meeting-content">
							<p class="meeting-profile"><img src="${pageContext.request.contextPath}/resources/images/meeting/map.png"></p>
							<div class="meeting-map">
								<textarea class="meeting-comment" rows="2" cols="50" placeholder="AK백화점 정문쪽 입니다"></textarea>
							</div>
						</div>
					</div>
					
					<div class="meeting-title">회비
						<div class="meeting-content">
							<input class="money" type="text" placeholder="30,000원">						
						</div>
					</div>
				
				
				
				
					
				<!-- 내용물 넣기 -->				
				<hr class="meeting-line">
				
				<a class="button" href="#" role="button">
				    <span class="meeting-button">개설 신청하기</span>
				    <div class="icon">
				        <i class="fa fa-remove">
				        		 <img src="${pageContext.request.contextPath}/resources/images/meeting/meeting_write.png"/>
				        </i>
				    </div>
				</a>
	    
			</div>
	    
	</div>
</div>
	
	<!-- js에서 태그들을 찾고 있어서 여기다가 위치 시켜야 함 -->
	
</body>