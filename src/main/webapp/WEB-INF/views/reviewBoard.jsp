<%@page import="com.bit.hellopt.service.reviewboard.RBoardServiceImpl"%>
<%@page import="com.bit.hellopt.service.reviewboard.RBoardService"%>
<%@page import="org.apache.ibatis.annotations.Mapper"%>
<%@page import="com.bit.hellopt.vo.reviewboard.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판</title>
</head>
<body>

<div>
<form>
	<p><a href="${pageContext.request.contextPath}/insertform">후기쓰러가기</a></p>
<c:forEach var="rBoard" items="${rBoardList }"> 
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
			<td>별점 : ${rBoard.revStar }</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">내용 :${rBoard.revContent}</td>
		</tr>
		<tr>
			<td colspan="2">첨부사진:${rBoard.revFile}</td>
		</tr>
		<tr>
			<td colspan="2">날짜 :${rBoard.revRegdate }</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2"><a href="">트레이너${trainer.name } <img src=""></a></td>
		</tr>
	</tfoot>
</table>
</c:forEach>
</form>
	
	
</div>	

</body>
</html>