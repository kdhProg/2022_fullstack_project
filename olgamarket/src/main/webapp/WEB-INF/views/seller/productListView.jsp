<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<body>
<div class="container">
<!-- 상품 클릭시 상품 디테일 페이지로 넘어가게 만들기 -->
	<table class="table">
		<tr>
			<th>상품 Id</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>할인율</th>
			<th>조회수</th>
			<th>판매량</th>
		</tr>
		<c:forEach var="list" items="${pdList}">
			<tr>
				<td>${list.getPdId()}</td>
				<td>${list.getPdName()}</td>
				<td>${list.getPdPrice()}</td>
				<td>${list.getPdSale()}</td>
				<td>${list.getPdHits()}</td>
				<td>${list.getPdSalesVolume()}</td>
			</tr>
		</c:forEach>
	</table>
</div>	
</body>
</html>