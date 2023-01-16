<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	div {
		border : 1px solid black;
	}
</style>
<body>

	<a href="/member/Join">회원가입하기</a>

	<a href="/collections/newProduct">신상품</a>

	<a href="/board/noticeList">고객센터-공지사항</a>

	<a href="/board/faqList">고객센터-FAQ</a>
	
	<div class="fruitPd">
		<table>
			<c:forEach var="list" items="${fruitPd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="salePd">
		<table>
			<c:forEach var="list" items="${salePd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="svPd">
		<table>
			<c:forEach var="list" items="${svPd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="reviewPd">
		<table>
			<c:forEach var="list" items="${reviewPd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="hitsPd">
		<table>
			<c:forEach var="list" items="${hitsPd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="datePd">
		<table>
			<c:forEach var="list" items="${datePd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>