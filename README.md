# HelloPT
## 소개
언제 어디서나 운동하고 싶은 사람들을 위한 온-오프라인 운동 플랫폼 HelloPT입니다.

https://hellopt.info

## 사용 기술
- Front-end
    - HTML5
    - CSS3
    - Javascript
    - AJAX
    - Bootstrap
    - JQuery
- Back-end
    - Spring framework
    - Oracle database
    - MyBatis
    - JSP
    - Node.js
    - express
    - sitemesh
    - AWS (EC2, RDS, S3, Route53)
- Open source API
    - [socket.io](https://socket.io)
    - [WebRTC](https://webrtc.org/)

## 기능
1. [로그인-회원가입](#로그인-회원가입)
2. [트레이너 게시판](#트레이너-게시판)
3. [운동 정보 게시판](#운동-정보-게시판)
4. [식단 계산기](#식단-계산기)
5. [PT 온라인 수업](#PT-온라인-수업)
6. [리뷰 게시판](#리뷰-게시판)
7. [FAQ 게시판](#FAQ-게시판)
8. [오프라인 모임 게시판](#오프라인-모임-게시판)
9. [일일 운동 체크](#일일-운동-체크)

### 로그인-회원가입
[로그인](https://hellopt.info/login)

    Spring security authentication를 이용하여 로그인을 구현했습니다.

    로그인 기능 확인 시 다음의 아이디를 사용해주세요.

    ```
    ID: githubtest
    password: githubtest
    ```

[회원가입](https://hellopt.info/user/registrationform)

    client측에서는 내장 from validation을 사용해 데이터 유효성을 검사합니다.
    server측에는 java bean validation을 사용해 데이터 유효성을 검사합니다.
### 트레이너 게시판
[트레이너 정보](https://hellopt.info/trainer)


[트레이너 신청](https://hellopt.info/audition)  

### 운동 정보 게시판
[운동 정보](https://hellopt.info/exerciseinfolist)

### 식단 계산기
[식단 계산기](https://hellopt.info/meal)

### 리뷰 게시판
[리뷰 게시판](https://hellopt.info/review)

### PT 온라인 수업
[PT 온라인 수업](https://hellopt.info/classlist)  

온라인 수업은 웹을 통한 실시간 통신으로 이루어지며 [WebRTC](https://webrtc.org/)를 이용하여 구현했습니다.

트레이너가 수강생에게 실시간으로 비디오와 오디오를 전송할 수 있습니다.
WebRTC는 peer-to-peer protocol을 기반으로 동작하기 때문에
peer의 정보를 연결해주는 signaling server가 필요합니다. 

signaling server는 Node.js와 express, socket.io를 사용하여 구현했습니다.

signaling server를 통해 사용자간의 [SDP](https://tools.ietf.org/html/rfc2327)를 주고 받아서 RTCPeerConnection을 설정합니다.

[signaling server GitHub](https://github.com/DanHoBakMaCha/public_hellopt_live/blob/master/signal.js)

[일대다 온라인 수업 트레이너 source code](https://github.com/bbangaro/hellopt/blob/master/src/main/webapp/resources/js/live/broadcaster.js)

[일대다 온라인 수업 수강생 source code](https://github.com/bbangaro/hellopt/blob/master/src/main/webapp/resources/js/live/viewer.js)

[다대다 온라인 수업 클라이언트측 source code](https://github.com/bbangaro/hellopt/blob/master/src/main/webapp/resources/js/live/multi.js)
<video controls="controls">
    <source src="etc/multi-demo.mp4" type="video/mp4">
</video>

Socket.io를 사용하여 같은 room에 입장한 유저들끼리만 RTCPeerConnection을 주고받아서 P2P 연결을 할 수 있도록 구현했습니다.

WebRTC를 이용해서 스트리밍을 구현한 후 실제로 배포를 해보니 로컬호스트 환경과는 다르게 사용자의 카메라, 오디오 미디어를 얻게 해주는 getUserMedia() 함수가 secure context에서만 동작한다는 사실을 알게 되었습니다.

getUserMedia() 함수를 사용하기 위해서는 https가 필요하다는 것을 알게되었고 AWS Route 53에서 도메인을 구입한 후 AWS Certificate Manager를 이용하여 Amazon에서 발급해주는 인증서를 통해 https 통신이 가능하도록 하여 문제를 해결했습니다.

다대다 스트리밍 경우 P2P 연결로 인해 각각의 유저가 다른 모든 유저와 RTCPeerConnection을 가지고 있어야합니다. 다른 유저와 통신 요청을 할 때 이미 연결된 유저에게는 통신 요청을 하지 않도록 socket.id마다 RTCPeerConnction을 할당하여 불필요하게 이미 연결된 유저와 또 RTCPeerConnection을 생성하지 않도록 했습니다.

### FAQ 게시판
[FAQ 게시판](https://hellopt.info/faq1)

### 오프라인 모임 게시판
[오프라인 모임 게시판](https://hellopt.info/meeting)

### 일일 운동 체크
[일일 운동 체크](https://hellopt.info/calender)






