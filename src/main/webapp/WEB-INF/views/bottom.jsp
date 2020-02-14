<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<meta name="description" content="HelloPT">
<meta property="og:title" content="HelloPT">

<title>Home</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/swiper.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/xeicon.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/responsive.css">

<script>
// ìë°ì¤í¬ë¦½í¸ìì ì¬ì©íë ì ì­ë³ì ì ì¸
var g5_url       = "#";
var g5_bbs_url   = "#";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/jquery.menu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/wrest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/placeholders.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/main/script.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/font-awesome.min.css">

</head>
<body>


<!-- ìë¨ ìì { -->
<header id="hd" class="ease" style="z-index: 1000;">
  <h1>
    <a href="#"><span class="text_split">Main</span></a>
  </h1>
  <button type="button" role="togglebutton" class="nav_button"><span></span></button>
</header>
<!-- ìë¨ ë } -->

<!-- ë¤ë¹ê²ì´ì ìì { -->
<aside id="navigation" class="close">
  <div class="navigation_inner">
    <div class="nav_wrap">
      <ul class="category">
        <li><a href="#">ë©ë´1</a></li>
        <li><a href="#">ë©ë´2</a></li>
        <li><a href="#" class="artist_open">ë©ë´3</a>
			<ul class="artist_depth02">
				<li><a href="#">ë©ë´3-1</a></li>
				<li><a href="#">ë©ë´3-2</a></li>
			</ul>
		</li>
        <li><a href="#">ë©ë´4</a></li>
        <li><a href="#">ë©ë´5</a></li>
      </ul>
      <ul class="user_case">
                    <li><a href="#">login</a></li>
            <li><a href="#">join</a></li>
              </ul>
      <ul class="sns_list">
        <li><a class="sns_00" href="#" target="_blank">twitter</a></li>
        <li><a class="sns_01" href="#" target="_blank">facebook</a></li>
        <li><a class="sns_02" href="#" target="_blank">instagram</a></li>
        <li><a class="sns_03" href="#" target="_blank">youtube</a></li>
        <!-- <li><a class="sns_04" href="#">v-app</a></li>
        <li><a class="sns_05" href="#">weibo</a></li> -->
      </ul>
      <ul class="footer_list">
        <li><a href="#">Term</a></li>
        <li><strong><a href="#">Privacy policy</a></strong></li>
      </ul>
      <p class="footer_info">BIT CAMP</p>
      <p class="copyright">ALL RIGHTS RESERVED. Â© 2019 HelloPT</p>
    </div>
  </div>
  <div class="dim_bg"></div>
</aside>
<!-- ë¤ë¹ê²ì´ì ë } -->
    
<!-- íìë ì´ì´ ìì { -->
<div id="hd_pop">
    <h2>íìë ì´ì´ ìë¦¼</h2>

<span class="sound_only">íìë ì´ì´ ìë¦¼ì´ ììµëë¤.</span></div>

<script>
$(function() {
    $(".hd_pops_reject").click(function() {
        var id = $(this).attr('class').split(' ');
        var ck_name = id[1];
        var exp_time = parseInt(id[2]);
        $("#"+id[1]).css("display", "none");
        set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
    });
    $('.hd_pops_close').click(function() {
        var idb = $(this).attr('class').split(' ');
        $('#'+idb[1]).css('display','none');
    });
    $("#hd").css("z-index", 1000);
});
</script>

<!-- } íìë ì´ì´ ë -->
    <script>
    $(function(){
        $(".gnb_menu_btn").click(function(){
            $("#gnb_all").show();
        });
        $(".gnb_close_btn").click(function(){
            $("#gnb_all").hide();
        });

		$(".artist_open").on("click",function(){
			$('.artist_depth02').toggleClass('on');
			$('.user_case').toggleClass('on');
		});
    });
    </script>



