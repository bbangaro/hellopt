<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">

	<meta charset='utf-8'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	
	<title>
		<sitemesh:write property="title" />
	</title>
	
	<meta name='viewport' content='width=device-width, initial-scale=1'>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- decorator에 있어야 함 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/default.css">
	

	<!-- 오류 없는지 지켜보기 -->
	<%-- <script src="${pageContext.request.contextPath}/resources/js/main/common.js"></script> --%>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/main/jquery-ui.min.js"></script> --%>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/main/moment.min.js"></script> --%>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/main/placeholders.min.js"></script> --%>

	<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/content.css"> --%>
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/font-awesome.min.css"> --%>
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/font.css"> --%>
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/responsive.css"> --%>
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/xeicon.min.css"> --%>
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/style.css"> --%>

	
	

	<!-- <head></head> 태그 내용이 들어올 자리 -->
	<sitemesh:write property="head" />

</head>

<body>

	<!-- 상단 메뉴 고정 -->
	<div class="header">
		<c:import url="/WEB-INF/views/header.jsp" />
	</div>

	<!-- <body></body> 태그 내용이 들어올 자리 -->
	<div class="content">
		<sitemesh:write property="body" />
	</div>

	<!--  
	<div class="footer">
		<c:import url="/WEB-INF/views/footer.jsp" />
	</div>
	-->

</body>

</html>