<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				formObj.attr("action", "/admin/storeUpdateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/admin/storeDelete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/admin/storeList";
			})
		})
	</script>
<body>
<section id="container">
	<div>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="stlNo" name="stlNo" value="${storeOne.stlNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>정보</th>
				<th>브랜드 번호</th>
				<th>브랜드 이메일</th>
				<th>고유 번호</th>
				<th>사업자 등록 번호</th>
				<th>입점 날짜</th>
				<th>정보 수정 날짜</th>
			</tr>
			<tr>
				<td>${storeOne.stlNo}</td>
				<td>${storeOne.stlBrandName}</td>
				<td>${storeOne.stlInfo}</td>
				<td>${storeOne.stlPhone}</td>
				<td>${storeOne.stlEmail}</td>
				<td>${storeOne.stlMarketUniqueNo}</td>
				<td>${storeOne.stlSelRegiNo}</td>
			  	<td>
			  		<fmt:parseDate value="${storeOne.stlRegiDate}" var="stlRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${stlRegiDate}" pattern="yyyy.MM.dd"/>
			  		
				</td>
				<td>
					
					<fmt:parseDate value="${storeOne.stlUpdDate}" var="stlUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${stlUpdDate}" pattern="yyyy.MM.dd"/>
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