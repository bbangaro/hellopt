<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	
	<script src="${pageContext.request.contextPath}/resources/js/main/wrest.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/swiper.min.css">
	
</head>

<body>
  <div id="main">
    <div class="swiper-container swiper-container-initialized swiper-container-horizontal">

      <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-493.993px, 0px, 0px);">

        <div class="swiper-slide swiper-slide-prev" style="margin-right: 140px;">
          <div class="slider_content">
            <div class="scroll-cta">
              <div class="arrow">
                <span>
                  <img src="${pageContext.request.contextPath}/resources/images/main/scroll_arrow.png" alt="마우스휠 안내">
                </span>
              </div>
              <span>scroll to discover</span>
            </div>
            <a href="#">
              <div class="content_wrap">
                <div class="content_bg">
                  <!--<img src="/img/slide01.png" alt="KOZ">-->
                  <img src="${pageContext.request.contextPath}/resources/images/main/mainfirst.jpg" title="">
                </div>
                <div class="content_text">
                  <h4>History</h4>
                  <span>more view</span>
                </div>
              </div>
            </a>
          </div>
        </div>

        <div class="swiper-slide swiper-slide-active" style="margin-right: 140px;">
          <div class="slider_content">
            <a href="meal">
              <div class="content_wrap">
                <div class="content_bg">
                  <!--<img src="/img/slide02.png" alt="지코">-->
                  <img style="width: 80%; height: 500px" src="${pageContext.request.contextPath}/resources/images/main/nutrition1.jpg" title="">
                </div>
                <div class="content_text">
                  <h4>Nutrition</h4>
                  <span>more view</span>
                </div>
              </div>
            </a>
          </div>
        </div>

        <div class="swiper-slide swiper-slide-next" style="margin-right: 140px;">
          <div class="slider_content">
            <a href="meeting">
              <div class="content_wrap">
                <div class="content_bg">
                  <!--<img src="/img/dvwn_main.png" alt="다운">-->
                  <img style="width: 80%;" src="${pageContext.request.contextPath}/resources/images/main/meeting.jpg" title="">
                </div>
                <div class="content_text">
                  <h4>Offline Meeting</h4>
                  <span>more view</span>
                </div>
              </div>
            </a>
          </div>
        </div>

        <div class="swiper-slide" style="margin-right: 140px;">
          <div class="slider_content">
            <a href="classlist">
              <div class="content_wrap">
                <div class="content_bg">
                  <!--<img src="/img/slide03.png" alt="SHOW ME WHAT YOU GOT">-->
                  <img style="width: 80%;" src="${pageContext.request.contextPath}/resources/images/main/livestream.jpg" title="">
                </div>
                <div class="content_text">
                  <h4>LiveStreaming</h4>
                  <span>more view</span>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>

      <div class="swiper-pagination swiper-pagination-fraction"><span class="swiper-pagination-current">2</span> /
        <span class="swiper-pagination-total">4</span></div>
      <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="false">
      </div>
      <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></div>
      <!-- <div class="swiper-scrollbar"></div> -->
      <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
    </div>
    
    <script src="${pageContext.request.contextPath}/resources/js/main/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/mainslider.js"></script>
  
  </div>

</body>