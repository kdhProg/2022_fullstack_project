<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<section id="container">
	<form role="form" method="post"  action="/admin/memGradeUpdate">
		<input type="hidden" value="${memGradeUpd.memId}" id="memId" name="memId" />
		<table>
			<tbody>
				<tr>
					<td>
						<label for="memGrade">등급</label>
						<input type="text" id="memGrade" name="memGrade" value="${memGradeUpd.memGrade}" />
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