<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/storeList">판매점</a>
			<a class="navbar-brand" href="/admin/seller">판매자</a>
			<a class="navbar-brand" href="/admin/product">상품</a>
			<a class="navbar-brand" href="/admin/clientList">고객센터</a>
			<a class="navbar-brand" href="/admin/memberGrade">회원</a>
			<a class="navbar-brand" href="/admin/storeList">통계</a>
		</div>
	</nav>
	<section id="container">
		<form role="form" method="post" action="/admin/storeInsert">
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label for="stlBrandName">브랜드 이름 : </label>
							<input type="text" id="stlBrandName" name="stlBrandName" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlInfo">정보 : </label>
							<textarea id="stlInfo" name="stlInfo" class="form-control"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlPhone">전화번호 : </label>
							<input type="text" id="stlPhone" name="stlPhone" class="form-control"/>
						</td>
					</tr>	
					<tr>
						<td>
							<label for="stlEmail">이메일 : </label>
							<input type="text" id="stlEmail" name="stlEmail" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlMarketUniqueNo">고유번호 : </label>
							<input type="text" id="stlMarketUniqueNo" name="stlMarketUniqueNo" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlSelRegiNo">사업자등록번호 : </label>
							<input type="text" id="stlSelRegiNo" name="stlSelRegiNo" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="btn btn-outline-danger">등록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>	
	</section>
</div>	
</body>
</html>