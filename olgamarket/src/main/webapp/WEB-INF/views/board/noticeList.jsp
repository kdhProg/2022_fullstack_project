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
<body>

	<table>
		<tr>
			<th>No</th>
			<th>메인카테고리</th>
			<th>제목</th>
			<th>등록일</th>
			<th>작성자</th>
		</tr>
		<c:forEach var="list" items="${NoticeList}">
			<tr>
				<td>${list.getNtNo()}</td>
				<td>${list.getNtCategory()}</td>
				<td>${list.getNtTitle()}</td>
				<td>${list.getNtUpdDate()}</td>
				<td>${list.getNtadmId()}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<c:if test="${pageInfo.xprev}">
		<a
			href="/board/noticeList?showPage=${pageInfo.firstPageNoOnPageList-1 }">[prev]</a>
	</c:if>
	<c:forEach var="loopPage" begin="${pageInfo.firstPageNoOnPageList }"
		end="${pageInfo.lastPageNoOnPageList }" step="1">
		<c:if test="${loopPage eq currPage}">
			<span>[${loopPage}]&nbsp;&nbsp;&nbsp;</span>
		</c:if>
		<c:if test="${loopPage ne currPage}">
			<span><a
				href="/board/noticeList?showPage=${loopPage}">[${loopPage}]</a>&nbsp;&nbsp;&nbsp;</span>
		</c:if>
	</c:forEach>
	<c:if test="${pageInfo.xnext}">
		<a
			href="/board/noticeList?showPage=${pageInfo.lastPageNoOnPageList+1 }">[next]</a>
	</c:if>
</body>
</html>