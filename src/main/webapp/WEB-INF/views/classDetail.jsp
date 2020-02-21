<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 상세정보</title>
<meta charset="utf-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class/classdetail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class/content.css">

</head>
<body>
	<!-- 콘텐츠 시작 { -->
	<div id="wrapper">
		<div id="live">
			<div class="con-wr">
				<div class="con-inner sub-sub">

					<div class="tit-wr tit-wr-ani">
						<h2>강의상세정보</h2>
					</div>

					<div class="sub-content">
						<!-- 썸네일 -->
						<div class="live_img_area">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/azxahQi6vFo" frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
						<!--//썸네일-->

						<!-- 게시판 목록 시작 { -->
						<div id="bo_list" style="width: 100%">

							<div class="tbl_head01 tbl_wrap">
								<ul class="live_list">
									<li>
										<div class="date">수업 이름</div>
										<div class="title">
											<h3>${classDetail.className }</h3>
										</div>
									</li>
									<li>
										<div class="date">수업 유형</div>
										<div class="title">
											<h3>${classDetail.classType }</h3>
										</div>
									</li>
									<li>
										<div class="date">수업 기간</div>
										<div class="title">
											<h3>${classDetail.classType }</h3>
										</div>
									</li>
									<li>
										<div class="date">수업 시작일</div>
										<div class="title">
											<h3>${classDetail.classStartDate }</h3>
										</div>
									</li>
									<li>
										<div class="date">수업 요일</div>
										<div class="title">
											<h3>${classDetail.classDay }</h3>
										</div>
									</li>
									<li>
										<div class="date">수업 시간</div>
										<div class="title">
											<h3>${classDetail.classTime }</h3>
										</div>
									</li>
									<li>
										<div class="date">수업 인원</div>
										<div class="title">
											<h3>${classDetail.totalMembers }</h3>
										</div>
									</li>
									<li>
										<div class="date">가격</div>
										<div class="title">
											<h3>${classDetail.price }</h3>
										</div>
									</li>
									<li>
										<button style="color:white">강의정보수정</button> 
										<button style="color:white" onclick="location.href='deleteclass?classIdx=${classDetail.classIdx }'">강의삭제</button>
									</li>
								</ul>
							</div>
						</div>
						<!--bo_list-->
						<!--게시판 끝-->
					</div>
					<!--con-inner-->
				</div>
			</div>
		</div>
		<!-- } 게시판 목록 끝 -->
	</div>
	<!-- } 하단 끝 -->
</body>
</html>