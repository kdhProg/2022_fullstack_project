<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<section id="container">
		<div>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="selId" name="memId" value="${adminMemOne.memId}" />
			</form>
			<table class="table">
				<tr>
					<th>회원 Id</th>
					<th>이름</th>
					<th>회원 등급</th>
				</tr>
				<tr>
					<td>${adminMemOne.memId}</td>
					<td>${adminMemOne.memName}</td>
					<td>${adminMemOne.memGrade}</td>
				</tr>
			</table>
			<form name="readForm" method="post" action="/admin/memGradeUpdateView?memId=${adminMemOne.memId}">
				<div>
					<button type="submit" class="btn btn-outline-danger">등급 변경</button>
				</div>
			</form>		
			<form name="listForm" method="post" action="/admin/memberGrade">
				<div>
					<button type="submit" class="btn btn-outline-danger">목록</button>
				</div>
			</form>	
		</div>
	</section>
</div>
</body>
</body>
</html>