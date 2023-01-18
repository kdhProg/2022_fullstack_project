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
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/admin/faqUpdateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/admin/faqDelete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/admin/clientList";
			})
		})
	</script>
<body>
<section id="container">
	<div>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="faqNo" name="faqNo" value="${faqOne.faqNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>내용</th>
				<th>등록 날짜</th>
				<th>수정 날짜</th>
				<th>작성자</th>
			</tr>
			<tr>
				<td>${faqOne.faqNo}</td>
				<td>${faqOne.faqCategory}</td>
				<td>${faqOne.faqTitle}</td>
				<td>${faqOne.faqContent}</td>
			  	<td>
			  		<fmt:parseDate value="${faqOne.faqRegiDate}" var="faqRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${faqRegiDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>
					<fmt:parseDate value="${faqOne.faqUpdDate}" var="faqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${faqUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>${faqOne.faqadmId}</td>
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