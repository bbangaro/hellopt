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
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid red;
		font-weight: bold;
		color: white;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid red;
		padding: 3px 7px;
		background-color: red;
	}
	.paging li a:hover {
		background-color: red;
		color: black;
	}
</style>
</head>
<body>



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

</div>	
<%@ include file="/WEB-INF/include/include-body.jsp" %>	
<script>

//댓글작성하기
function createCmt(revIdx) {
      console.log(revIdx)
      var revCmtComment=$("$()").val();
      console.log(revCmtComment);
      var param="revCmtComment=" + revCmtComment + "&revIdx=" + revIdx;
      console.log(param);
      $.ajax({
         type:"post",
         url: "reply/insert",
         data: param,
         success: function(e){
            listReply2(revIdx);
            alert("댓글이 등록되었습니다.");
         }
      });
   }
	 
	 $(function(){
		listReply2(); 
	 })
	 
	//게시글 수정 삭제 시작
	function del(revIdx) {
		var chk = confirm("정말 삭제 하시겠습니까?");
		if (chk){
			location.href = 'deleterboard?revIdx='+revIdx;	
		}
	}	
	function modify(revIdx) {
			location.href = '${pageContext.request.contextPath}/review/updateform?revIdx='+revIdx;	
			
	}	
	//게시글 수정삭제 끝
	
	//Controller방식
	//**댓글 목록1
	function listReply(revIdx){
		$.ajax({
			type:"get",
			url: "review/replylist?revIdx="+revIdx,
			sucess: function(result){
				alert("리스트 리플라이 댓글1")
				$(".listReply").html(result);
				
			}
		})
	}

	//RestController방식(Json)
	//**댓글 목록2(json)
	function listReply2(revIdx){
		$.ajax({
			type: "get",
			//contentType: "application/json", ==>생략가능 (RestController가 )
			url: "review/replyjson?revIdx="+revIdx,
			success:function(result){
				console.log(result);
				var output = "<table>";
				for(var i in result){
					output +="<tr>";
					output +="<td>" + result[i].userName;
					output +="(" + result[i].revCmtRegdate+")<br>";
					output += result[i].revCmtComment + "</td>" ;
					output +="<tr>";
				}
				output +="</table>";
				alert("댓글목록2")
				$(".listReply").html(output);
			}
		});
	}
</script>
</body>
</html>