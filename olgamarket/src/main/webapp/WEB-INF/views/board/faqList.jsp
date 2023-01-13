<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button><a href="/board/faqList?showPage=${loopPage}&category=주문/결제">[주문/결제]</a></button>
<button><a href="/board/faqList?showPage=${loopPage}&category=취소/교환/환불">[취소/교환/환불]</a></button>
<button><a href="/board/faqList?showPage=${loopPage}&category=포장">[포장]</a></button>
<button><a href="/board/faqList?showPage=${loopPage}&category=회원">[회원]</a></button><br />

	<table>
		<tr>
			<th>No</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>작성자</th>
		</tr>
		<c:forEach var="list" items="${FaqList}">
			<tr>
				<td>${list.getFaqNo()}</td>
				<td>${list.getFaqadmId()}</td>
				<td>${list.getFaqTitle()}</td>
				<td>${list.getFaqCategory()}</td>
				<td>${list.getFaqRegiDate()}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<c:if test="${pageInfo.xprev}">
		<a
			href="/board/faqList?showPage=${pageInfo.firstPageNoOnPageList-1 }&category=${category}">[prev]</a>
	</c:if>
	<c:forEach var="loopPage" begin="${pageInfo.firstPageNoOnPageList }"
		end="${pageInfo.lastPageNoOnPageList }" step="1">
		<c:if test="${loopPage eq currPage}">
			<span>[${loopPage}]&nbsp;&nbsp;&nbsp;</span>
		</c:if>
		<c:if test="${loopPage ne currPage}">
			<span><a
				href="/board/faqList?showPage=${loopPage}&category=${category}">[${loopPage}]</a>&nbsp;&nbsp;&nbsp;</span>
		</c:if>
	</c:forEach>
	<c:if test="${pageInfo.xnext}">
		<a href="/board/faqList?showPage=${pageInfo.lastPageNoOnPageList+1 }&category=${category}">[next]</a>
	</c:if>
</body>
</html>