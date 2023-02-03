<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
#newPdQuiryOne_npqNo{
	display: none;
}
</style>
<body>
<!-- JS로 npqNO넘기기 -->
<span id="newPdQuiryOne_npqNo">${newPdQuiryOne.npqNo}</span>

<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/storeList">판매점</a>
			<a class="navbar-brand" href="/admin/seller">판매자</a>
			<a class="navbar-brand" href="/admin/product">상품</a>
			<a class="navbar-brand" href="/admin/clientList">고객센터</a>
			<a class="navbar-brand" href="/admin/memberGrade">회원</a>
			<a class="navbar-brand" href="/admin/adminStats">통계</a>	
		</div>
	</nav>
	<br />
	<h3>신상품 등록 문의</h3>
	<section id="container">
		<div>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="npqNo" name="npqNo" value="${newPdQuiryOne.npqNo}" />
			</form>
			<table class="table">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>내용</th>
					<th>상세 이미지</th>
					<th>답변 상태</th>
					<th>등록 날짜</th>
					<th>작성자</th>
				</tr>
				<tr>
					<td>${newPdQuiryOne.npqNo}</td>
					<td>${newPdQuiryOne.npqTitle}</td>
					<td>${newPdQuiryOne.npqContent}</td>
					<td>${newPdQuiryOne.npqImg}</td>
					<td>${newPdQuiryOne.npqState}</td>
					<td>
						<fmt:parseDate value="${newPdQuiryOne.npqUpdDate}" var="npqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${npqUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>${newPdQuiryOne.npqselId}</td>
				</tr>
			</table>
			<br />
	 		<h3>답변</h3>
			<div id="reply">
				<table class="table">
					<tr>
						<th>내용</th>
						<th>작성날짜</th>
					</tr>
					<c:forEach items="${newPdAnList}" var="newPdAnList">
						<tr>
							<td>${newPdAnList.npaContent}</td>
				        	<td>	
				        		<fmt:parseDate value="${newPdAnList.npaUpdDate}" var="npaUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
				        		<fmt:formatDate value="${npaUpdDate}" pattern="yyyy-MM-dd" />
				        	</td>
				     	</tr>
				    </c:forEach>
				 </table>   
			</div>	
			
			<form name="insertForm" method="post" action="/admin/newPdAnswerInsertView?npqNo=${newPdQuiryOne.npqNo}">
				<div>
					<button type="submit" id="registAnswer" class="btn btn-outline-danger">답글 등록</button>
				</div>
			</form>
			<form name="updateForm" method="post" action="/admin/newPdAnswerUpdateView?npqNo=${newPdQuiryOne.npqNo}">
				<div>
					<button type="submit" id="modifyAnswer" class="btn btn-outline-danger">답글 수정</button>
				</div>
			</form>
			<form name="listForm" method="post" action="/admin/seller">
				<div>
					<button type="submit" class="btn btn-outline-danger">목록</button>
				</div>
			</form>	
		</div>
	</section>
</div>
</body>
<script>
let newPdQuiryOne_npqNo = $("#newPdQuiryOne_npqNo").text();

$(document).ready(()=>{
	$.ajax({
		type : "post",
		url : "/admin/chkNpAnswerExists",
		data : {
			npanpqNo : newPdQuiryOne_npqNo
		},
		success : function(result){
			let validation = result;
			if(validation === "exists"){
				// 답변 존재 => 등록 OFF 수정 ON
// 				$("#registAnswer").prop("disabled", true);
				$("#registAnswer").css("display", "none");
			}else{
				// 답변 존재 => 등록 ON 수정 OFF
// 				$("#modifyAnswer").prop("disabled", true);
				$("#modifyAnswer").css("display", "none");
			}
			
		}// success 종료
	}); // ajax 종료	
});
</script>
</html>