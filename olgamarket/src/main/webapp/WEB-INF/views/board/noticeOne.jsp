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
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/client";
			})
		})
	</script>
<body>
<section id="container">
	<div>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="ntNo" name="ntNo" value="${noticeOne.ntNo}" />
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
				<td>${noticeOne.ntNo}</td>
				<td>${noticeOne.ntCategory}</td>
				<td>${noticeOne.ntTitle}</td>
				<td>${noticeOne.ntContent}</td>
			  	<td>
			  		<fmt:parseDate value="${noticeOne.ntRegiDate}" var="ntRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${ntRegiDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>
					<fmt:parseDate value="${noticeOne.ntUpdDate}" var="ntUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${ntUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>${noticeOne.ntadmId}</td>
			</tr>
		</table>
		<div>
			<button type="submit" class="list_btn">목록</button>
		</div>
	</div>
</section>

</body>
</html>