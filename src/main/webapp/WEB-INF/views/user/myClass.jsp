<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Class</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class/classlist.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class/content.css">
</head>
<body>
	<!-- 콘텐츠 시작 { -->
	<div id="wrapper">
		<div class="con-wr">
			<div class="con-inner sub-sub">
				<div class="tit-wr tit-wr-ani">
					<h2>내 스트리밍 강의 리스트</h2>
				</div>

				<div class="sub-content">
					<!--콘탠츠 내용 시작. 내용 불러오기-->
					<!--content-area-->

					<!-- 게시판 목록 시작 , 썸네일 이미지 -->
					<div id="bo_gall" style="width: 100%">
						<div class="thum-tit-wr">
							<h3 class="thum-tit">All CLASS</h3>
						</div>

						<ul id="gall_ul" class="gall_row">
							<c:forEach var="liveClass" items="${liveClassList }">
								<li class="gall_li col-gn-3">
									<div class="gall_box">
										<div class="thum_hover">
											<div>${liveClass.className } ${liveClass.classTime } ${liveClass.liveStatus }</div>
										</div>
										<div class="gall_con">
											<div class="gall_img">
												<img src="${pageContext.request.contextPath }/resources/images/class/thumbnail.jpg">
											</div>
										</div>
										<sec:authorize access="isAuthenticated()">
											<sec:authentication property="principal" var="user" />
											<c:if test="${liveClass.fkUserId == user.username }">
												<button onclick="location.href='${pageContext.request.contextPath}/broadcaster?classIdx=${liveClass.classIdx }'" style="color: white; float:left;">방송시작</button>
											</c:if>	
										</sec:authorize>
										<a href="${pageContext.request.contextPath}/classdetail?classIdx=${liveClass.classIdx }" style="color: white; float:right;">${liveClass.className }</a>
									</div>
									<c:forEach var="member" items="${classMember }">
										<c:if test="${member.fkClassIdx eq liveClass.classIdx }">
											<button onclick="location.href='${pageContext.request.contextPath}/viewer?classIdx=${liveClass.classIdx }'" style="color:white;">방송보기</button>
										</c:if>
									</c:forEach>
								</li>
							</c:forEach>
						</ul>

						<!--더보기 버튼-->
						<button type="button" class="view-more">
							view more <i class="xi-plus-thin"></i>
						</button>
					</div>
				</div>
				<!--con-inner-->
			</div>
			<!--con-wr-->
		</div>
		<!-- } 게시판 목록 끝 -->
	</div>
	<!-- } 하단 끝 -->
</body>
</html>