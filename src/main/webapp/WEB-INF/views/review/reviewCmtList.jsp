<%@page import="com.bit.hellopt.service.reviewboard.RBoardServiceImpl"%>
<%@page import="com.bit.hellopt.service.reviewboard.RBoardService"%>
<%@page import="org.apache.ibatis.annotations.Mapper"%>
<%@page import="com.bit.hellopt.vo.reviewboard.RBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%-- <link rel ="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/reviewBoard.css"> --%>
<meta charset="UTF-8">
<title>후기게시판</title>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>
</head>
<body>
<table>
		<c:forEach var="row" items="${list }">
		<tr>
			<td class="listReply">
			${row.userName}(<fmt:formatDate value="${row.revCmtRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>)
			<br>
			${row.revCmtComment }
			</td>	
		</tr>
		</c:forEach>
</table>
<%@ include file="/WEB-INF/include/include-body.jsp" %>	
</body>
</html>