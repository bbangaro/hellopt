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
	.imgs_wrap {
		width: 600px;
		margin-top: 50px;
	}
	.imgs_wrap img {
		max-width: 200px;
	}
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
<script>
//--다중 파일 선택시 미리보기
	
	//이미지 정보들을 담을 배열
	var sel_files =[];

	$(document).ready(function(){
		$("#input_imgs").on("change", handleImgFileSelect);
	});
	
 	function fileUploadAction(){
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	} 
	
	function handleImgFileSelect(e){
		
		// 이미지 정보들을 초기화
 		sel_files = [];
		$(".imgs_wrap").empty(); 
	
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		var index = 0; 
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id = \"img_id" +index+"\"><img src=\"" + e.target.result + "\" data-file='" + f.name + "' class='selProductFile' title='Click to remove'></a>";
				$(".imgs_wrap").append(html);
				index++;
				
			}
			reader.readAsDataURL(f);
		});
	}
	
	//다중 파일 미리보기에서 특정 이미지만 삭제하기
	function deleteImageAction(index){
		console.log("index : " + index);
		sel_files.splice(index, 1);
		
		var img_id = "#img_id_" + index;
		$(img_id).remove();
		
		console.log(sel_files);
	}
</script>	
<script>	
	//다중 파일 post 전송
	function submitAction(){
		var data = new FormData();
		
		for(var i = 0, len=sel_files.length; i < len; i++){
			var name = "image_" + i;
			data.append(name, sel_files[i]);
		}
		data.append("image_count", sel_files.length);	
		
		
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "./study01_af.php");
			xhr.onload = function(e){
				if(this.status == 200){
					console.log("Result:" + e.currentTarget.responseText);
				}
			}
			xhr.send(data);
		}
</script>

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
			<input  type="file" multiple="multiple" id="file" name="file_0" >
			<c:forEach var="file" items="${rBoard.filevo }">
				<p>${file.revFileOname } "></p>
			</c:forEach>
			<a href="#this" class="btn" id ="delete" name="delete" >삭제하기</a>
		</p>
	</div>
	<!--  이미지 미리보기 -->
	<h2>이미지 미리보기</h2>
	<div class = "input_wrap">
		<a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
		<input type="file" id="input_imgs"  name="file_0" multiple>
	</div>
	
	<div>
		<div class="imgs_wrap">
			<img id="img" >
		</div>
	</div>
	
	<a href="javacript:" class="my_button" onclick="submitAction();">업로드</a>
	
	<a href="#this" id="list" class="btn">목록으로</a>
	<a href="#this" id="modify" class="btn">수정완료</a>
</form>	


<%@ include file="/WEB-INF/include/include-body.jsp" %>	

<script type="text/javascript">
	
	
/* 
	$('#file').on("change", function(){
		var formData = new FormData($('#frm')[0]);
		$.ajax({
			type: "POST", 
			enctype: 'multipart/form-data',
		 	url: '/hellopt/review/upload',
		 	data: formData, 
		 	processData: false, 
		 	contentType: false,
		 	cache: false,
		 	success: function (result) {
		 		alert("성공");
		 		
		 	}, error: function (e) {
		 		alert("실패");
		 	} 
		 		
		});
	}); */
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
 	function fn_fileDelete(obj){
 		obj.parent().remove();
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