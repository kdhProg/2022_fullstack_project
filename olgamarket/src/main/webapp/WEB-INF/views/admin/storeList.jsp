<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<style>
a {
	text-decoration: none;
}
.nav_homeBtn{
	border: none;
	background: transparent;
}
.button{
	
}
</style>
<body>
<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/storeList">스토어 관리</a>
			<a class="navbar-brand" href="/admin/seller">셀러 관리</a>
			<a class="navbar-brand" href="/admin/product">상품 관리</a>
			<a class="navbar-brand" href="/admin/clientList">고객센터 관리</a>
			<a class="navbar-brand" href="/admin/memberGrade">회원 등급 관리</a>
			<a class="navbar-brand" href="/admin/adminStats">통계</a>
			<a class="navbar-brand" href="/admin/enterAdminMain"><svg class="nav_homeBtn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg></a>
		</div>
	</nav>
	<br />
		<div class="row">
			<div class="col text-center"> 
				<h1>스토어 관리</h1>
			</div>
		</div>
	<br />
	<section id="containers">
		<form name="insertForm" role="form" method="post" action="/admin/storeInsertView">
		<div>
			<div class="row">
				<div class="col text-end">
					<button type="submit" class="btn btn-outline-danger">판매점 등록</button>
				</div>
			</div>
			<table class="table">
				
				<tr>
					<th>브랜드 No</th>
					<th>브랜드 이름</th>
					<th>연락처</th>
					<th>Email</th>
			<!-- 	<th>사업장 주소</th> -->
				</tr>
				<c:forEach var="list" items="${storeList}">
					<tr>
						<td><a href="/admin/storeOne?stlNo=${list.getStlNo()}" class="btn btn-danger">${list.getStlNo()}</a></td>
						<td>${list.getStlBrandName()}</td>
						<td>${list.getStlPhone()}</td>
						<td>${list.getStlEmail()}</td>
				<!-- 	<td>${storeOne.stlAddress}</td> -->
					</tr>
				</c:forEach>
			</table>
			<!-- 페이징 -->
			<div class="col-md-offset-3">
				<ul class="pagination">
					<c:if test="${pageInfo.xprev}">
						<li><a href="/admin/storeList?showPage=${pageInfo.firstPageNoOnPageList-1 }">[prev]</a></li>
					</c:if>
					<c:forEach var="loopPage" begin="${pageInfo.firstPageNoOnPageList }" end="${pageInfo.lastPageNoOnPageList }" step="1">
					<c:if test="${loopPage eq currPage}">
						<span>[${loopPage}]&nbsp;&nbsp;&nbsp;</span>
					</c:if>
					<c:if test="${loopPage ne currPage}">
						<span><a href="/admin/storeList?showPage=${loopPage}">[${loopPage}]</a>&nbsp;&nbsp;&nbsp;</span>
					</c:if>
					</c:forEach>
				<c:if test="${pageInfo.xnext}">
					<li><a href="/admin/storeList?showPage=${pageInfo.lastPageNoOnPageList+1 }">[next]</a></li>
				</c:if>
				</ul>
					
			</div>
		</div>
		</form>
	</section>
</div>		
</body>
</html>