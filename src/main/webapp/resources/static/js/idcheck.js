function idCheck() {
    let httpRequest = new XMLHttpRequest();
    let userId = document.getElementById('userId').value;
    
    if(userId == "") {
    	alert("아이디를 입력해주십시오");
    	return;
    }
    
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
}

function formCheck() {
	idCheck();
	
	let result = document.getElementById('idCheckResult').innerHTML;
	if(result == "사용 가능한 아이디 입니다.") {
		let form = document.getElementById('user');
		form.submit();
	} else {
		alert("아이디를 확인해주십시오");
	}
}

function loadPreviewImg(img, previewName) {
	let isIE = (navigator.appName == "Microsoft Internet Explorer");
	let path = img.value;
	let ext = path.substring(path.lastIndexOf('.') + 1).toLowerCase();
	
	if(ext == "gif" || ext =="jpeg" || ext == "jpg" || ext == "png") {
		let preview = document.getElementById(previewName);
		if(isIE) {
			preview.src = path;
		} else {
			if(img.files[0]) {
				let reader = new FileReader();
				reader.onload = function (e) {
					preview.src = e.target.result;
				}
				reader.readAsDataURL(img.files[0]);
			}
		}
	} else {
		alert("올바르지 않는 이미지 파일 형식입니다.")
	}
}

