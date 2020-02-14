<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<sitemesh:write property="head" />
</head>
<body>
	<div class="container">
		<div class="header">
			<c:import url="/WEB-INF/views/top.jsp" />
		</div>
		<div class="content">
			<sitemesh:write property="body" />
		</div>
		<div class="footer">
			<c:import url="/WEB-INF/views/bottom.jsp" />
		</div>
		
	</div>
</body>
</html>