<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<section id="container">
<form name="insertForm" role="form" method="post" action="/admin/storeInsertView">
<div>
	<table>
		<tr>
			<th>브랜드 No</th>
			<th>브랜드 이름</th>
			<th>연락처</th>
			<th>Email</th>
		</tr>
		<c:forEach var="list" items="${storeList}">
			<tr>
				<td><a href="/admin/storeOne?stlNo=${list.getStlNo()}">${list.getStlNo()}</a></td>
				<td>${list.getStlBrandName()}</td>
				<td>${list.getStlPhone()}</td>
				<td>${list.getStlEmail()}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<c:if test="${pageInfo.xprev}">
		<a
			href="/admin/storeList?showPage=${pageInfo.firstPageNoOnPageList-1 }">[prev]</a>
	</c:if>
	<c:forEach var="loopPage" begin="${pageInfo.firstPageNoOnPageList }"
		end="${pageInfo.lastPageNoOnPageList }" step="1">
		<c:if test="${loopPage eq currPage}">
			<span>[${loopPage}]&nbsp;&nbsp;&nbsp;</span>
		</c:if>
		<c:if test="${loopPage ne currPage}">
			<span><a
				href="/admin/storeList?showPage=${loopPage}">[${loopPage}]</a>&nbsp;&nbsp;&nbsp;</span>
		</c:if>
	</c:forEach>
	<c:if test="${pageInfo.xnext}">
		<a
			href="/admin/storeList?showPage=${pageInfo.lastPageNoOnPageList+1 }">[next]</a>
	</c:if>
		<div>
			<button type="submit" class="insert_btn">판매점 등록</button>
		</div>
	</div>
	</form>
</section>		
</body>
</html>