function _ajaxPOST(url,param,successBack){
	_Ajax(url,'POST',param,successBack);
}

function _ajaxGET(url,param,successBack){
	_Ajax(url,'GET',param,successBack);
}

function _Ajax(url,type,param,successBack){
	var jsonData = "";

 	 $.ajax({
         url:"chatbot",
         type:"post",
         async: false ,
         data: param,
         dataType:'json',
         timeout: 15000,
         contentType : 'application/json; charset=UTF-8',
         error: function (request, status, error) {      
        	 alert("처리중오류발생");
         }, success: function (data) {
        	 successBack(data);
        	 
         }, beforeSend: function () {
        	 
         }
         
     });
	 
}