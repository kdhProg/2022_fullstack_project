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
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/clientList";
			})
		})
	
	</script>
<body>
<section id="container">
	<form name="updateForm" role="form" method="post" action="/admin/faqUpdate">
		<input type="hidden" name="faqNo" value="${update.faqNo}" readonly="readonly" />
		<table>
			<tbody>
				<tr>
					<td>No : ${update.faqNo}</td>
				</tr>
				<tr>
					<td>
						<label for="faqCategory">카테고리</label>
						<input type="text" id="faqCategory" name="faqCategory" value="${update.faqCategory}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="faqTitle">제목</label>
						<input type="text" id="faqTitle" name="faqTitle" value="${update.faqTitle}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="faqContent">내용</label>
						<textarea id="faqContent" name="faqContent"><c:out value="${update.faqContent}" /></textarea>
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