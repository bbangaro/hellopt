<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>

<!------ Include the above in your HEAD tag ---------->

<html>
<head>

<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/live.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class/style.css">
	
	<!-- This Library is used to detect WebRTC features -->
	<script src="${pageContext.request.contextPath }/resources/js/live/DetectRTC.js"></script>
	<script src="https://www.webrtc-experiment.com/socket.io.js"> </script>
	<script src="${pageContext.request.contextPath }/resources/js/live/adapter-latest.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/live/IceServersHandler.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/live/CodecsHandler.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/live/RTCPeerConnection-v1.5.js"> </script>
	<script src="${pageContext.request.contextPath }/resources/js/live/broadcast.js"> </script>

<style>
	video {
	    vertical-align: top;
	    width: 70%;
	    float: left;
	}
	
	input {
	    border: 1px solid #d9d9d9;
	    border-radius: 1px;
	    font-size: 2em;
	    margin: .2em;
	    width: 50%;
	}
	
	.setup {
	    border-bottom-left-radius: 0;
	    border-top-left-radius: 0;
	    font-size: 102%;
	    height: 47px;
	    margin-left: 10px;
	    margin-top: 8px;
	    position: absolute;
	}
</style>
<script>
    document.createElement('article');
</script>
</head>
<body>
	
	<div id="wrapper">
		<div class="tit-wr tit-wr-ani">
			<h2>라이브 스트리밍</h2>
		</div>
		<!-- //tit-wr -->

		<div class="sub-content">
			<article>
			    <section class="experiment">
			        <!-- list of all available broadcasting rooms -->
			        <table id="rooms-list"></table>
			
			        <!-- local/remote videos container -->
			        <div id="videos-container">
			        </div>
			        
			        <div id="chat-container">
						<iframe id="chat" src="http://localhost:3000"></iframe>
			        </div>
			    </section>
			</article>
			
		</div>
		<!-- // sub-content -->
	</div>
	<!-- // wrapper -->

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<input type="hidden" value="${user.username }" id="userid">
	</sec:authorize>  

	<input type="hidden" value="${className }" id="className">

