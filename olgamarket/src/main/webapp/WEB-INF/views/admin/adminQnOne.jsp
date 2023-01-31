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
<body>
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
	<h3>1 대 1 문의</h3>
	<section id="container">
		<div>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="otqNo" name="otqNo" value="${adminQnOne.otqNo}" />
			</form>
			<table class="table">
				<tr>
					<th>No</th>
					<th>메인 카테고리</th>
					<th>서브 카테고리</th>
					<th>제목</th>
					<th>내용</th>
					<th>답변 상태</th>
					<th>등록 날짜</th>
					<th>수정 날짜</th>
					<th>작성자</th>
				</tr>
				<tr>
					<td>${adminQnOne.otqNo}</td>
					<td>${adminQnOne.otqMainCategory}</td>
					<td>${adminQnOne.otqSubCategory}</td>
					<td>${adminQnOne.otqTitle}</td>
					<td>${adminQnOne.otqContent}</td>
					<td>${adminQnOne.otqState}</td>
				  	<td>
				  		<fmt:parseDate value="${adminQnOne.otqRegiDate}" var="otqRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${otqRegiDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>
						<fmt:parseDate value="${adminQnOne.otqUpdDate}" var="otqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${otqUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>${adminQnOne.otqmemId}</td>
				</tr>
			</table>
			<br />
			<h3>답변</h3>
	 		<table class="table">
	 			<tr>
					<th>작성자</th>
					<th>메인 카테고리</th>
					<th>서브 카테고리</th>
					<th>제목</th>
					<th>답변내용</th>
					<th>작성날짜</th>
				</tr>
	 			<c:forEach items="${adminAnList}" var="adminAnList">
					<tr>
						<td>${adminAnList.otaadmId}</td>
						<td>${adminAnList.otaMainCategory}</td>
						<td>${adminAnList.otaSubCategory}</td>
						<td>${adminAnList.otaTitle}</td>
						<td>${adminAnList.otaContent}</td>
						<td>
				        	<fmt:parseDate value="${adminAnList.otaUpdDate}" var="otaUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
				        	<fmt:formatDate value="${otaUpdDate}" pattern="yyyy-MM-dd" />
						</td>
					</tr> 
				</c:forEach>  
			</table>
			<form name="insertForm" method="post" action="/admin/anInsertView?otqNo=${adminQnOne.otqNo}">
				<div>
					<button type="submit" class="btn btn-outline-danger">답글 등록</button>
				</div>
			</form>	
			<form name="updateForm" method="post" action="/admin/anUpdateView?otqNo=${adminQnOne.otqNo}">
				<div>
					<button type="submit" class="btn btn-outline-danger">답글 수정</button>
				</div>
			</form>	
			<form name="listForm" method="post" action="/admin/clientList">
				<div>
					<button type="submit" class="btn btn-outline-danger">목록</button>
				</div>
			</form>	
		</div>
	</section>
</div>
</body>
</html>