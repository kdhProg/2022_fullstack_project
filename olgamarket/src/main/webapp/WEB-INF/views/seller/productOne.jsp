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
#selListBt, #sqListBt{
	text-decoration: none;
}
.sessionSelId, .sessionBrandName, .sessionpdSelId{
	display: none;
}
a {
	text-decoration: none;
}
.nav_homeBtn{
	border: none;
	background: transparent;
}

</style>
<body>
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
		<div>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="pdId" name="pdId" value="${productOne.pdId}" />
			</form>
			<br />
			<h3>상품</h3>
			<table class="table">
				<tr>
					<th>Id</th>
					<th>썸네일 이미지</th>
					<th>상품 이름</th>
					<th>메인 카테고리</th>
					<th>서브 카테고리</th>
					<th>브랜드 이름</th>
					<th>보관 방법</th>
					<th>구성 단위</th>
					<th>단위 무게</th>
					<th>원산지</th>
					<th>유통기한</th>
					<th>상품 정보 이미지</th>
					<th>계절</th>
					<th>조회수</th>
					<th>판매량</th>
					<th>가격</th>
					<th>할인</th>
					<th>재고</th>
					<th>등록 날짜</th>
					<th>수정 날짜</th>
				</tr>
				<tr>
					<td>${productOne.pdId}</td>
					<td>${productOne.pdThumbImg}</td>
					<td>${productOne.pdName}</td>
					<td>${productOne.pdMainCategory}</td>
					<td>${productOne.pdSubCategory}</td>
					<td>${productOne.pdstlBrandName}</td>
					<td>${productOne.pdStorageType}</td>
					<td>${productOne.pdUnit}</td>
					<td>${productOne.pdWeight}</td>
					<td>${productOne.pdCountry}</td>
					<td>${productOne.pdBBE}</td>
					<td>${productOne.pdDesInfoImg}</td>
					<td>${productOne.pdSeason}</td>
					<td>${productOne.pdHits}</td>
					<td>${productOne.pdSalesVolume}</td>
					<td>${productOne.pdPrice}</td>
					<td>${productOne.pdSale}</td>
					<td>${productOne.pdStock}</td>
				  	<td>
				  		<fmt:parseDate value="${productOne.pdRegiDate}" var="pdRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${pdRegiDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>
						<fmt:parseDate value="${productOne.pdUpdDate}" var="pdUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${pdUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
			</table>
			<br />
			<h3>문의 목록</h3>
			<table class="table">
				<tr>
					<th>상품 Id</th>
					<th>No</th>
					<th>제목</th>
					<th>답변 상태</th>
					<th>등록일</th>				
				</tr>
				<c:forEach var="list" items="${selQnList}">
					<tr>
						<td>${list.getSqpdId()}</td>
						<td><a class="btn btn-danger" href="/seller/selQuiryOne?sqNo=${list.getSqNo()}">${list.getSqNo()}</a></td>
						<td>${list.getSqTitle()}</td>
						<td>${list.getSqState()}</td>
						<td>
							<fmt:parseDate value="${list.getSqRegiDate()}" var="sqRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${sqRegiDate}" pattern="yyyy.MM.dd"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<form name="insertForm" action="/seller/selQuiryInsertView">
				<input type="hidden" id="selId" name="selId" value="${slId.selId}" />
				<input type="hidden" id="pdId" name="pdId" value="${productOne.pdId}" />
				<div>
					<button type="submit" class="btn btn-outline-danger">문의 글 작성</button>
	
				</div>
			</form>
			<form name="listForm" action="/seller/product">
				<div>
					<button type="submit" class="btn btn-outline-danger">목록</button>
				</div>
			</form>	
			
		</div>
	</section>
</div>	
</body>
</html>