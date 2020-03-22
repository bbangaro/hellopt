<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main/admin.css">
<meta charset="UTF-8">
<title>유저 관리</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/meetingAdmin">모임신청 게시글 현황</a>
<h2>회원 정보 관리</h2>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>회원 등급</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${ userList }" varStatus="idx">
				<tr>
					<c:choose>
						<c:when test="${not empty param.page}">
							<td>${ idx.count + (param.page - 1) * 10}</td>
						</c:when>
						<c:otherwise>
							<td>${ idx.count }</td>
						</c:otherwise>
					</c:choose>
					
					<td>${ user.userId }</td>
					<td>${ user.userName }</td>
					<td>
						<c:choose>
							<c:when test="${ user.userRole eq 'ROLE_USER' }">유저</c:when>
							<c:when test="${ user.userRole eq 'ROLE_TRAINER' }">트레이너</c:when>
							<c:when test="${ user.userRole eq 'ROLE_ADMIN' }">관리자</c:when>
						</c:choose>
					</td>
					<td> <a class="management-anchor" href="${ pageContext.request.contextPath }/admin/user/${ user.userId }">관리</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:forEach begin="${param.page - (param.page % 10) + 1}" end="${lastPage}" varStatus="idx">
		<c:choose>
			<c:when test="${not empty param.search }">
				<a href="${ pageContext.request.contextPath }/admin/user?search=${param.search}&searchValue=${param.searchValue}&page=${idx.count}">${idx.count}</a>
			</c:when>
			<c:otherwise>
				<a href="${ pageContext.request.contextPath }/admin/user?page=${idx.count}">${idx.count}</a>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
	<form action="${pageContext.request.contextPath}/admin/user" method="get">
	<select name="search">
		<option value="id">아이디</option>
		<option value="name">이름</option> 
	</select>
	<input type="text" name="searchValue">
	<input type="submit" value="검색">
	</form>
	
</body>
</html>