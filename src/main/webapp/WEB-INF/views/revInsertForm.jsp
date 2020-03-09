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
		<caption>후기작성</caption>
		<tbody>
		<tr>
			 <td>별점</td>
			<td class="starRev">
				<span class="star on">1</span>
				<span class="star">2</span>
				<span class="star">3</span>
				<span class="star">4</span>
				<span class="star" id="star">5</span>
				<input id="revStar1" type="hidden" name="revStar" value="">
			<td> 
		</tr>
		<tr>
			<td scope = "row">내용</td>
			<td><textarea name="revContent" rows="20" cols="100" title="내용"></textarea><td>
		</tr>
		</tbody>	
	</table>
	<div id = "fileDiv">
		<p>
			<input type="file" multiple="multiple" id="file" name="file_0" />
			<a href="#this" class="btn" id ="delete" name="delete" >삭제하기</a>
		</p>
	</div>
	
	
	
	<a href="#this" id="addFile" class="btn">파일 추가하기</a>
	<a href="#this" id="list" class="btn">목록으로</a>
	<a href="#this" id="write" class="btn">작성완료</a>
</form>	
<%@ include file="/WEB-INF/include/include-body.jsp" %>	

<script type="text/javascript">
	var g_count = 1; 
 	$(document).ready(function(){
 		$("#list").on("click", function(e){
 			e.preventDefault();
 			fn_openBoardList(); 
 		})
 		$("#write").on("click", function(e){
 			e.preventDefault();
 			fn_writeBoard();
 		})
 		$("a[name='delete']").on("click", function(e){//파일삭제버튼
 			e.preventDefault();
 			fn_fileDelete($(this));
 		})
 		$("#addFile").on("click", function(e){//파일추가버튼
 			e.preventDefault();
 			fn_fileAdd();
 		}) 
 	});
 	
 	function fn_openBoardList(){
 		var comSubmit = new ComSubmit();
 		console.log("<c:url value='/reviewBoard'/>");
 		comSubmit.setUrl("<c:url value='/reviewBoard'/>");
 		comSubmit.submit();
 	}
 	
 	function fn_writeBoard(){
 		var comSubmit = new ComSubmit("frm");
 		comSubmit.setUrl("<c:url value='/insertrboard'/>");
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
	$('.starRev span').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		var star = $(this).text(); 
		$('#revStar1').attr('value',star);  
		  return false;
		});
</script>
</body>
</html>