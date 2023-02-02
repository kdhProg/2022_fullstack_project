<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Seller</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.card{
	margin : 40px;
}
</style>
<body>
<div class="container">
	<!-- 신상품 등록 문의 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">신상품 등록</h5>
			<p class="card-text">신상품 등록 문의</p>
			<a href="/seller/newPdQuiry" class="btn btn-primary">신상품 등록 문의하러 가기</a>
		</div>
	</div>
	<!-- 등록 상품 문의 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">등록 상품 문의</h5>
			<p class="card-text">등록 상품 목록 / 등록 상품 문의</p>
			<a href="/seller/product" class="btn btn-primary">등록 상품 문의하러 가기</a>
		</div>
	</div>
	<!-- 통계 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">통계</h5>
			<p class="card-text"></p>
			<a href="" class="btn btn-primary">통계 보러 가기</a>
		</div>
	</div>
</div>
</body>

</html>