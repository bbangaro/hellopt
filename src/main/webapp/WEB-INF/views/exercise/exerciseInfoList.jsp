<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운동정보 리스트</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/exercise.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<div id="wrap">
	<header id="">

	</header>
	<!-- <div class="trainerbox_banner">
    <div class="${pageContext.request.contextPath}/resources/images/trainer/banner.png">  -->

	<div class="exercisebox_banner">
	<!-- 25행 resources/images내부에 사진 파일 작성하든지 처리할것! -->
	<div class="${pageContext.request.contextPath}/resources/images/trainer/banner.png">
		<div class="bannertxtbox">
			<p class="bannertxt"><span class="bannertxt_big">헬로피티 운동정보</span><br>
	헬로피티에서 모두에게 제공하는 운동방법을 통해, 정확한 운동을 수행해보세요!<br>
	운동이름과 정보를 통해 운동지식을 쌓고, 멋지고 아름다운 몸을 가꿔보세요</p>

		</div>
	</div>
	</div>
	<div class="exercisebox">
	
		<div class="exercise_inner">
		<c:choose>
			<c:when test="${empty exerciseInformationList }">
				<div>
					<h2>현재 등록된 게시글이 없습니다.</h2>
				</div>
			</c:when>
			<c:otherwise>
		<c:forEach var="exerciseInformation" items="${exerciseInformationList }">
			<div class="exercise">
				<a href="exerciseinfo?exerciseIdx=${exerciseInformation.exerciseIdx }">
					<img src="${pageContext.request.contextPath}/resources/images/exercise/exerciseA.jpg" alt="운동사진" class="exerciseImg_img">
					<div class="exercise_caption">
						<p class="captiontitle">${exerciseInformation.exerciseName } ${exerciseInformation.exerciseEName }</p>
						<pre class="captiontxt">${exerciseInformation.exerciseParts }</pre>
					</div>
					
				</a>
			</div>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>

	<!-- 검색을 위한 폼 -->
	<div class="searchForm">
	<form action="exerciseinfolist" method="post">
		<div class="border-none">
		<p>
			<span>
				<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap }">
					<option value="${option.value }">${option.key }</option>
				</c:forEach>
				</select>
				
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</span>
		</p>
	</div>
	</form>
	</div>
    </div>
    <table>
		<tr>
			<td colspan="4">
				<ol class="paging">
					<c:choose>         
						<c:when test="${pvo.beginPage < pvo.pagePerBlock}">
							<li class="disable">이전으로</li>
						</c:when>
						<c:otherwise>
							<li><a
								href="exerciseinfolist?cPage=${pvo.beginPage - pvo.pagePerBlock}">이전으로</a></li>>
					  	</c:otherwise>
					</c:choose>

					<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage}" step="1">
						<c:if test="${k == pvo.nowPage}">
							<li class="now">${k}</li>
						</c:if>
						<c:if test="${k != pvo.nowPage}">
							<li><a href="exerciseinfolist?cPage=${k }">${k }</a></li>
						</c:if>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pvo.endPage >= pvo.totalPage}">
							<li class="disable">다음으로</li>
						</c:when>
						<c:otherwise>
							<li><a href="exerciseinfolist?cPage=${pvo.beginPage + pvo.pagePerBlock}">다음으로</a></li>
					  	</c:otherwise>
					</c:choose>
				</ol>
			</td>
	</table>
	<p class="center"><a href="insertexerciseinformationform">운동정보글등록</a></p>

    </div>
    </body>
</html>
