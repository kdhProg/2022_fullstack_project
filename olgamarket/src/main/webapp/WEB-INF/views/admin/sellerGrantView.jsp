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
				location.href = "/admin/seller";
			})
		})
	
	</script>
<body>
<section id="container">
	<form name="updateForm" role="form" method="post" action="/admin/sellerGrant">
		<input type="hidden" name="selId" value="${selUp.selId}" readonly="readonly" />
		<table>
			<tbody>
				<tr>
					<td>No : ${selUp.selId}</td>
				</tr>
				<tr>
					<td>
						<label for="selUpdDate">수정 날짜</label> 
						<fmt:parseDate value="${selUp.selUpdDate}" var="selUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${selUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<button type="submit" class="update_btn">권한 회수</button>
			<button type="submit" class="cancel_btn">취소</button>
		</div>
	</form>
</section>
</body>
</html>