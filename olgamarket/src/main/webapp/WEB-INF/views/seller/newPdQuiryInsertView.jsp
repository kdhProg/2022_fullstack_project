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
<section id="container">
	<form role="form" method="post" action="/seller/newPdQuiryInsert">
		<input type="text" value="${npqIn.selId}" id="selId" name="selId" />  
		<table>
			<tbody>
				<tr>
					<td>
						<label for="npqTitle">제목 : </label>
						<input type="text" id="npqTitle" name="npqTitle" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="npqContent">내용 : </label>
						<textarea id="npqContent" name="npqContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="npqImg">이미지 : </label>
						<input type="text" id="npqImg" name="npqImg" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="npqselId">작성자 : ${npqIn.npqselId}</label>
						<input type="text" id="npqselId" name="npqselId" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="saUpdDate">등록날짜 : ${npqIn.npqUpdDate}</label>
						<fmt:parseDate value="${npqIn.npqUpdDate}" var="npqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${npqUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">등록</button>
					</td>
				</tr>
			</tbody>
		</table>	
	</form>	
</section>
</body>
</html>