<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="container">
	<div>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="iqNo" name="iqNo" value="${quiryOne.iqNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>상품 아이디</th>
				<th>제목</th>
				<th>내용</th>
				<th>답변 상태</th>
				<th>등록일</th>
			</tr>
			<tr>
				<td>${quiryOne.iqNo}</td>
				<td>${quiryOne.iqpdId}</td>
				<td>${quiryOne.iqTitle}</td>
				<td>${quiryOne.iqContent}</td>
				<td>${quiryOne.iqState}</td>
				<td>
					<fmt:parseDate value="${quiryOne.iqUpdDate}" var="iqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${iqUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
			</tr>
		</table>
		<form name="readForm" method="post" action="/myPage/quiryUpdateView?iqNo=${quiryOne.iqNo}">
			<div>
				<button type="submit" class="quiryUpdate_btn">문의 수정</button>
			</div>
		</form>	
		<form name="deleteForm" method="post" action="/myPage/quiryDelete?iqNo=${quiryOne.iqNo}">
			<div>
				<button type="submit" class="shipDelete_btn">문의 삭제</button>
			</div>
		</form>		
		<form name="listForm" method="post" action="/myPage/myPageList">
			<div>
				<button type="submit" class="list_btn">목록</button>
			</div>
		</form>	
	</div>
</section>
</body>
</html>