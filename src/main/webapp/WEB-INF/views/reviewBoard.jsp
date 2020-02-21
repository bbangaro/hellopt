<%@page import="com.bit.hellopt.service.reviewboard.RBoardServiceImpl"%>
<%@page import="com.bit.hellopt.service.reviewboard.RBoardService"%>
<%@page import="org.apache.ibatis.annotations.Mapper"%>
<%@page import="com.bit.hellopt.vo.reviewboard.RBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>

<style>
	td .star{
		  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 20px;
		  height: 20px;
		  display: inline-block;
		  text-indent: -9999px;
		  cursor: pointer;
		}
	td .star.on{background-position:0 0;}
</style>
</head>
<body>

<div>
<form>
	<p><a href="${pageContext.request.contextPath}/insertform">후기쓰러가기</a></p>	
<c:forEach var="rBoard" items="${rBoardList }" varStatus="status"> 
<table border>
	<thead>
		<tr>
			<td rowspan="3"><img class="profile" src="">사진</td>
			<td>글쓴이 : ${rBoard.user }</td>
		</tr>
		<tr>
			<td>수업이름</td>
		</tr>
		<tr>
		
		<td class="starRev"> 
<%-- 	if문 써서	<c:forEach var="i" begin="1" end="5" step="1" >
				<c:if test="${i  > rBoard.revStar }">
					<span class="star"></span>
				</c:if>	
				<c:if test="${i  <= rBoard.revStar }">
					<span class="star on"></span>
				</c:if>	
			</c:forEach> --%>
			<c:forEach var="i" begin="1" end="${rBoard.revStar }" step="1">
				<span class="star on">i</span>
			</c:forEach> 
			<c:forEach var="i" begin="1" end="${5-(rBoard.revStar) }" step="1">
				<span class="star">i</span>
			</c:forEach>   
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">
			<p>내용 :${rBoard.revContent}</p>
			
			 첨부사진:<img src="<c:url value='/resources/revimage/${rBoard.revFileSname} }'/>"> 
			 
			</td>
		</tr>
		<tr>
			<td colspan="2">날짜 :<fmt:formatDate value="${rBoard.revRegdate }" type="date"/></td>
		</tr>
	</tbody>
	<c:forEach var="trainer" items="${trainerList }">
	<tfoot>
		<tr>
			<td colspan="2"><a href="">트레이너${trainer.name } <img src=""></a></td>
		</tr>
	</tfoot>
	</c:forEach>
</table>
</c:forEach>
</form>
</div>	

</body>
</html>