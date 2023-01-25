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
	<form role="form" method="post"  action="/seller/sqlQuiryUpdate">
		<input type="hidden" value="${selQuiryUp.sqNo}" id="sqNo" name="sqNo" />
		<table>
			<tbody>
				<tr>
					<td>
						<label for="sqTitle">제목 : </label>
						<input type="text" id="sqTitle" name="sqTitle" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="sqContent">내용 : </label>
						<textarea id="sqContent" name="sqContent"></textarea>
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