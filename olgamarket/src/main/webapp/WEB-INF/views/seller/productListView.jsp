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

<!-- 상품 클릭시 상품 디테일 페이지로 넘어가게 만들기 -->
	<table>
		<c:forEach var="list" items="${pdList}">
			<tr>
				<td>${list.getPdId()}</td>
				<td>${list.getPdName()}</td>
				<td>${list.getPdPrice()}</td>
				<td>${list.getPdSale()}</td>
				<td>${list.getPdHits()}</td>
				<td>${list.getPdSalesVolume()}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>