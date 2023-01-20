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
<body>
<section id="container">
	<form role="form" method="post" action="/admin/noticeInsert">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="ntCategory">카테고리 : </label>
						<input type="text" id="ntCategory" name="ntCategory" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="ntTitle">제목 : </label>
						<input type="text" id="ntTitle" name="ntTitle" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="ntContent">내용 : </label>
						<textarea id="ntContent" name="ntContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="ntadmId">작성자 :${ntadmId} </label>
						<input type="text" id="ntadmId" name="ntadmId" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="ntRegiDate">등록날짜 : </label>
						<fmt:parseDate value="${noticeOne.ntRegiDate}" var="ntRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${ntRegiDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">등록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
</section>
</body>
</html>