<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스트리밍 강의 리스트</title>
<meta charset="utf-8">
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
					<h2>스트리밍 강의 리스트</h2>
				</div>

				<div class="sub-content">
 				<button onclick="location.href='multi'" style="color:white;">다대다 스트리밍 테스트</button>
					<!--콘탠츠 내용 시작. 내용 불러오기-->
					<div class="content-area clearfix">
						<div class="sub-tit-wr">
							<h3 id="subject_">RECOMMENDED</h3>
						</div>
						<div class="videowrapper">
							<p id="view_img">
								<iframe width="560" height="315"
									src="https://www.youtube.com/embed/azxahQi6vFo" frameborder="0"
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</p>
						</div>
					</div>
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
										<a href="classdetail?classIdx=${liveClass.classIdx }">
											<div class="thum_hover">
												<div style="color: #ef0000;">${liveClass.className }<br>${liveClass.classTime }<br>${liveClass.liveStatus }</div>
											</div>
										</a>	
										<div class="gall_con">
											<div class="gall_img">
												<img src="${pageContext.request.contextPath }/resources/images/class/thumbnail.jpg">
											</div>
										</div>
										<sec:authorize access="isAuthenticated()">
											<sec:authentication property="principal" var="user" />
											<c:if test="${liveClass.fkUserId == user.username }">
												<button onclick="location.href='broadcaster?classIdx=${liveClass.classIdx }'" style="color: white; float:left;">방송시작</button>
											</c:if>	
										</sec:authorize>
									</div>
									<c:forEach var="member" items="${classMember }">
										<c:if test="${member.fkClassIdx eq liveClass.classIdx }">
											<button onclick="location.href='viewer?classIdx=${liveClass.classIdx }'" style="color:white;">방송보기</button>
										</c:if>
									</c:forEach>
								</li>
							</c:forEach>
						</ul>
						
						<!-- 페이징
						- form 태그 안에 있어야..??
						 -->
						<input type="hidden" name="page" value="1">
						
						<!--더보기 버튼-->
						<button type="button" class="view-more" onclick="moreClass()">
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
<!-- 	<div id="listDisp">
		<ul>
			<li>데이터 가져와서 출력하기</li>
		</ul>
	</div> -->
	<script>
		function moreClass() {
			$.ajax("moreClass", {
				type : "get", 
				dataType : "json",
				success : function(data) {
					alert("성공~~");
					console.log(data);
					//응답받은 데이터 형식 : [{}, {}, ... , {}]
					var strData = JSON.stringify(data); //JSON -> String
					console.log("-" + strData + "-");
					
					var jsData = JSON.parse(strData); //String -> JavaScript 객체화
					console.log("-" + jsData + "-"); 
					
					
					var dispHtml = "";
					
					dispHtml = "<ul>";
					$.each(data, function(index, obj) {
						dispHtml += "<li>";
						
						dispHtml += this["classIdx"] + ", ";					
				
						dispHtml += "</li>";
					});
					dispHtml += "</ul>";
					$("#listDisp").html(dispHtml);
					
					page();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"
							+ "jqXHR.readyState : " + jqXHR.readyState + "\n" 
							+ "textStatus : " + textStatus 
							+ "errorThrown : " + errorThrown);
				}
			});
		}
		
		function page() {
			var page = eval($("input[name=page]").val() + " + 1");
			$.ajax({
				type : "GET",
				url : "moreClass",
				data : "page=" + page,
				cache : false,
				success : function(data) {
					$("#listDisp").append(data);
					$("input[name=page]").val(page);
				},
				error : function() {
					alert("실패!");
				}
			})
		}
		
	</script>
	
	
	
</body>
</html>