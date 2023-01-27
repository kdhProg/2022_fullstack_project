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
	<form role="form" method="post"  action="/myPage/quiryUpdate">
		<input type="hidden" value="${quiryUpd.iqNo}" id="iqNo" name="iqNo" />
		<table>
			<tbody>
				<tr>
					<td>
						<label for="iqTitle">제목 : </label>
						<input type="text" id="iqTitle" name="iqTitle" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="iqContent">내용 : </label>
						<textarea id="iqContent" name="iqContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="iqPrivate">비밀글 여부 : </label>
						<input type="text" id="iqPrivate" name="iqPrivate" />
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