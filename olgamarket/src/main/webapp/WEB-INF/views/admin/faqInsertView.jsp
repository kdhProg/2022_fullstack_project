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
	<form role="form" method="post" action="/admin/faqInsert">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="faqCategory">카테고리 : </label>
						<select name="faqCategory" required="required">
							<option value="">선택하세요.</option>
							<option value="주문/결제">주문/결제</option>
							<option value="취소/교환/환불">취소/교환/환불</option>
							<option value="회원">회원</option>
						</select> 
					</td>
				</tr>	
				<tr>
					<td>
						<label for="faqTitle">제목 : </label>
						<input type="text" id="faqTitle" name="faqTitle" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="faqContent">내용 : </label>
						<textarea id="faqContent" name="faqContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="faqadmId">작성자 : </label>
						<input type="text" id="faqadmId" name="faqadmId" value="${admin.getAdmId()}" />
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