<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/admin/productUpdateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/admin/productDelete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/admin/productList";
			})
		})
	</script>
<body>
<section id="container">
	<div>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="pdId" name="pdId" value="${productOne.pdId}" />
		</form>
		<table>
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
		<div>
			<button type="submit" class="update_btn">수정</button>
			<button type="submit" class="delete_btn">삭제</button>
			<button type="submit" class="list_btn">목록</button>
		</div>
	</div>
</section>
</body>
</html>