<script>
   // Muaz Khan     - https://github.com/muaz-khan
   // MIT License   - https://www.webrtc-experiment.com/licence/
   // Documentation - https://github.com/muaz-khan/WebRTC-Experiment/tree/master/webrtc-broadcasting

   var config = {
       openSocket: function(config) {
           var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';

           config.channel = config.channel;
           //var sender = Math.round(Math.random() * 999999999) + 999999999;
           
           var userid = $("#userid").val();

           //console.log("sender: " + sender);
           console.log("userid: " + userid);
           console.log("channel: " + config.channel);
           
           io.connect(SIGNALING_SERVER).emit('new-channel', {
               channel: config.channel,
               sender: userid
           });

           var socket = io.connect(SIGNALING_SERVER + config.channel);
           socket.channel = config.channel;
           socket.on('connect', function () {
               if (config.callback) config.callback(socket);
           });
           
           console.log("socket.channel : " + socket.channel);

           socket.send = function (message) {
               socket.emit('message', {
                   sender: userid,
                   data: message
               });
           };

           socket.on('message', config.onmessage);
        
           //console.log("message: " + config.onmessage);
       },
       onRemoteStream: function(htmlElement) {
           videosContainer.appendChild(htmlElement);
           rotateInCircle(htmlElement);
       },
       onRoomFound: function(room) {
       	
       	var userid = $("#userid").val();
       	
       	console.log("room: " + room);
       	console.log("room.broadcaster : " + room.broadcaster);
       	//console.log("room.roomToken : " + room.roomToken);
       	
       	console.log("broadcaster : " + room.broadcaster);
       	
           var alreadyExist = document.querySelector('button[data-broadcaster="' + room.broadcaster + '"]');
           if (alreadyExist) return;

           if (typeof roomsList === 'undefined') roomsList = document.body;
           
           console.log("room.roomName : " + room.roomName);
          
           var className = $("#className").val();
           console.log("className : " + className);
           
           if (className === room.roomName) {
			console.log("강의 제목 일치");	                	
            /* var tr = document.createElement('tr');
            tr.innerHTML = '<td><strong>' + room.roomName + '</strong> 강의에 참여하기 위해서는 방송보기 버튼을 클릭해주세요!</td>' +
                '<td><button class="join">Join</button></td>';
            roomsList.appendChild(tr);

            var joinRoomButton = tr.querySelector('.join'); */
            
            var div = document.createElement('div');
            div.innerHTML = '<div><strong>' + room.roomName + '</strong> 강의에 참여하기 위해서는 방송보기 버튼을 클릭해주세요!</div>' +
                '<div><button class="join">방송보기</button></div>';
            roomsList.appendChild(div);

            var joinRoomButton = div.querySelector('.join');
            
            joinRoomButton.setAttribute('data-broadcaster', room.broadcaster);
            joinRoomButton.setAttribute('data-roomToken', room.roomToken);
            joinRoomButton.onclick = function() {
                this.disabled = true;

                var broadcaster = this.getAttribute('data-broadcaster');
                var roomToken = this.getAttribute('data-roomToken');
                broadcastUI.joinRoom({
                    roomToken: roomToken,
                    joinUser: broadcaster
                });
                hideUnnecessaryStuff();
            };
           }
       },
       onNewParticipant: function(numberOfViewers) {
           document.title = 'Viewers: ' + numberOfViewers;
       },
       onReady: function() {
           console.log('now you can open or join rooms');
       }
   };

   function setupNewBroadcastButtonClickHandler() {
       document.getElementById('broadcast-name').disabled = true;
       document.getElementById('setup-new-broadcast').disabled = true;

       DetectRTC.load(function() {
           captureUserMedia(function() {
               var shared = 'video';

               broadcastUI.createRoom({
                   roomName: (document.getElementById('broadcast-name') || { }).value,
                   isAudio: shared === 'audio'
               });
           });
           hideUnnecessaryStuff();
       });
   }

   function captureUserMedia(callback) {
       var constraints = null;
       window.option = broadcastingOption ? broadcastingOption.value : '';

       if (DetectRTC.hasWebcam !== true) {
           alert('DetectRTC library is unable to find webcam; maybe you denied webcam access once and it is still denied or maybe webcam device is not attached to your system or another app is using same webcam.');
       }

       var htmlElement = document.createElement('video');

       htmlElement.muted = true;
       htmlElement.volume = 0; 

       try {
           htmlElement.setAttributeNode(document.createAttribute('autoplay'));
           htmlElement.setAttributeNode(document.createAttribute('playsinline'));
           htmlElement.setAttributeNode(document.createAttribute('controls'));
       } catch (e) {
           htmlElement.setAttribute('autoplay', true);
           htmlElement.setAttribute('playsinline', true);
           htmlElement.setAttribute('controls', true);
       }

       var mediaConfig = {
           video: htmlElement,
           onsuccess: function(stream) {
               config.attachStream = stream;
               
               videosContainer.appendChild(htmlElement);
               rotateInCircle(htmlElement);
               
               callback && callback();
           },
           onerror: function() {
           	alert('unable to get access to your webcam');
           }
       };
       if (constraints) mediaConfig.constraints = constraints;
       getUserMedia(mediaConfig);
   }

   var broadcastUI = broadcast(config);

   /* UI specific */
   var videosContainer = document.getElementById('videos-container') || document.body;
   var setupNewBroadcast = document.getElementById('setup-new-broadcast');
   var roomsList = document.getElementById('rooms-list');

   var broadcastingOption = document.getElementById('broadcasting-option');

   if (setupNewBroadcast) setupNewBroadcast.onclick = setupNewBroadcastButtonClickHandler;

   function hideUnnecessaryStuff() {
       var visibleElements = document.getElementsByClassName('visible'),
           length = visibleElements.length;
       for (var i = 0; i < length; i++) {
           visibleElements[i].style.display = 'none';
       }
   }

   function rotateInCircle(video) {
       video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(0deg)';
       setTimeout(function() {
           video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(360deg)';
       }, 1000);
   }

</script>
 <script>
	var userId = $("#userid").val();
	
	console.log("classIdx : " + ${classIdx });

	//var roomId = Math.round(Math.random() * 999999999) + 999999999;
	var roomId = ${classIdx };
	
	console.log("userId: " + userId);
	console.log("roomId: " + roomId);
	
	//채팅서버로 룸아이디, 유저아이디 전송
	setTimeout(function () {
		document.querySelector("#chat").contentWindow.postMessage(JSON.stringify({"roomId": roomId, "sender": userId}), "*");	
	}, 1000);
</script>  

</body>
</html>