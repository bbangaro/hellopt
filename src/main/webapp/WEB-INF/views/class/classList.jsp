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

<style>

</style>
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
							<h3 class="thum-tit">All CLASSES
							<select id="classType" style="float: right;">
								<option value="전체">전체</option>
								<option value="일대다">일대다</option>
								<option value="다대다">다대다</option>
							</select>
							</h3>
						</div>

						<ul id="gall_ul" class="gall_row">
							<c:forEach var="liveclass" items="${liveClassList }">
								<li class="gall_li col-gn-3">
									<div class="gall_box">
										<a href="classdetail?classIdx=${liveclass.classIdx }">
											<div class="thum_hover">
												<div style="color: #ef0000;">${liveclass.className }<br>${liveclass.classTime }<br>${liveclass.liveStatus }</div>
											</div>
										</a>
										<div class="gall_con">
											<div class="gall_img">
												<img src="${pageContext.request.contextPath }/resources/images/class/thumbnail.jpg">
											</div>
										</div>
										<c:choose>
										<c:when test="${liveclass.classType eq '일대다' }">
											<sec:authorize access="isAuthenticated()">
												<sec:authentication property="principal" var="user" />
												<c:if test="${liveclass.fkUserId eq user.username }">
													<button class="broadcast" onclick="location.href='broadcaster?classIdx=${liveclass.classIdx }'" style="float:left;">START</button>
												</c:if>	
											</sec:authorize>
											<c:forEach var="member" items="${classMember }">
												<c:if test="${member.fkClassIdx eq liveclass.classIdx }">
													<button class="broadcast" onclick="location.href='viewer?classIdx=${liveclass.classIdx }'" style="float:right;">VIEW</button>
												</c:if>
											</c:forEach>
										</c:when>	
										<c:otherwise>
											<sec:authorize access="isAuthenticated()">
											<sec:authentication property="principal" var="user" />
											<c:if test="${liveclass.fkUserId eq user.username }">
												<button class="broadcast" onclick="location.href='multi?classIdx=${liveclass.classIdx }'" style="float:left;">MULTI</button>
											</c:if>
											<c:forEach var="member" items="${classMember }">
												<c:if test="${member.fkClassIdx eq liveclass.classIdx}">
													<button class="broadcast" onclick="location.href='multi?classIdx=${liveclass.classIdx }'" style="float:right;">MULTI</button>
												</c:if>
											</c:forEach>
											</sec:authorize>	
										</c:otherwise>
										</c:choose>
									</div>
								</li>
							</c:forEach>
						</ul>
						
						<!-- 더보기 클릭시 end값 계산 위해 사용 -->
						<input type="hidden" id="p" name="curPage" value="1">
						
						<!--더보기 버튼-->
<!-- 						<button type="button" class="view-more">
							view more <i class="xi-plus-thin"></i>
						</button> -->
					</div>
				</div>
				<!--con-inner-->
			</div>
			<!--con-wr-->
		</div>
		<!-- } 게시판 목록 끝 -->
	</div>
	<!-- } 하단 끝 -->
	
<script>
	$(document).ready(function(){
		$("#classType").change(function() {
			location.href="classlist?classType="+$("#classType").val();
		});
		$("select option[value='${classType}']").attr("selected", true);
		console.log("${classType}");
		
	});

	//더보기 ajax
	var curPage = $("input[name=curPage]").val();
	console.log("curPage : " + curPage);
		$(".view-more").click(function() {
			 curPage++;
			 $.ajax({
				type : "GET", 
				url : "moreclass?end=" + curPage * 3,
				dataType : "json",
				success : function(data) {
					alert("성공");
					var dispHtml = "";
					var classIdx = "";
					var className = "";
					var classTime = "";
					var liveStatus = "";
					 $.each(data, function(index, obj) {
						classIdx = this["classIdx"];
						className = this["className"];
						classTime = this["classTime"];
						liveStatus = this["liveStatus"];
						
						dispHtml += '<li class="gall_li col-gn-3">';
						dispHtml += '<div class="gall_box">';
						dispHtml += '<a href="classdetail?classIdx=' + classIdx + '">';
						dispHtml += '<div class="thum_hover">';
						dispHtml += '<div style="color: #ef0000;">' + className + '<br>' + classTime + '<br>' + liveStatus + '</div>'
						dispHtml += '</div>';
						dispHtml += '</a>';
						dispHtml += '<div class="gall_con">';
						dispHtml += '<div class="gall_img">';
						dispHtml += '<img src="${pageContext.request.contextPath }/resources/images/class/thumbnail.jpg">'
						dispHtml += '</div>';
						dispHtml += '</div>'
						dispHtml += '</div>'
						dispHtml += '</div>'
						dispHtml += '</li>';
					});
					
					$("#gall_ul").html(dispHtml);  
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"
							+ "jqXHR.readyState : " + jqXHR.readyState + "\n" 
							+ "textStatus : " + textStatus + "\n"
							+ "errorThrown : " + errorThrown);
				}
			}); 
		});
</script>
</body>
</html>