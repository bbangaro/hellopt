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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
	
	a {
		text-decoration: none;
		color: white;
	}
	button {
		background-color:white;
	}
	.jb-center{
		display: block;
		text-align: center;
		background-color: yellow;
	}
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
</style>
</head>

<body>
<div id = "container">
<%-- <div id="outter">
	<div style="float:right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기 </option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기 </option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15 }">selected</c:if>>15줄 보기</option>
		</select>
	</div>
</div> --%>

<form>
	<sec:authorize access="isAuthenticated()">
	<p><a href="${pageContext.request.contextPath}/review/insertform">후기쓰러가기</a></p>	
	</sec:authorize>
<c:forEach var="rBoard" items="${rBoardList }" varStatus="status"> 
<table class="tbl_wrap">
	<thead class="tbl_head01">
		<tr>
		<sec:authorize access="isAuthenticated()">
		<sec:authentication var="principal" property="principal" />
		<c:if test="${rBoard.userId == principal.username}">
			<td><input type = "button" value="글 수정" onclick = "modify(${rBoard.revIdx})"></td>
			<td><input type = "button" value="글 삭제" onclick = "del(${rBoard.revIdx })"></td>
		</c:if>
		</sec:authorize>
		</tr>
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
		<!--별점기능 -->
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

	</tbody>
	<tfoot>
		<tr>
		<!-- 댓글이 있으면 댓글몇개 달렸다고 출력하기 -->
			<c:if test="${rBoard.cmtCnt > 0 }">
			<td>
				<a href="#this" id="cmtCnt"> 댓글${rBoard.cmtCnt }개 모두 보기</a>
			</td>
			</c:if> 
		</tr>
		<sec:authorize access="isAuthenticated()">
		<tr>
			<td>
				<textarea rows="2" cols="80" id="cmtComment" placeholder="댓글 달기..."></textarea>
			</td>
			<td>
				<button type="button" id="btnReply">등록</button>
			</td>	
		</tr>
		</sec:authorize>
		<c:forEach var="row" items="${replyList }">
		<tr>
			<td id="listReply">
			${row.userName}(<fmt:formatDate value="${row.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>)
			<br>
			${row.revCmtComment }
			</td>	
		</tr>
		</c:forEach>
	</tfoot>
</table>	
</c:forEach>
	<!--페이징 -->
	<br><br><br>
	<td colspan="4">
		<ol class="paging">
			<c:choose>
				<c:when test="${pvo.beginPage == 1}">
					<li class="disable">이전으로<li>
				</c:when>
				<c:otherwise>
					<li>
						<a class="disable" href="review?cPage=${pvo.beginPage - 1 }">이전으로</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<!-- 블록내에 표시할 페이지 표시(시작페이지~끝페이지)  -->
			<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
			<c:choose>
				<c:when test="${k == pvo.nowPage }">
					<li class="now">${k }</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="review?cPage=${k}">${k }</a>
					</li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<!-- [다음으로]에 대한 사용여부 처리 -->
			<!-- 사용불가(disable) 
					endPage가 전체페이지 수보다 크거나 같으면
				-->
			<c:choose>
				<c:when test="${pvo.endPage >= pvo.totalPage }">
					<li class="disable">다음으로 </li>
				</c:when>
				<c:otherwise>
					<li >
						<a href="review?cPage=${pvo.endPage + 1 }">다음으로</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ol>
	</td>
 	<!--페이징끝 -->
</form>
</div>	
<%@ include file="/WEB-INF/include/include-body.jsp" %>	
<script>
	$(document).ready(function(){
		
		//댓글쓰기 버튼 클릭 이벤트 (ajax로 처리)
		$("#btnReply").click(function(){
			var replytext=$("#replytext").val();
			var revIdx="${RBoardVO.revIdx}"
			var param="replytext=" + revCmtComment + "&revIdx=" + revIdx;
			$.ajax({
				type: "post",
				url:"${path}/review/reply/insert",
				data: param,
				success: function(){
					alert("댓글이 등록되었습니다.");
					listReply2();
				}
			})
			
		})
	})

	function del(revIdx) {
		var chk = confirm("정말 삭제 하시겠습니까?");
		if (chk){
			location.href = 'deleterboard?revIdx='+revIdx;	
		}
	}	
	function modify(revIdx) {
			location.href = '${pageContext.request.contextPath}/review/updateform?revIdx='+revIdx;	
			
	}	
	
	//Controller방식
	//**댓글 목록1
	function listReply(){
		$.ajax({
			type: "get",
			url: "${path}/review/reply?revIdx={rBoard.revIdx}",
			success: function(result){
				//response Text가 result에 저장됨.
				$("#listReply").html(result);
			}
		});
	}
	//RestController방식(Json)
	//**댓글 목록2(json)
	function listReply2(){
		$.ajax({
			type: "get",
			//contentType: "application/json", ==>생략가능 (RestController가 )
			url: "${path}/reviewjson?revIdx=${rBaord.revIdx}",
			success:function(result){
				console.log(result);
				var output = "<table>";
				for(var i in result){
					output +="<tr>";
					output +="<td>" + result[i].userName;
					output +="(" + changeDate(result[i].regdate)+ ")<br>";
					output += result[i].revCmtComment + "</td>" ;
					output +="<tr>";
				}
			output +="</table>";
			$("#listReply").html(output);
			}
		})
	}


	
</script>
</body>
</html>