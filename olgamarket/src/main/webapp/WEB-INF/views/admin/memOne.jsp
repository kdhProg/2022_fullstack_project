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
			<input type="hidden" id="selId" name="memId" value="${adminMemOne.memId}" />
		</form>
		<table>
			<tr>
				<th>회원 Id</th>
				<th>이름</th>
				<th>회원 등급</th>
			</tr>
			<tr>
				<td>${adminMemOne.memId}</td>
				<td>${adminMemOne.memName}</td>
				<td>${adminMemOne.memGrade}</td>
			</tr>
		</table>
		<form name="readForm" method="post" action="/admin/memGradeUpdateView?memId=${adminMemOne.memId}">
			<div>
				<button type="submit" class="selUpdate_btn">등급 변경</button>
			</div>
		</form>		
		<form name="listForm" method="post" action="/admin/memberGrade">
			<div>
				<button type="submit" class="list_btn">목록</button>
			</div>
		</form>	
	</div>
</section>

</body>
</body>
</html>