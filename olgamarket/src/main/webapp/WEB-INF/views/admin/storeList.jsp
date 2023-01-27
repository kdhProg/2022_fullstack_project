<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
a {
	text-decoration: none;
}
</style>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='insertForm']");
			
			// 판매점 등록
			$(".insert_btn").on("click", function(){
				formObj.attr("action", "/admin/storeInsertView");
				formObj.attr("method", "get");
				formObj.submit();				
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
	<br />
	<section id="containers">
		<form name="insertForm" role="form" method="post" action="/admin/storeInsertView">
		<div>
			<table class="table">
				<tr>
					<th>브랜드 No</th>
					<th>브랜드 이름</th>
					<th>연락처</th>
					<th>Email</th>
				</tr>
				<c:forEach var="list" items="${storeList}">
					<tr>
						<td><a href="/admin/storeOne?stlNo=${list.getStlNo()}" class="btn btn-danger">${list.getStlNo()}</a></td>
						<td>${list.getStlBrandName()}</td>
						<td>${list.getStlPhone()}</td>
						<td>${list.getStlEmail()}</td>
					</tr>
				</c:forEach>
			</table>
			<!-- 페이징 -->
			<div class="col-md-offset-3">
				<ul class="pagination">
					<c:if test="${pageInfo.xprev}">
						<li><a href="/admin/storeList?showPage=${pageInfo.firstPageNoOnPageList-1 }">[prev]</a></li>
					</c:if>
					<c:forEach var="loopPage" begin="${pageInfo.firstPageNoOnPageList }" end="${pageInfo.lastPageNoOnPageList }" step="1">
					<c:if test="${loopPage eq currPage}">
						<span>[${loopPage}]&nbsp;&nbsp;&nbsp;</span>
					</c:if>
					<c:if test="${loopPage ne currPage}">
						<span><a href="/admin/storeList?showPage=${loopPage}">[${loopPage}]</a>&nbsp;&nbsp;&nbsp;</span>
					</c:if>
					</c:forEach>
				<c:if test="${pageInfo.xnext}">
					<li><a href="/admin/storeList?showPage=${pageInfo.lastPageNoOnPageList+1 }">[next]</a></li>
				</c:if>
				</ul>
					<div>
						<button type="submit" class="btn btn-outline-danger">판매점 등록</button>
					</div>
			</div>
		</div>
		</form>
	</section>
</div>		
</body>
</html>