<!-- ì½íì¸  ìì { -->
<div id="wrapper">
<!--ì¸í¸ë¡ ë¹ëì¤ ì¶ê°-->
<div class="intro_video" style="display: none;">
  <div class="table-cell-wr">
    <!--ëª¨ë°ì¼ ì¼ëë§, video ìì±ê°ì mutedì¶ê° -->
    <video autoplay="" muted="" playsinline="playsinline" id="introVideo" src="http://kozofficial.com/data/intro/intro.mp4" webkit-playsinline="webkit-playsinline"></video>
    <!-- <video autoplay muted playsinline id="introVideo" src="/file/test.mp4"></video> -->
    <!-- <video autoplay="" muted="" playsinline="playsinline" id="introVideo" src="/file/test.mp4" webkit-playsinline="webkit-playsinline"></video> -->
  </div>
  <h2 class="intro_skip">
    Skip
    <span class="show"> <i class="xi-long-arrow-right"></i> </span>
    <!-- <img src="/assets/img/next_arrow.png" alt="ë©ì¸ì¼ë¡ ë°ë¡ê°ê¸°"> -->
  </h2>
</div>

<script type="text/javascript">
$(function(){

  // $("#introVideo").play();

  //ëª¨ë°ì¼ì ìëì¬ì,
  var video = document.getElementById("introVideo");// Get your video
  video.setAttribute('webkit-playsinline', 'webkit-playsinline');// Fix fullscreen problem on IOS 8 and 9
  video.setAttribute('playsinline', 'playsinline');// Fix fullscreen problem on IOS 10


  //ì¤íµë²í¼ ëë¥´ë©´ ì¸í¸ë¡ ë«ê¸°
  $(".intro_skip").on("click",function(){
    $(".intro_video").fadeOut(350);
  });

  //ì¬ììê° ì§ëë©´ ì¸í¸ë¡ ë«ê¸°
  setTimeout(function(){
    $(".intro_video").fadeOut(350);
  },19000);
});

</script>
<!--//ì¸í¸ë¡ ë¹ëì¤ ì¶ê°-->
<div id="main">
  <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
      <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-493.993px, 0px, 0px);">
          <div class="swiper-slide swiper-slide-prev" style="margin-right: 140px;">
            <div class="slider_content">
              <div class="scroll-cta" style="display: none;">
                <div class="arrow">
                  <span>
                    <img src="${pageContext.request.contextPath}/resources/images/main/scroll_arrow.png" alt="ë§ì°ì¤í  ìë´">
                  </span>
                </div>
                <span>scroll to discover</span>
              </div>
              <a href="#">
                <div class="content_wrap">
                  <div class="content_bg">  
                    <!--<img src="/img/slide01.png" alt="KOZ">-->
                    <img src="${pageContext.request.contextPath}/resources/images/main/1.jpg" title="">
                  </div>
                  <div class="content_text">
                    <h4>ë©ë´1</h4>
                    <span>more view</span>
                  </div>
                </div>
              </a>
            </div>
          </div>

		  <div class="swiper-slide swiper-slide-active" style="margin-right: 140px;">
            <div class="slider_content">
              <a href="#">
                <div class="content_wrap">
                  <div class="content_bg">
                    <!--<img src="/img/slide02.png" alt="ì§ì½">-->
                    <img src="${pageContext.request.contextPath}/resources/images/main/2.jpg" title="">
                  </div>
                  <div class="content_text">
                    <h4>ë©ë´2</h4>
                    <span>more view</span>
                  </div>
                </div>
              </a>
            </div>
          </div>

		  <div class="swiper-slide swiper-slide-next" style="margin-right: 140px;">
            <div class="slider_content">
              <a href="#">
                <div class="content_wrap">
                  <div class="content_bg">
                    <!--<img src="/img/dvwn_main.png" alt="ë¤ì´">-->
                    <img src="${pageContext.request.contextPath}/resources/images/main/3.jpg" title="">
                  </div>
                  <div class="content_text">
                    <h4>ë©ë´3</h4>
                    <span>more view</span>
                  </div>
                </div>
              </a>
            </div>
          </div>

          <div class="swiper-slide" style="margin-right: 140px;">
            <div class="slider_content">
              <a href="#">
                <div class="content_wrap">
                  <div class="content_bg">
                    <!--<img src="/img/slide03.png" alt="SHOW ME WHAT YOU GOT">-->
                    <img src="${pageContext.request.contextPath}/resources/images/main/4.jpg" title="">
                  </div>
                  <div class="content_text">
                    <h4>ë©ë´4</h4>
                    <span>more view</span>
                  </div>
                </div>
              </a>
            </div>
          </div>
      </div>
      <div class="swiper-pagination swiper-pagination-fraction"><span class="swiper-pagination-current">2</span> / <span class="swiper-pagination-total">4</span></div>
      <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="false"></div>
      <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></div>
      <!-- <div class="swiper-scrollbar"></div> -->
  <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main/swiper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main/mainslider.js"></script>


</div>

<!-- } íë¨ ë -->

<script>
$(function() {
    // í°í¸ ë¦¬ì¬ì´ì¦ ì¿ í¤ìì¼ë©´ ì¤í
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>



<!-- ie6,7ìì ì¬ì´ëë·°ê° ê²ìí ëª©ë¡ìì ìë ì¬ì´ëë·°ì ê°ë ¤ì§ë íì ìì  -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->




<!-- <script>

// let vh = window.innerHeight * 0.01;
// document.documentElement.style.setProperty('--vh', `${vh}px`);

$(function(){
  // toggle navigaition
  $('.nav_button').click(function(){
    $(this).toggleClass('off');
    $('#hd').toggleClass('ease');
    $('.sub-x-btn-wr').toggleClass('ease');
    $('#navigation').toggleClass('close');
    $('#navigation').toggleClass('open');
    // $('body').toggleClass('non-scroll');
    var wHeight = $(window).height();
    if($('#navigation').hasClass('open') == true) {
      $('body').css('height',wHeight).css('overflow','hidden');
    } else {
      $('body').css('height','auto').css('overflow','auto');
    }
  });
  });

</script> -->

</body>
</html>
