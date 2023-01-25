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
<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/productList";
			})
		})
	
</script>
<body>
<section id="container">
	<form name="updateForm" role="form" method="post" action="/admin/productUpdate">
		<input hidden="hidden" name="pdId" value="${update.pdId}" readonly="readonly" />
		<table>
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
						<input type="text" id="pdThumbImg" name="pdThumbImg" value="${update.pdThumbImg}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdName">상품 이름</label>
						<input type="text" id="pdName" name="pdName" value="${update.pdName}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdStorageType">보관 방법</label>
						<input type="text" id="pdStorageType" name="pdStorageType" value="${update.pdStorageType}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdUnit">구성 단위</label>
						<input type="text" id="pdUnit" name="pdUnit" value="${update.pdUnit}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdWeight">단위 무게</label>
						<input type="text" id="pdWeight" name="pdWeight" value="${update.pdWeight}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdCountry">원산지</label>
						<input type="text" id="pdCountry" name="pdCountry" value="${update.pdCountry}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdBBE">유통기한</label>
						<input type="text" id="pdBBE" name="pdBBE" value="${update.pdBBE}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdDesInfoImg">상품 정보 이미지</label>
						<input type="text" id="pdDesInfoImg" name="pdDesInfoImg" value="${update.pdDesInfoImg}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdPrice">상품 가격</label>
						<input type="text" id="pdPrice" name="pdPrice" value="${update.pdPrice}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdSale">할인</label>
						<input type="text" id="pdSale" name="pdSale" value="${update.pdSale}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdStock">재고</label>
						<input type="text" id="pdStock" name="pdStock" value="${update.pdStock}" />
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<button type="submit" class="update_btn">저장</button>
			<button type="submit" class="cancel_btn">취소</button>
		</div>
	</form>
</section>
</body>
</html>