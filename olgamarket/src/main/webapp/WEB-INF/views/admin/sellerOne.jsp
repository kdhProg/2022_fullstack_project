<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>

<body>
<section id="container">
	<div>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="selId" name="selId" value="${selOne.selId}" />
		</form>
		<table>
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
				<td>${selOne.selTypeGrade}</td>
			  	<td>
			  		<fmt:parseDate value="${selOne.selRegiDate}" var="selRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${selRegiDate}" pattern="yyyy.MM.dd"/>
				</td>
			</tr>
		</table>
 		<table>
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
				<td><a href="/admin/productOne?pdId=${list.getPdId()}">${list.getPdId()}</a></td>
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
				<button type="submit" class="selUpdate_btn">권한 회수</button>
			</div>
		</form>		
		<form name="listForm" method="post" action="/admin/seller">
			<div>
				<button type="submit" class="list_btn">목록</button>
			</div>
		</form>	
	</div>
</section>

</body>

<script type="text/javascript">
	// 권한 회수
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			$(".selUpdate_btn").on("click", function(){
				formObj.attr("action", "/admin/sellerGrantView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
		})
		
		// 목록
		$(document).ready(function(){
			var formObj = $("form[name='listForm']");
			$(".list_btn").on("click", function(){
				location.href = "/admin/seller";
			})
		})
		
		
</script>
</html>