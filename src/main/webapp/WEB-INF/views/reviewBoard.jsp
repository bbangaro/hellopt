<%@page import="com.bit.hellopt.service.reviewboard.RBoardServiceImpl"%>
<%@page import="com.bit.hellopt.service.reviewboard.RBoardService"%>
<%@page import="org.apache.ibatis.annotations.Mapper"%>
<%@page import="com.bit.hellopt.vo.reviewboard.RBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

<%-- <link rel ="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/reviewBoard.css"> --%>
<meta charset="UTF-8">
<title>후기게시판</title>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>

<style>
 	.content {
	box-sizing: border-box;
	width: 800px;
	margin: 0 auto 150px;
	padding-top: 10%;
	text-align: center; 
}
	.btn{color: white;}
	.profile{ width: 100px; 
				height: auto;
	}
	td .star{
		  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 20px;
		  height: 20px;
		  display: inline-block;
		  text-indent: -9999px;
		  cursor: pointer;
		}
	td .star.on{background-position:0 0;}
</style>
</head>
<body>

<div id = "container">
<form>

	<p><a href="${pageContext.request.contextPath}/review/insertform">후기쓰러가기</a></p>	
<c:forEach var="rBoard" items="${rBoardList }" varStatus="status"> 
<table class="tbl_wrap">
	<thead class="tbl_head01">
		<tr>
			<c:if test="${rBoard.userFileName == null }">
			<td rowspan="3"><img class='profile' src="/hellopt/file/4e464b9505d74c6f94e5241fe3c3dc6a.png"></td>
			</c:if>
			<c:if test="${rBoard.userFileName != null }">
			<td rowspan="3"><img class='profile' src="/hellopt/file/${rBoard.userFileName}"></td>
			</c:if>
			<td>글쓴이 : ${rBoard.userName }</td>  
		</tr>
		<tr>
			<td>수업이름</td>
		</tr>
		<tr>
		
		<td class="starRev"> 
<%-- 	if문 써서	<c:forEach var="i" begin="1" end="5" step="1" >
				<c:if test="${i  > rBoard.revStar }">
					<span class="star"></span>
				</c:if>	
				<c:if test="${i  <= rBoard.revStar }">
					<span class="star on"></span>
				</c:if>	
			</c:forEach> --%>
			<c:forEach var="i" begin="1" end="${rBoard.revStar }" step="1">
				<span class="star on">i</span>
			</c:forEach> 
			<c:forEach var="i" begin="1" end="${5-(rBoard.revStar) }" step="1">
				<span class="star">i</span>
			</c:forEach>   
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">
			<p>내용 :${rBoard.revContent}</p>
			<!--이미지 사진 업로드한부분 나오는곳  -->
			<c:forEach var="file" items="${rBoard.filevo }">
				<p><img width="500px" src="/hellopt/file/${file.revFileSname } "><p>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2">날짜 :<fmt:formatDate value="${rBoard.revRegdate }" type="date"/></td>
		</tr>
		<tr>
		<sec:authorize access="isAuthenticated()">
			<td><a href="#this" id="modify" class= "btn">글 수정</a></td>
			<td><a href="#this" id="delete" class= "btn">글 삭제</a></td>
		</sec:authorize>
		</tr>
	</tbody>
	<c:forEach var="trainer" items="${trainerList }">
	<tfoot>
		<tr>
			<td colspan="2"><a href="">트레이너${trainer.name } <img src=""></a></td>
		</tr>
	</tfoot>
	</c:forEach>
</table>
</c:forEach>
</form>
</div>	
<%@ include file="/WEB-INF/include/include-body.jsp" %>	
<script>
	$(document).ready(function(){
		$("#modify").on("click", function(e){
			e.preventDefault();
			fn_BoardModify($(this));
		})
		$("a[name='delete']").on("click", function(e){
			e.preventDefault();
			fn_BoardDelete($(this));
		})
	})
	function fn_BoardModify(obj){
		var comSubmit = new ComSubmit("frm");
		comSubmi.setUrl("<c:url value='/review/updateform' />");
		comSubmit.submit();
	}
	function fn_BoardDelete(obj){
		var comSubmit = new ComSubmit("frm");
		comSubmi.setUrl("<c:url value='/review/deleteboard' />");
		comSubmit.submit();
	}
	
	
</script>
</body>
</html>