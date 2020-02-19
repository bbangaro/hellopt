<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	<script src="${pageContext.request.contextPath}/resources/js/main/jquery.menu.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/main.css">
</head>

<body>
    <!-- 상단 시작 { -->
    <header id="hd" class="ease" style="z-index: 1000;">
        <h1>
            <a href="#"><span class="text_split">HelloPT Training</span></a>
        </h1>
        <button type="button" role="togglebutton" class="nav_button"><span></span></button>
    </header>
    <!-- 상단 끝 } -->

    <!-- 네비게이션 시작 { -->
    <aside id="navigation" class="close">
        <div class="navigation_inner">
            <div class="nav_wrap">
                <ul class="category">
                    <li><a href="#">Trainer introduce</a></li>
                    <li><a href="#">How to Workout</a></li>
                    <li><a href="#" class="artist_open">Home training</a>
                        <ul class="artist_depth02">
                            <li><a href="#">1:1</a></li>
                            <li><a href="#">1:4</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Meeting</a></li>
                    <li><a href="#">review</a></li>
                </ul>
                <ul class="user_case">
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/registrationform">Join</a></li>
                </ul>           
            </div>
        </div>
        <div class="dim_bg"></div>
    </aside>
    <!-- 네비게이션 끝 } -->

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "#";
        var g5_bbs_url = "#";
        var g5_is_member = "";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "";
        var g5_sca = "";
        var g5_editor = "";
        var g5_cookie_domain = "";
    </script>
</body>