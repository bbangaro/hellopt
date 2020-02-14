<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.star{
		  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 20px;
		  height: 20px;
		  display: inline-block;
		  text-indent: -9999px;
		  cursor: pointer;
		}
	.star.on{background-position:0 0;}
</style>
<script>
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
</script>
</head>
<body>
<div>
<form action="${pageContext.request.contextPath}/insertRBoard" method="post" 
		enctype="multipart/form-data">
<%-- <select>
	<c:forEach var = "class" items="${classMap }">
	<option>수강한 클래스 선택</option>
	</c:forEach>
</select>
<select>
	<c:forEach var = "trainer" items="${trainerMap }">
	<option>트레이너 선생님 선택</option>
	</c:forEach>
</select> --%>
	<table>
		<tbody>
		<tr>
			<td>별점</td>
			<td class="starRev">
				<span class="star on" value="1">별1</span>
				<span class="star" value="2">별2</span>
				<span class="star" value="3">별3</span>
				<span class="star" value="4">별4</span>
				<span class="star" value="5">별5</span>
			<td>
		</tr>
		<tr>
			<td>글쓰기</td>
			<td><textarea name="revContent" rows="20" cols="100"></textarea><td>
		</tr>
		<tr>
			<td>파일첨부하기</td>
			<td><input type="file" name="fileupload"></td>
		</tr>	
		</tbody>	
		<tfoot>
			<tr>
				<td colspan="2" >
					<input type="submit" value="작성완료">
				</td>
			</tr>
		</tfoot>
	</table>
</form>		
</div>
</body>
</html>