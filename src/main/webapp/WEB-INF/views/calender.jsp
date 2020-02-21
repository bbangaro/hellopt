<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	<script src="${pageContext.request.contextPath}/resources/js/calender/calender.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/calender/calender.css">
	
</head>


<body>

	<div class="hello_body">
	    <div class="cal_top">
	        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
	        <span id="cal_top_year"></span>
	        <span id="cal_top_month"></span>
	        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
	    </div>
	    <div id="cal_tab" class="cal">
	    </div>
	</div>

</body>