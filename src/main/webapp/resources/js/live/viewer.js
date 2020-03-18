/*global io*/
/** @type {RTCConfiguration} */
const config = { // eslint-disable-line no-unused-vars
  'iceServers':  [{
      'urls': [
          'stun:stun.l.google.com:19302',
          'stun:stun1.l.google.com:19302',
          'stun:stun2.l.google.com:19302',
          'stun:stun.l.google.com:19302?transport=udp',
      ]
  }]
};

const socket = io.connect("http://localhost:5000");
const video = document.querySelector('video'); // eslint-disable-line no-unused-vars

window.onunload = window.onbeforeunload = function() {
	socket.close();
};

let peerConnection;

socket.on('broadcaster', function() {
	socket.emit('viewer');
	console.log("viewer 이벤트 전달");
})

socket.on('offer', function(id, description) {
	peerConnection = new RTCPeerConnection(config);
	
	console.log("offer 이벤트 받음");
	
	peerConnection.setRemoteDescription(description)
	.then(() => peerConnection.createAnswer())
	.then(sdp => peerConnection.setLocalDescription(sdp))
	.then(function () {
		socket.emit('answer', id, peerConnection.localDescription);
	});
	
	peerConnection.onaddstream = function(event) {
		video.srcObject = event.stream;
		console.log("srcOb - " + video.srcObject);
		console.log("event.stream - " + event.stream);
	}
	
	peerConnection.onicecandidate = function(event) {
		if (event.candidate) {
			console.log("event.candidate: " + event.candidate);
			socket.emit('candidate', id, event.candidate);
			console.log("candidate 이벤트 보냄");
		}
	};
});

socket.on('candidate', function(id, candidate) {
	peerConnection.addIceCandidate(new RTCIceCandidate(candidate))
	.catch(function(err) {
		console.error(err);
	});
	console.log("candidate 이벤트 받음")
});

socket.on('connect', function() {
	socket.emit('viewer');
	console.log("viewer 이벤트 된다된다된다");
});

socket.on('out', function() {
	peerConnection.close();
	console.log("peerConnection 끝");
});
