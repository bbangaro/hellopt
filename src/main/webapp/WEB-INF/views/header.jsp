<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
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


<header id="hd" class="ease" style="z-index: 1000;">
  <h1>
    <a href="#"><span class="ss">HelloPT Training</span></a>
  </h1>
  <button type="button" role="togglebutton" class="nav_button"><span></span></button>
</header>
<!-- ìë¨ ë } -->

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



<div id="wrapper">
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
    <img src="${pageContext.request.contextPath}/resources/images/main/next_right.png">
  </h2>
</div>
</div>

<script type="text/javascript">

//main 있던 자리

<script>
$(function() {
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>





