# HelloPT
헬스장에서도 집에서도 운동하자!

[HelloPT](https://hellopt.info/hellopt)를 방문해보세요.

## 1. 기능
1. [로그인 / 회원가입](#로그인-/-회원가입)
2. [트레이너 게시판](#트레이너-게시판)
3. [운동 정보 게시판](#운동-정보-게시판)
4. [식단 계산기](#식단-계산기)
5. [PT 스트리밍](#PT-스트리밍)
6. [리뷰 게시판](#리뷰-게시판)
7. [FAQ 게시판](#FAQ-게시판)
8. [오프라인 모임 게시판](#오프라인-모임-게시판)
9. [일일 운동 체크](#일일-운동-체크)

### 로그인 / 회원가입
[로그인](https://hellopt.info/hellopt/login)  
Spring Security를 이용하여 로그인을 구현했습니다.

데모용 아이디
```
ID: githubtest
PW: githubtest
```

UserDetailsService 클래스를 구현하여 사용자가 로그인 시 입력한 아이디 / 비밀번호가 DB에 저장된 정보와 일치하는 지 확인했습니다.

```
public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = mapper.selectUserById(username);
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		return new CustomUserDetail(user);
	}
```

[회원가입](https://hellopt.info/hellopt/user/registrationform)

회원가입 시 사용자가 입력한 데이터가 올바르게 입력됐는지 확인합니다.

client측에서는 HTML5의 내장 form validation을 사용하여 데이터 유효성을 검사합니다.
 
```
<form:input path="userId" placeholder="ID" required="" minlength="5" maxlength="20" pattern="[0-9a-z-_]{5,20}"/>
```
server측에서는 Java Bean Validation을 사용하여 서버측으로 전송된 데이터가 유효한지 확인합니다.
```
@Pattern(regexp = "^[0-9a-z-_]{5,20}$", message = "5~20 characters consisting of lowercase letters(a-z), numbers, or special characters (_, -)")
	private String userId;
```
AJAX로 요청을 보내 해당 아이디가 이미 사용 중인지 확인하여 사용자가 아이디 중복 여부를 확인 할 수 있습니다.
```
httpRequest.open('POST', "/hellopt/user/idcheck")
        httpRequest.responseType = 'json';
        httpRequest.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
        httpRequest.send(JSON.stringify({"userId" : userId}));
        httpRequest.onload = function() {
            let result = httpRequest.response;
            let resultLabel = document.getElementById('idCheckResult');
            if(result == 1) {
                resultLabel.innerHTML = "중복된 아이디 입니다."
            } else {
            	resultLabel.innerHTML = "사용 가능한 아이디 입니다."
            }
        }
```

### 트레이너 게시판
[트레이너 정보](https://hellopt.info/hellopt/trainer)  
[트레이너 신청](https://hellopt.info/hellopt/audition)  
[트레이너 정보 수정](https://hellopt.info/hellopt/admin/traineradmin)  
(관리자 계정 로그인 필요)

### 운동 정보 게시판
[운동 정보](https://hellopt.info/hellopt/exerciseinfolist)

### 식단 계산기
[식단 계산기(로그인 필요)](https://hellopt.info/hellopt/meal)

### 리뷰 게시판
[리뷰 게시판](https://hellopt.info/hellopt/review)

### PT 스트리밍
[일대다 스트리밍(로그인 필요)](https://hellopt.info/hellopt/classlist)  
[다대다 스트리밍](https://hellopt.info/hellopt/multi)

### 리뷰 게시판
[리뷰 게시판](https://hellopt.info/hellopt/review)

### FAQ 게시판
[FAQ 게시판](https://hellopt.info/hellopt/faq1)

### 오프라인 모임 게시판
[오프라인 모임 게시판](https://hellopt.info/hellopt/meeting)

### 일일 운동 체크
[일일 운동 체크](https://hellopt.info/hellopt/calender)

## 2. ERD
![HelloPT ERD](/etc/Relational_1.png)



