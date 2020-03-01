<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/meeting.css">
	
	<!-- 슬라이드 관련 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<!-- Link Swiper's CSS -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	
	<!-- 카카오 map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=***&libraries=services,clusterer,drawing"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</head>


<body>

<div class="hello_top">

	<div class="hello_body center">
	
		<h2>Meeting</h2>
			<div class="boarder-oline">
			
				
				<p class="meeting-detail">${meetingOne.mSubject } </p>
				
				<!-- 여기는 작성자만 보인다 -->
				<div class="mUD">
				<a class="send-btn3" href="${pageContext.request.contextPath}/meetingUpdate?meetingIdx=${meetingOne.meetingIdx }" role="button">수정</a>
				<a class="send-btn3" href="${pageContext.request.contextPath}/meetingDelete?meetingIdx=${meetingOne.meetingIdx }" role="button">삭제</a>
				</div>
				
				<hr class="meeting-line">
				<!-- 내용물 넣기 -->
				
			<div class="meeting-one">
				
				<!-- 슬라이드 시작 -->
				<div class="slidebody">	
					<div class="swiper-container">
					    <div class="swiper-wrapper">
					      <div class="swiper-slide">
					        <div class="swiper-zoom-container">
					          <img src="${pageContext.request.contextPath}/resources/images/meeting/nature-1.jpg">
					        </div>
					      </div>
					      <div class="swiper-slide">
					        <div class="swiper-zoom-container">
					          <img src="${pageContext.request.contextPath}/resources/images/meeting/nature-2.jpg">
					        </div>
					      </div>
					      <div class="swiper-slide">
					        <div class="swiper-zoom-container">
					          <img src="${pageContext.request.contextPath}/resources/images/meeting/nature-3.jpg">
					        </div>
					      </div>
					    </div>
					    <!-- Add Pagination -->
					    <div class="swiper-pagination swiper-pagination-white"></div>
					    <!-- Add Navigation -->
					    <div class="swiper-button-prev"></div>
					  <div class="swiper-button-next"></div>
				    </div>
				</div> 
				<!-- 슬라이드 끝 -->
				
				<hr class="meeting-line">
				
					<p class="one-font"> ${meetingOne.mMemo } </p>				
					
					<hr class="meeting-line">
					
					<p class="one-font"> 
					${meetingOne.details }
					</p>		
							
					<hr class="meeting-line">
					
					<p class="one-font"> 
					${meetingOne.include }
					</p>
					
					<hr class="meeting-line">
					
					<p class="meeting-detail"> 만나는 장소 </p>
					
					<div id="map" style="width:300px;height:300px;"></div>
					<input type="hidden" id="mLocation" value="${meetingOne.mLocation }">
					<input type="hidden" id="search_name" disabled />
					<p class="one-font"> ${meetingOne.mLocationC }</p>

					<hr class="meeting-line">
					
					<p class="meeting-detail"> 개설자 정보 </p>
					<p class="meeting-profile"><img src="${pageContext.request.contextPath}/resources/images/meeting/profile.png"></p>
					<p class="one-font"> ${meetingOne.userName } </p>
					
					
					<p class="one-font"> 
					${meetingOne.mComment }
					</p>
				
				<!-- 내용물 넣기 -->				
				<hr class="meeting-line">
				
				<p class="meeting-detail"> 회원들이 많이 본 모임 </p>
				
				    <div class="m-profile">
				        <img class="profile-thumbnail" src="https://images.unsplash.com/photo-1484186139897-d5fc6b908812?ixlib=rb-0.3.5&s=9358d797b2e1370884aa51b0ab94f706&auto=format&fit=crop&w=200&q=80%20500w" class="thumbnail">
				        <h3 class="mname">Beverly Little</h3>
				        <p class="mtitle">Javascript Developer</p>
				    </div>
				
				
			</div> <!-- meeting-one의 끝 -->
			
				    
				<!-- 버튼 부분 -->
				<input type="submit" name="" value="목록으로" class="send-btn2">
				
			</div> <!-- border-line의 끝 -->
			
			<div class="right-side">
				
				<p class="meeting-calender"><img src="${pageContext.request.contextPath}/resources/images/meeting/calendar.png"></p>
				<p class="datepicker">${meetingOne.mDate }</p>
				<p class="area"> ${meetingOne.local } </p>	
				
				
				<input type="submit" name="" value="예약하기" class="send-btn2">
				
				<p class="m-condition"> 신청현황 : 2/16명 </p>	
				
			</div>	<!-- right-side의 끝 -->
				
	</div> <!-- hello_body의 끝 -->
</div> <!-- hello_top 의 끝 -->
				
	<!-- js에서 태그들을 찾고 있어서 여기다가 위치 시켜야 함 -->
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/meeting/meetingOne.js"></script>
	
</body>