<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스트리밍 강의 리스트</title>
<style>
	ul { list-style: none; }
	li { 
		float: left;
		margin: 10px;
		}
</style>
</head>
<body>
	<h2>스트리밍 강의 리스트</h2>
	
	<ul>
		<c:forEach var="liveClass" items="${liveClassList }">
			<li>
				<button>방송시작</button>
				<img src="${pageContext.request.contextPath}/resources/images/LiveThumbnail.png" alt="스트리밍 강의 썸네일" width="200px" height="300px">
				<a href="classdetail?classIdx=${liveClass.classIdx }">${liveClass.className }</a>
			</li>
		</c:forEach>
	</ul>
</body>
</html>