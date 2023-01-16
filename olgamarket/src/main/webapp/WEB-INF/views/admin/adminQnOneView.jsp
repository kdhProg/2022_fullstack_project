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
			<td>
				<input type="text" id=otqNo name="otqNo" value="${adminQnOne.otqNo}" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id=otqTitle name="otqTitle" value="${adminQnOne.otqTitle}" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id=otqContent name="otqContent" value="${adminQnOne.otqContent}" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id=otqmemId name="otqmemId" value="${adminQnOne.otqmemId}" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id=otqUpdDate name="otqUpdDate" value="${adminQnOne.otqUpdDate}" />
			</td>
		</tr>
	</table>	
	<table>
		<c:forEach var="list" items="${adminQnList}">
			<tr>
				<td>${list.getOtaotqNo()}</td>
				<td>${list.getOtaContent()}</td>
				<td>${list.getOtaUpdDate()}</td>
				<td>${list.getOtaadmId()}</td>
			</tr>
		</c:forEach>
	</table>   
		
	
	
</body>
</html>