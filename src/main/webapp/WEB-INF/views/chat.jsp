<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라이브 채팅</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://www.kozofficial.com/theme/basic/css/style.css">
</head>

<body>
	<script src="http://localhost:3000/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
	<script>
	
		$(function() {
			var socket = io("http://localhost:3000");
			
			$("#msg").keydown(function(key) {
				
				//keyCode 13 = 엔터키
				if (key.keyCode == 13) {
					send.click();
				}
			});
			
			$("#send").click(function() {
				socket.emit("send_msg", $("#msg").val());
				$("#msg").val("");
			});
			
			socket.on("send_msg", function(msg) {
				$('<div></div>').text(msg).appendTo("#txtLayout");
			});
		});
	
	</script>	
	<!-- 콘텐츠 시작 { -->
	<div id="wrapper">
		<div class="tit-wr tit-wr-ani">
	   	 <h2>라이브 스트리밍</h2>
	  	</div><!-- //tit-wr -->
	
		<div class="sub-content">
			<div class="inner">
				<div class="stream-cont clfix">
				    <!-- 동영상 나중에 스트리밍 화면으로 대체 -->
				    <div id="video">
						<iframe src="https://www.youtube.com/embed/azxahQi6vFo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>	
					</div>
					
					<!-- 채팅박스 -->
					<div id="chat_box" class="chat">
						<div class="txtLayout" id="txtLayout">
						</div>
						<div class="chatBtn">
							<input class="chattxt" type="text" id="msg" placeholder="Type a message" />
							<button class="chatbtn" id="send">보내기</button> 
						</div>
					</div><!-- //chat_box -->		
				</div><!-- //stream-cont -->	
			</div><!-- //inner -->	
		</div><!-- // sub-content -->
	</div><!-- // wrapper -->


</body>

<style>

	/* reset **********************************************************************/ 
	html,body {width:100%; background:#1e1e1e !important;}
	html {overflow-y:scroll; box-sizing:border-box;}
	html.active, body.active {overflow-y:hidden;}
	*, *:before, *:after{box-sizing:inherit;}
	*{
	-webkit-text-size-adjust:none;
	-webkit-text-size-adjust - auto | none | N% (default auto)
	}
	body {word-break:break-all;-ms-word-break:break-all; }
	body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,textarea,p,blockquote,th,td,input,select,textarea,button {margin:0; padding:0;}
	fieldset,img {border:0px none; vertical-align:top;}
	dl,ul,ol,menu,li {list-style:none;}
	blockquote, q {quotes: none;}
	blockquote:before, blockquote:after,q:before, q:after {content:''; content:none;}
	button {border:0 none; background-color:transparent; cursor:pointer;}
	body { background:#fff;}
	body,th,td,input,select,textarea,button {font-size:15px; line-height:1.6; font-family: 'Noto Sans KR';  color:#333;} 
	input, select, textarea, button{vertical-align:middle; }
	a:link,a:active,a:visited{color:#333; text-decoration:none; border:0px;}
	a:hover,a:focus{color:#333; text-decoration:none}
	
	table {border-collapse:collapse; border-spacing:0;}
	address,caption,cite,code,dfn,em,var {font-style:normal; font-weight:normal;}
	summary, caption, legend, hr {width:0; height:0; font-size: ; line-height: ; overflow: hidden; visibility: hidden; border: none; position:absolute; left:-1000em;}
	caption {position:static;}
	/* label hidden 처리 */
	.invisible, .hide{overflow:hidden; visibility:hidden; width:0; height:0; font-size:0; line-height:0; position:absolute;}
	label.invisible{*position:Absolute;}
	
	/* common */
	.clfix:after {content: "."; display: block; height:0px; clear: both; visibility: hidden;}
	.clfix {display:inline-block;}
	.clfix {display:block;}
	* html .clfix {height:1%;} /* Hides from IE-mac */
	.clfix {zoom:1;} /*for IE 5.5-7*/
	
	.inner {width:1050px; margin:0 auto; display:block;}
	
	#video {position:relative; float:left; width:680px; height:500px;}
	#video iframe {position:absolute; top:0; left:0; width:100%; height:100%;}
	
	#chat_box {float:right; width:340px; height:500px; background:#000; border:1px solid #fff; }
	#chat_box .txtLayout {width:100%; height:427px; padding:20px 20px; color:#fff;}
	#chat_box .chatBtn {width:100%; padding:20px 10px; overflow:hidden; border-top:1px solid #4c4c4c;}
	input.chattxt {display:block; float:left; width:243px; height:30px; border:1px solid #eaeaea; color:#fff; font-size:13px; background:#333; outline:none; padding-left:5px;}
	button.chatbtn {display:block; float:right; width:70px; height:30px; background:#333; color:#fff; font-size:13px;}
	
</style>
</html>