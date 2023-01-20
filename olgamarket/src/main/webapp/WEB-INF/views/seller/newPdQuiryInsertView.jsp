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
		<input type="hidden" value="${npqIn.selId}" id="npqselId" name="npqselId" />  
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
						<fmt:parseDate value="${npqIn.selUpdDate}" var="selUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${selUpdDate}" pattern="yyyy.MM.dd"/>
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