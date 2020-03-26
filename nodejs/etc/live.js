//1대다 스트리밍 서버

//필요한 모듈 선언
var fs = require('fs');
var cors = require('cors');
var app = require('express')();

//SSL 인증 옵션
var options = {
	key: fs.readFileSync('./private.key'),
	cert: fs.readFileSync('./private.crt')
};

//서버(https) 
/*var server = require('https').createServer(options, app);*/

//http 서버
var server = require('http').createServer(app);

//크로스 도메인 사용 가능하도록 설정
app.use(cors());

//get요청시의 라우터(브라우저에서 Request가 왔을때 서버에서 할 작업)
app.get('/', function(req, res) {
	res.write("<h1>Hello World!</h1>");
})

//socket io 
var io = require('socket.io')(server);

/*//socket io 연결
io.on('connection', function(socket) {
	console.log("소켓아이디: " + socket.id + " 접속");
	
	socket.on('broadcaster', function(data) {
		console.log("data: " + data);
		console.log("broadcaster 이벤트 성공");
		socket.emit('broadcaster');
		console.log("broadcaster 이벤트 전달") 
	});
	
});*/
let broadcaster;

//for video chat
io.sockets.on('error', e => console.log(e))
io.sockets.on('connection', function (socket) {
		
	  socket.emit('connect');
	  console.log("connect 이벤트 보내기");
		
	  socket.on('broadcaster', function () {
	    broadcaster = socket.id;
	    socket.broadcast.emit('broadcaster');
	    console.log("broadcaster : " + broadcaster);
	  })
	  socket.on('offer', function (id /* of the watcher */, description) {
		  socket.to(id).emit('offer', socket.id /* of the broadcaster */, description);
		  console.log("offer 이벤트 id : " + id + " description : " + description);
	  })
	  socket.on('viewer', function () {
	    broadcaster && socket.to(broadcaster).emit('viewer', socket.id);
	    console.log("broadcaster : " + broadcaster + ", socket.id: " + socket.id);
	    
	  })
	  socket.on('answer', function (id /* of the broadcaster */, description) {
	    socket.to(id).emit('answer', socket.id /* of the watcher */, description);
	    console.log("answer 이벤트 id - " + id + "des - " + description);
	  })
	  socket.on('candidate', function (id, candidate) {
	    socket.to(id).emit('candidate', socket.id, candidate);
	    console.log("candidate이벤트 id : " + id + ", candidate : " + candidate);
	  })
	  socket.on('disconnect', function() {
	    broadcaster && socket.to(broadcaster).emit('out', socket.id);
	    console.log("socket.id - " + socket.id)
	  })
})


//서버 포트 열기
server.listen(5000, function() {
	console.log("5000번 포트 열림");
});