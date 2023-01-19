<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/clientList";
			})
		})
	
	</script>
<body>
<section id="container">
	<form name="updateForm" role="form" method="post" action="/admin/noticeUpdate">
		<input type="hidden" name="ntNo" value="${update.ntNo}" readonly="readonly" />
		<table>
			<tbody>
				<tr>
					<td>No : ${update.ntNo}</td>
				</tr>
				<tr>
					<td>
						<label for="ntCategory">카테고리</label>
						<input type="text" id="ntCategory" name="ntCategory" value="${update.ntCategory}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="ntTitle">제목</label>
						<input type="text" id="ntTitle" name="ntTitle" value="${update.ntTitle}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="ntContent">내용</label>
						<textarea id="ntContent" name="ntContent"><c:out value="${update.ntContent}" /></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="ntUpdDate">수정 날짜</label> 
						<fmt:parseDate value="${update.ntUpdDate}" var="ntUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${ntUpdDate}" pattern="yyyy.MM.dd"/>
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