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
	<table>
		<c:forEach var="list" items="${datePd30}">
			<tr>
				<td>${list.getPdId()}</td>
				<td>${list.getPdThumbImg()}</td>
				<td>${list.getPdName()}</td>
				<td>${list.getPdPrice()}</td>
				<td>${list.getPdSale()}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>