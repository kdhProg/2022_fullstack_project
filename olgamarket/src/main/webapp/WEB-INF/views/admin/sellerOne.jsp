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
#pdList{
	margin : 50px 50px 50px 0px;
}
#selOne_selGrade{
	display:none;
}
.nav_homeBtn{
	border: none;
	background: transparent;
}
</style>
<body>
<!-- JS로 selOne.selGrade 넘기기-->
<span id="selOne_selGrade">${selOne.selTypeGrade}</span>

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
				<h1>셀러 관리</h1>
			</div>
		</div>
	<br />
	<section id="container">
		<div>
		<h3>판매자</h3>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="selId" name="selId" value="${selOne.selId}" />
			</form>
			<table class="table">
				<tr>
					<th>Id</th>
					<th>이름</th>
					<th>상호명</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>마켓 고유 번호</th>
					<th>사업자 등록 번호</th>
					<th>판매자 권한</th>
					<th>가입 일자</th>
				</tr>
				<tr>
					<td>${selOne.selId}</td>
					<td>${selOne.selName}</td>
					<td>${selOne.selstlBrandName}</td>
					<td>${selOne.selEmail}</td>
					<td>${selOne.selPhone}</td>
					<td>${selOne.selAddress}</td>
					<td>${selOne.selMarketUniqueNo}</td>
					<td>${selOne.selSelRegiNo}</td>
					<td>
						<c:set value="${selOne.selTypeGrade}" var="grade" /> 
						<c:if test="${grade eq 1}">
							<span style="color : green;">셀러</span>
						</c:if>	
						<c:if test="${grade eq 0}">
							<span>일반</span>
						</c:if>					
					</td>
				  	<td>
				  		<fmt:parseDate value="${selOne.selRegiDate}" var="selRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${selRegiDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
			</table >
			
			
			<h3>상품 목록</h3>
	 		<table class="table" id="pdList">
	 		<tr>
				<th>ID</th>
				<th>썸네일</th>
				<th>상품 이름</th>
				<th>메인 카테고리</th>
				<th>서브 카테고리</th>
				<th>상호명</th>
				<th>보관 방법</th>
				<th>상품 단위</th>
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
			</tr>
	 		<c:forEach var="list" items="${pdList}">
				<tr>
					<td><a href="/admin/productOne?pdId=${list.getPdId()}" class="btn btn-danger">${list.getPdId()}</a></td>
	 				<td>${list.getPdThumbImg()}</td>
	 				<td>${list.getPdName()}</td>
	 				<td>${list.getPdMainCategory()}</td>
	 				<td>${list.getPdSubCategory()}</td>
	 				<td>${list.getPdstlBrandName()}</td>
	 				<td>${list.getPdStorageType()}</td>
	 				<td>${list.getPdUnit()}</td>
	 				<td>${list.getPdWeight()}</td>
	 				<td>${list.getPdCountry()}</td>
	 				<td>${list.getPdBBE()}</td>
	 				<td>${list.getPdDesInfoImg()}</td>
	 				<td>${list.getPdSeason()}</td>
	 				<td>${list.getPdHits()}</td>
	 				<td>${list.getPdSalesVolume()}</td>
	 				<td>${list.getPdPrice()}</td>
	 				<td>${list.getPdSale()}</td>
	 				<td>${list.getPdStock()}</td>
	 				<td>${list.getPdUpdDate()}</td>
				</tr>
			</c:forEach>
	 		</table>
			<form name="readForm" method="post" action="/admin/sellerGrantView?selId=${selOne.selId}">
				<div>
					<button type="submit" id="revokeGrade" class="btn btn-outline-danger">권한 회수</button>
				</div>
			</form>
			<form name="readForm" method="post" action="/admin/sellerGrantView?selId=${selOne.selId}">
				<div>
					<button type="submit" id="grantGrade" class="btn btn-outline-danger">권한 복원</button>
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
let selOne_selGrade = $("#selOne_selGrade").text();

if(selOne_selGrade === '1'){
	// 권한이 1인경우 => 회수가능
	$("#grantGrade").css("display","none");
}else{
	// 권한이 0인경우 => 복원가능
	$("#revokeGrade").css("display","none");
}
</script>
</html>