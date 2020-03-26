<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
	<script src="${pageContext.request.contextPath}/resources/js/main/jquery.menu.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
</head>


<body>
	<!-- 상단 시작 { -->
    <header id="hd" class="ease" style="z-index: 9999;">
        <h1>
            <a href="${pageContext.request.contextPath}/main"><span class="text_split">HelloPT Training</span></a>
        </h1>
		<div class="userName">
				<span id="result">알람</span>
			<sec:authorize access="isAuthenticated()">
				<!--  사용가능한 필드는 com.bit.hellopt.vo.CustomUserDetail에 있는 멤버 변수, 메서드 -->
				<sec:authentication property="principal" var="user" />
				<span>${user.username}님 안녕하세요</span>
				</sec:authorize>
		</div>
        <button type="button" role="togglebutton" class="nav_button"><span></span></button>
    </header>
    <!-- 상단 끝 } -->
    <script>
	    $("#hd").each(function(){
	    	var header = $(this);
	    	var headerOffset = header.offset().top;
	     
	    	$(window).scroll(function(){
	    		var wScroll = $(window).scrollTop();
	    		if( wScroll > headerOffset){
	    		  header.css('background','rgba(0,0,0,0.7)');
	    		} else {
	    			header.css('background','none');
	    		}
	    	});
	    });
	</script>
    <!-- 네비게이션 시작 { -->
    <aside id="navigation" class="close">
        <div class="navigation_inner">
            <div class="nav_wrap">
                <ul class="category">
                  
                    <li><a href="#" class="artist_open">Trainer</a>
                    	<ul class="artist_depth02">
                            <li><a href="${pageContext.request.contextPath}/trainer">Trainer Info</a></li>
                            <li><a href="${pageContext.request.contextPath}/audition">Apply for Trainer</a></li>
                       </ul>
                    </li>
                    <li><a href="#" class="artist_open">Workout&Nutrition</a>
                    	 <ul class="artist_depth02">
                            <li><a href="${pageContext.request.contextPath}/exerciseinfolist">Exercise Info</a></li>
                            <li><a href="${pageContext.request.contextPath}/exerciseinfotiplist">Exercise TipInfo</a></li>
                       	    <li><a href="${pageContext.request.contextPath}/meal">Nutrition</a></li>
                       </ul>
                    </li>
                    <li><a href="#" class="artist_open">Training</a>
                        <ul class="artist_depth02">
                            <li><a href="classlist">streaming</a></li>
                            <li><a href="#">1:1</a></li>
                            <li><a href="#">1:4</a></li>
                            <li><a href="${pageContext.request.contextPath}/meeting">Offline Meeting</a></li>
                            <li><a href="${pageContext.request.contextPath}/calender">event</a></li>
                        </ul>
                    </li>
                    <li class="artist_open"><a href="${pageContext.request.contextPath}/review">review</a></li>
                    <li class="artist_open"><a href="${pageContext.request.contextPath}/faq1">FAQ</a></li>
                </ul>
                <ul class="user_case">
                    <sec:authorize access="!isAuthenticated()">
						<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a href="${pageContext.request.contextPath}/logout">logout</a></li>
						<!--  사용가능한 필드는 com.bit.hellopt.vo.CustomUserDetail에 있는 멤버 변수, 메서드 -->
						<sec:authentication property="principal" var="user" />
						<span>안녕하세요. ${user.username}</span>
					  </sec:authorize>
                  
			            <li><a href="${pageContext.request.contextPath}/user/registrationform">Join</a></li>
			            <sec:authorize access="hasRole('ADMIN')">
			            <li><a href="${pageContext.request.contextPath}/admin/user">Admin Page</a></li>
			            </sec:authorize>

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