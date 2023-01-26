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
			<input type="hidden" id="slNo" name="slNo" value="${shipOne.slNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>회원 Id</th>
				<th>주소</th>
			</tr>
			<tr>
				<td>${shipOne.slNo}</td>
				<td>${shipOne.slmemId}</td>
				<td>${shipOne.slAddress}</td>
			</tr>
		</table>
		<form name="readForm" method="post" action="/myPage/shipUpdate?slNo${shipOne.slNo}">
			<div>
				<button type="submit" class="shipUpdate_btn">주소 변경</button>
			</div>
		</form>	
		<form name="deleteForm" method="post" action="/myPage/shipDelete?slNo${shipOne.slNo}">
			<div>
				<button type="submit" class="shipDelete_btn">주소 삭제</button>
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