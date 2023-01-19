<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<form action="/search/productList">
		<input type="text" placeholder="검색어 입력" name="searchKeyWord"/>
		<input type="submit" value="검색"/>
	</form>

	<a href="/member/join">회원가입하기</a><br />
	<a href="/member/login">로그인</a>
	<a href="/seller/dedicated">판매자 전용 페이지</a>
	<hr />
	<h2>카테고리 리스트</h2>
	<a href="/collections/mainPageCategory?cateName=과일">[과일]</a>&nbsp;<a href="/collections/mainPageCategory?cateName=채소">[채소]</a>&nbsp;
	<a href="/collections/mainPageCategory?cateName=쌀/잡곡">[쌀/잡곡]</a>&nbsp;<a href="/collections/mainPageCategory?cateName=수산물">[수산물]</a>&nbsp;
	<a href="/collections/mainPageCategory?cateName=축산/계란">[축산/계란]</a>&nbsp;<a href="/collections/mainPageCategory?cateName=냉동/냉장/간편식">[냉동/냉장/간편식]</a>
	<hr />
	<a href="/collections/newProduct">신상품</a>
	<hr />
	<a href="/collections/best">베스트</a>
	<hr />
	<a href="/collections/nowOnSale">할인/특가</a>
	<hr />
	<a href="/board/client">고객센터</a>
	<hr />
	   
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