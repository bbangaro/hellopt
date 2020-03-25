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
         <button type="button" role="togglebutton" class="nav_button"><span></span></button>
		<div class="userName">
				<span id="result">알람</span>
			<sec:authorize access="isAuthenticated()">
				<!--  사용가능한 필드는 com.bit.hellopt.vo.CustomUserDetail에 있는 멤버 변수, 메서드 -->
				<sec:authentication property="principal" var="user" />
				<span>${user.username}님 안녕하세요</span>
				</sec:authorize>
		</div>
  
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
                            <li><a href="${pageContext.request.contextPath}/exerciseinfo">Exercise Info</a></li>
                            <li><a href="${pageContext.request.contextPath}/exercisetipinfo">Exercise TipInfo</a></li>
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
                    <li><a href="${pageContext.request.contextPath}/review" class="artist_open">review</a></li>
                    <li><a href="${pageContext.request.contextPath}/faq1" class="artist_open">FAQ</a></li>
              
                    <sec:authorize access="!isAuthenticated()">
						<li><a href="${pageContext.request.contextPath}/login" class="artist_open">Login</a></li>
						<li><a href="${pageContext.request.contextPath}/user/registrationform" class="artist_open">Join</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<sec:authentication var="principal" property="principal" />
					<li>
						<a href="#" class="artist_open">My Page</a>
						<ul class="artist_depth02">
							<li>
								<a href="${pageContext.request.contextPath}/auth/${principal.username}" class="artist_open">My Profile</a>
							<li>
							<li>
								<a href="${pageContext.request.contextPath}/auth/mymeeting" class="artist_open">My Meeting</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/auth/myclass" class="artist_open">My Class</a>
							</li>
						</ul>
					</li>
						<li><a href="${pageContext.request.contextPath}/logout" class="artist_open">logout</a></li>
						<!--  사용가능한 필드는 com.bit.hellopt.vo.CustomUserDetail에 있는 멤버 변수, 메서드 -->
					  </sec:authorize>
			            <sec:authorize access="hasRole('ADMIN')">
			            <li><a href="${pageContext.request.contextPath}/admin/user" class="artist_open">Admin Page</a></li>
			           </sec:authorize>
          	</ul>
            </div>
            <div class="dim_bg"></div>
            </div>
        
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