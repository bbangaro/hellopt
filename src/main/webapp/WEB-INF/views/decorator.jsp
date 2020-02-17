<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<meta name="description" content="HelloPT">
<meta property="og:title" content="HelloPT">

<title><sitemesh:write property="title" /></title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/main/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/jquery.menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main/mainslider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/placeholders.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/script.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/wrest.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/swiper.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/xeicon.min.css">

<sitemesh:write property="header" />

</head>

<body>

	<div class="container">
	
		<div class="header">
			<c:import url="/WEB-INF/views/header.jsp" />
		</div>
		
		<div class="content">
			<sitemesh:write property="body" />
		</div>
		
		<div class="footer">
			<c:import url="/WEB-INF/views/footer.jsp" />
		</div>
		
	</div>
	
</body>
</html>