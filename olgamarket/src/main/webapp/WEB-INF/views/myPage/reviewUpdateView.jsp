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
	<form role="form" method="post"  action="/myPage/reviewUpdate">
		<input type="hidden" value="${reviewUpd.rvNo}" id="rvNo" name="rvNo" />
		<table>
			<tbody>
				<tr>
					<td>
						<label for="rvContent">내용 : </label>
						<textarea id="rvContent" name="rvContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="rvImg">이미지 : </label>
						<input type="text" id="rvImg" name="rvImg" />
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