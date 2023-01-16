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
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성 일자</th>
			<th>답변 여부</th>
		</tr>
		<c:forEach var="list" items="${memQnList}">
			<tr>
				<td><a href="/board/memQnOneView?otqNo=${list.getOtqNo()}">${list.getOtqNo()}</a></td>
				<td>${list.getOtqTitle()}</td>
				<td>${list.getOtqmemId()}</td>
				<td>${list.getOtqUpdDate()}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<c:if test="${pageInfo.xprev}">
		<a
			href="/board/memQnListView?showPage=${pageInfo.firstPageNoOnPageList-1 }&category=${category}">[prev]</a>
	</c:if>
	<c:forEach var="loopPage" begin="${pageInfo.firstPageNoOnPageList }"
		end="${pageInfo.lastPageNoOnPageList }" step="1">
		<c:if test="${loopPage eq currPage}">
			<span>[${loopPage}]&nbsp;&nbsp;&nbsp;</span>
		</c:if>
		<c:if test="${loopPage ne currPage}">
			<span><a
				href="/board/memQnListView?showPage=${loopPage}&category=${category}">[${loopPage}]</a>&nbsp;&nbsp;&nbsp;</span>
		</c:if>
	</c:forEach>
	<c:if test="${pageInfo.xnext}">
		<a href="/board/memQnListView?showPage=${pageInfo.lastPageNoOnPageList+1 }&category=${category}">[next]</a>
	</c:if>
</body>
</html>