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
<body>
<section id="container">
	<form role="form" method="post" action="/admin/selAnswerInsert">
		<input type="text" value="${npaIn.npqNo}" id="npqNo" name="npanpqNo" />
		<table>
			<tbody>
				<tr>
					<td>
						<label for="npaContent">내용 : </label>
						<textarea id="npaContent" name="npaContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="npaUpdDate">등록날짜 : </label>
						<fmt:parseDate value="${npaIn.npaUpdDate}" var="npaUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${npaUpdDate}" pattern="yyyy.MM.dd"/>
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