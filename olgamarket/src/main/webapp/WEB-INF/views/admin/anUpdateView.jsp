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
	<form role="form" method="post"  action="/admin/anUpdate">
		<input type="hidden" value="${anUp.otqNo}" id="otqNo" name="otaotqNo" />
		<table>
			<tbody>
				<tr>
					<td>
						<label for="otaMainCategory">메인 카테고리 : </label>
						<input type="text" id="otaMainCategory" name="otaMainCategory" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="otaSubCategory">서브 카테고리 : </label>
						<input type="text" id="otaSubCategory" name="otaSubCategory" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="otaTitle">제목 : </label>
						<input type="text" id="otaTitle" name="otaTitle" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="otaContent">내용 : </label>
						<textarea id="otaContent" name="otaContent"></textarea>
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