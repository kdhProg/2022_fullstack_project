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
	<form role="form" method="post"  action="/board/otqInsert">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="otqMainCategory">메인 카테고리 : </label>
						<input type="text" id="otqMainCategory" name="otqMainCategory" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="otqSubCategory">서브 카테고리 : </label>
						<input type="text" id="otqSubCategory" name="otqSubCategory" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="otqTitle">제목 : </label>
						<input type="text" id="otqTitle" name="otqTitle" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="otqContent">내용 : </label>
						<textarea id="otqContent" name="otqContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="otqmemId">작성자 : </label>
						<input type="text" id="otqmemId" name="otqmemId" value="${member.getMemId()}${seller.getSelId()}" readonly="readonly"/>
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