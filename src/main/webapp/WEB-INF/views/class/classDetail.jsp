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
				<div class="con-inner sub-sub ani-adj">
					<div class="tit-wr tit-wr-ani">
						<h2>강의 상세정보</h2>
					</div>
					<div class="sub-content">

						<div class="content-area clearfix">
							<!-- 썸네일 -->
							<div class="live_img_area">
								<iframe width="560" height="315"
									src="https://www.youtube.com/embed/azxahQi6vFo" frameborder="0"
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
							<!--//썸네일-->
						</div>

						<div class="basic-table">
							<table>
								<colgroup>
									<col width="22.5%;">
									<col width="*">
								</colgroup>

								<tr>
									<th>수업 이름</th>
									<td>${classDetail.className }</td>
								</tr>
								<tr>
									<th>수업 유형</th>
									<td>${classDetail.classType }</td>
								</tr>
								<tr>
									<th>수업 기간</th>
									<td>${classDetail.classLength }</td>
								</tr>
								<tr>
									<th>수업 시작일</th>
									<td>${classDetail.classStartDate }</td>
								</tr>
								<tr>
									<th>수업 요일</th>
									<td>${classDetail.classDay }</td>
								</tr>
								<tr>
									<th>수업 시간</th>
									<td>${classDetail.classTime }</td>
								</tr>
								<tr>
									<th>수업 인원</th>
									<td>${classDetail.totalMembers }</td>
								</tr>
								<tr>
									<th>가격</th>
									<td>${classDetail.price }</td>
								</tr>
							</table>
						</div>

						<div class="basic-caption">
							<p>※ 강의 신청과 관련한 주의사항을 적어봅시다.</p>
							<p>※ =================================</p>
							<p>※ ==================</p>
						</div>

						<button class="detail-btn"
							onclick="location.href='regclass?fkClassIdx=${classDetail.classIdx}'">강의신청</button>
						<button style="float: right" class="detail-btn"
							onclick="location.href='deleteclass?classIdx=${classDetail.classIdx }'">강의삭제</button>
					</div>
					<!--sub-content-->

					<!--top버튼-->
					<a href="#" class="top-btn"> <i class="xi-angle-up-thin"></i>
						<div>top</div>
					</a>

				</div>
				<!--con-inner-->
			</div>
			<!--con-wr-->
		</div>
		<!-- live -->
	</div>
	<!-- } 하단 끝 -->
</body>
</html>