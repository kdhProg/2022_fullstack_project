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
			<input type="hidden" id="rvNo" name="rvNo" value="${reviewOne.rvNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>상품 Id</th>
				<th>내용</th>
				<th>이미지</th>
				<th>추천수</th>
				<th>신고수</th>
				<th>등록일</th>
			</tr>
			<tr>
				<td>${reviewOne.rvNo}</td>
				<td>${reviewOne.rvpdId}</td>
				<td>${reviewOne.rvContent}</td>
				<td>${reviewOne.rvImg}</td>
				<td>${reviewOne.rvNice}</td>
				<td>${reviewOne.rvReport}</td>
				<td>
					<fmt:parseDate value="${reviewOne.rvUpdDate}" var="rvUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${rvUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
			</tr>
		</table>
		<form name="readForm" method="post" action="/myPage/reviewUpdateView?rvNo=${reviewOne.rvNo}">
			<div>
				<button type="submit" class="reviewUpdate_btn">후기 수정</button>
			</div>
		</form>	
		<form name="deleteForm" method="post" action="/myPage/reviewDelete?rvNo=${reviewOne.rvNo}">
			<div>
				<button type="submit" class="reviewDelete_btn">후기 삭제</button>
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