<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기작성</title>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
	td .star{
		  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 30px;
		  height: 30px;
		  display: inline-block;
		  text-indent: -9999px;
		  cursor: pointer;
		}
	td .star.on{background-position:0 0;}
</style>
</head>

<body>
	<br><br><br><br>
<form id="frm" method="post" 
		enctype="multipart/form-data">
	
<select>
	<c:forEach var = "class" items="${classMap }">
	<option>수강한 클래스 선택</option>
	</c:forEach>
</select>
<select>
	<c:forEach var = "trainer" items="${trainerMap }">
	<option>트레이너 선생님 선택</option>
	</c:forEach>
</select> 
	<table class="board_view">
		<colgroup>
			<col width="15%">
			<col width="*">
		</colgroup>
		<tbody>
		<tr>
			
			<td>별점</td>
			<td class="starRev">
			<c:forEach var="i" begin="1" end="${rBoard.revStar }" step="1">
				<span class="star on">${i }</span>
			</c:forEach> 
			<c:forEach var="i" begin="1" end="${5-(rBoard.revStar) }" step="1">
				<span class="star">${i }</span>
			</c:forEach>  
				<input id="revStar1" type="hidden" name="revStar" value="">
			<td> 
		</tr>
		<tr>
			<td scope = "row">내용</td>
			<td><textarea name="revContent" rows="20" cols="100" title="내용">${rBoard.revContent }</textarea><td>
		</tr>
		</tbody>	
	</table>
	<div id = "fileDiv">
		<p>
			<input  type="file" multiple="multiple" id="files" name="file_0">
			<c:forEach var="file" items="${rBoard.filevo }">
				<p>${file.revFileOname } "></p>
			</c:forEach>
			<a href="#this" class="btn" id ="delete" name="delete" >삭제하기</a>
		</p>
	</div>
	<div class="fileImg fileEmpty" id="preView">
		<span>파일 미리보기</span>
	</div>
	<a href="#this" id="list" class="btn">목록으로</a>
	<a href="#this" id="modify" class="btn">수정완료</a>
	<input  type="file" multiple="multiple" id="files" name="file_0">
</form>	


<script>
//다중 파일 업로드 새로함
	$('#files').change(function(){
		fileBuffer = [];
		const target = document.getElementsByName('file_0');
		
		//Array.prototype.push.apply(fileBuffer, target[0].files);
		var html = '';
		$.each(target[0].files, function(index, file){
			const fileName = file.name;
			html += '<div class="file">';
			html += '<img src="'+ URL.createObjectURL(file) + '">';
			html += '<span>' + fileName + '<span>';
			html += '<span>기간 '+'<input type = "text" style="width:250px/"><span>';
			html += '<a href="#" id="removeImg">x</a>';
			html += '</div>';
			
			const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
			if(fileEx != "jpg" && fileEx != "gif" && "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
				alert("파일은  (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.")
				resetFile();
				return false;
			}
			$('.fileList').html(html);
		});
	});
	
	$(document).on('click', '#removImg', function(){
		const fileIndex = $(this).parent().index();
		fileBuffer.splice(fileIndex, 1);
		$('.fileList>div:eq('+fileIndex+')').remove();
		
		const target = document.getElementsByName('file_0');
		console.log(fileBuffer);
		console.log(target[0].files);
	});

 //파일 객체 초기화
var agent = navigator.userAgent.toLowerCase();
if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	$(target).replaceWidth( $(target).clone(true));
} else{
	$(target).val("");
}


ajaxForm : function(id, file, func){
	$('#frm').ajaxForm({
		contentType : false,
		processData: false, 
		enctype: "multipart/form-data",
		dataType : "POST",
		dataType : "json",
		beforeSubmit:function(data, form, option){
			var fileSize = file.length;
			if(fileSize>0){
				for(var i = 0; i<fileSize; i++){
					var obj = {
							name : "file_0",
							value : file[k],
							type : "file"
					};
					console.log(obj);
					data.push = obj;
				}
			}
			console.log('beforeSubmit');
			console.log(file);
			console.log(data);
			console.log(form);
			console.log(option);
		},
		sucess: function(returnData){
			console.log("returnData : " + returnData);
			func(feturnData);
		},
		error : function(x,e){
			console.log("[AF]ajax status : " +x.status);
			console.log(e);
		},
	});
} 
</script>
	
<%@ include file="/WEB-INF/include/include-body.jsp" %>	
<script type="text/javascript">
	
	var g_count = 1; 
 		$("#list").on("click", function(e){
 			e.preventDefault();
 			fn_openBoardList(); 
 		})
 		$("#modify").on("click", function(e){
 			e.preventDefault();
 			fn_modifyBoard();
 		})
 		$("a[name='delete']").on("click", function(e){//파일삭제버튼
 			e.preventDefault();
 			fn_fileDelete($(this));
 		})
 		$("#addFile").on("click", function(e){//파일추가버튼
 			e.preventDefault();
 			fn_fileAdd();
 		});
 	
 	function fn_openBoardList(){
 		var comSubmit = new ComSubmit();
 		console.log("<c:url value='/reviewBoard'/>");
 		comSubmit.setUrl("<c:url value='/reviewBoard'/>");
 		comSubmit.submit();
 	}
 	
 	function fn_modifyBoard(){
 		var comSubmit = new ComSubmit("frm");
 		comSubmit.setUrl("<c:url value='/updaterboard'/>");
 		comSubmit.submit();
 	}

 	function fn_fileAdd(){
 		var str 
 			= "<p><input type='file' name='file_"+(g_count++)+"'><a href='#this' name='delete' class='btn'>삭제하기</a></p>";
 				$("#fileDiv").append(str);
 				$("a[name='delete']").on("click", function(e){
 					e.preventDefault();
 					fn_fileDelete($(this));
 				})
 	} 
</script>
<script>
 	//별점 스크립트부분
	$('.starRev span').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
 		var star = $(this).text(); 
		$('#revStar1').attr('value',star);   
		  return false;
		})
</script>
</body>
</html>