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
				location.href = "/admin/storeList";
			})
		})
	
	</script>
<body>
<section id="container">
	<form name="updateForm" role="form" method="post" action="/admin/storeUpdate">
		<input type="hidden" name="stlNo" value="${update.stlNo}" readonly="readonly" />
		<table>
			<tbody>
				<tr>
					<td>브랜드 이름 : ${update.stlBrandName}</td>
				</tr>
				<tr>
					<td>
						<label for="stlInfo">정보</label>
						<textarea id="stlInfo" name="stlInfo"><c:out value="${update.stlInfo}" /></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="stlPhone">번호</label>
						<input type="text" id="stlPhone" name="stlPhone" value="${update.stlPhone}" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="stlEmail">이메일</label>
						<input type="text" id="stlEmail" name="stlEmail" value="${update.stlEmail}" />
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