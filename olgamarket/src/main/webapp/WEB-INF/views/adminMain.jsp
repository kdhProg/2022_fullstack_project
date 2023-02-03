<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Admin</title>
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
	<!-- 판매점 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">판매점</h5>
			<p class="card-text">판매점 추가 / 판매점 정보 수정</p>
			<a href="/admin/storeList" class="btn btn-primary">판매점 관리하러 가기</a>
		</div>
	</div>
	<!-- 판매자 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">판매자</h5>
			<p class="card-text">판매자 목록 / 신상품 등록 문의 / 판매자 문의</p>
			<a href="/admin/seller" class="btn btn-primary">판매점 관리하러 가기</a>
		</div>
	</div>
	<!-- 상품 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">상품</h5>
			<p class="card-text">상품 목록 / 상품 문의</p>
			<a href="/admin/product" class="btn btn-primary">판매점 관리하러 가기</a>
		</div>
	</div>
	<!-- 고객센터 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">고객센터</h5>
			<p class="card-text">공지사항 / FAQ / 1 대 1 문의</p>
			<a href="/admin/clientList" class="btn btn-primary">고객센터 관리하러 가기</a>
		</div>
	</div>
	<!-- 회원 등급 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">회원 관리</h5>
			<p class="card-text">회원 등급 조정</p>
			<a href="/admin/memberGrade" class="btn btn-primary">회원등급 관리하러 가기</a>
		</div>
	</div>
	<!-- 통계 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">통계</h5>
			<p class="card-text">방문자 / 판매량 / 매출액</p>
			<a href="/admin/adminStats" class="btn btn-primary">통계 보러 가기</a>
		</div>
	</div>
	
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title"></h5>
			<p class="card-text"></p>
			<a href="/adminLogout" class="btn btn-danger">로그아웃</a>
		</div>
	</div>
</div>
</body>

</html>