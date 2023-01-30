<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script type="text/javascript">
		$(document).ready(function(){
			
			$("#cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/productList";
			})
		})
	
</script>
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
		<form name="updateForm" role="form" method="post" action="/admin/productUpdate">
			<input hidden="hidden" name="pdId" value="${update.pdId}" readonly="readonly" />
			<table class="table">
				<tbody>
					<tr>
						<td>상품 번호 : ${update.pdId} </td>
					</tr>
					<tr>
						<td>브랜드 이름 : ${update.pdstlBrandName} </td>
					</tr>
					<tr>
						<td>
							<label for="pdThumbImg">썸네일</label>
							<input type="text" id="pdThumbImg" name="pdThumbImg" value="${update.pdThumbImg}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdName">상품 이름</label>
							<input type="text" id="pdName" name="pdName" value="${update.pdName}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdStorageType">보관 방법 : </label>
							<select name="pdStorageType" required="required">
								<option value="">선택하세요.</option>
								<option value="냉동">냉동</option>
								<option value="냉장">냉장</option>
								<option value="상온">상온</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdUnit">구성 단위 : </label>
							<select name="pdUnit" required="required">
								<option value="">1개 기준</option>
								<option value="박스">박스</option>
								<option value="팩">팩</option>
								<option value="봉지">봉지</option>
								<option value="낱개">낱개</option>
								<option value="세트">세트</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdWeight">단위 무게</label>
							<input type="text" id="pdWeight" name="pdWeight" value="${update.pdWeight}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdCountry">원산지</label>
							<input type="text" id="pdCountry" name="pdCountry" value="${update.pdCountry}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdBBE">유통기한</label>
							<input type="text" id="pdBBE" name="pdBBE" value="${update.pdBBE}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdDesInfoImg">상품 정보 이미지</label>
							<input type="text" id="pdDesInfoImg" name="pdDesInfoImg" value="${update.pdDesInfoImg}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdPrice">상품 가격</label>
							<input type="text" id="pdPrice" name="pdPrice" value="${update.pdPrice}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdSale">할인</label>
							<input type="text" id="pdSale" name="pdSale" value="${update.pdSale}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdStock">재고</label>
							<input type="text" id="pdStock" name="pdStock" value="${update.pdStock}" class="form-control"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="submit" id="update_btn" class="btn btn-outline-danger">저장</button>
				<button type="submit" id="cancel_btn" class="btn btn-outline-danger">취소</button>
			</div>
		</form>
	</section>
</div>	
</body>
</html>