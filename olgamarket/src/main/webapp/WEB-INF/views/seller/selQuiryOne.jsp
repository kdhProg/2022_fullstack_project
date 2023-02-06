<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Seller</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
#selQuiryOne_sqNo{
	display: none;
}
.nav_homeBtn{
	border: none;
	background: transparent;
}

</style>
<body>
<!-- JS로 sqNo넘기기 -->
<span id="selQuiryOne_sqNo">${selQuiryOne.sqNo}</span>

<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/seller/newPdQuiry">신상품 등록</a>
			<a class="navbar-brand" href="/seller/product">내 상품 문의</a>
			<a class="navbar-brand" href="">통계</a>
			<a class="navbar-brand" href="/seller/sellerMain"><svg class="nav_homeBtn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg></a>
		</div>
	</nav>
	<section id="container">
		<br />
			<div class="row">
				<div class="col text-center"> 
					<h1>내 상품 문의</h1>
				</div>
			</div>
		<br />
		<div>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="sqNo" name="sqNo" value="${selQuiryOne.sqNo}" />
			</form>
			<br />
			<h3>상품</h3>
			<table class="table">
				<tr>
					<th>No</th>
					<th>상품 Id</th>
					<th>제목</th>
					<th>내용</th>
					<th>답변 상태</th>
					<th>등록 날짜</th>
					<th>작성자</th>
				</tr>
				<tr>
					<td>${selQuiryOne.sqNo}</td>
					<td>${selQuiryOne.sqpdId}</td>
					<td>${selQuiryOne.sqTitle}</td>
					<td>${selQuiryOne.sqContent}</td>
					<td>
						<c:set value="${selQuiryOne.sqState}" var="grade" /> 
						<c:if test="${grade eq 1}">
							<span style="color : green;">답변 완료</span>
						</c:if>	
						<c:if test="${grade eq 0}">
							<span>처리대기중</span>
						</c:if>
					</td>
					<td>
						<fmt:parseDate value="${selQuiryOne.sqUpdDate}" var="sqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${sqUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>${selQuiryOne.sqselId}</td>
				</tr>
			</table>
	 		<br />
			<h3>답변</h3>
			<table class="table">
				<tr>
					<th>답변 내용</th>
					<th>작성 날짜</th>
				</tr>
				<c:forEach items="${selAnList}" var="selAnList">
					<tr>
						<td>${selAnList.saContents}</td>
						<td>
				        	<fmt:parseDate value="${selAnList.saUpdDate}" var="saUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
				        	<fmt:formatDate value="${saUpdDate}" pattern="yyyy-MM-dd" />
			      		</td>
			     	 </tr>
			    </c:forEach>   
			</table>
			<form name="updateForm" method="post" action="/seller/sqlQuiryUpdateView">
			<input type="hidden" name="sqNo" value="${selQuiryOne.sqNo}" />
				<div>
					<button type="submit" id="modifyBtn" class="btn btn-outline-danger">수정</button>
				</div>
			</form>	
			<form name="deleteForm" method="post" action="/seller/sqlQuiryDelete">
			<input type="hidden" name="sqNo" value="${selQuiryOne.sqNo}" />
				<div>
					<button type="submit" id="deleteBtn" class="btn btn-outline-danger">삭제</button>
				</div>
			</form>
			<form name="listForm" method="post" action="/seller/product">
				<div>
					<button type="submit" class="btn btn-outline-danger">목록</button>
				</div>
			</form>	
		</div>
	</section>
</div>
</body>
<script>

let selQuiryOne_sqNo = $("#selQuiryOne_sqNo").text();

$(document).ready(()=>{
	$.ajax({
		type : "post",
		url : "/admin/chkSaAnswerExists",
		data : {
			sasqNo : selQuiryOne_sqNo
		},
		success : function(result){
			let validation = result;
			if(validation === "exists"){
				// 답변 존재 => 수정/삭제 NO
				$("#modifyBtn").css("display", "none");
				$("#deleteBtn").css("display", "none");
			}
			
		}// success 종료
	}); // ajax 종료	
});
</script>
</html>