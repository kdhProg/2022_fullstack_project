<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<a class="navbar-brand" href="/admin/storeList">통계</a>
		</div>
	</nav>
	<section id="container">
		<form role="form" method="post"  action="/admin/anInsert">
			<input type="hidden" value="${anIn.otqNo}" id="otqNo" name="otaotqNo" />
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label for="otaMainCategory">메인 카테고리 : </label>
							<input type="text" id="otaMainCategory" name="otaMainCategory" value="${anIn.otqMainCategory}" readonly="readonly" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="otaSubCategory">서브 카테고리 : </label>
							<input type="text" id="otaSubCategory" name="otaSubCategory" value="${anIn.otqSubCategory}" readonly="readonly" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="otaTitle">제목 : </label>
							<input type="text" id="otaTitle" name="otaTitle" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="otaContent">내용 : </label>
							<textarea id="otaContent" name="otaContent" class="form-control"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="otaadmId">작성자 : </label>
							<input type="text" id="otaadmId" name="otaadmId" value="${admin.getAdmId()}" readonly="readonly" class="form-control"/>
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