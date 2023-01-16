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
<section id="container">
	<form role="form" method="post" action="/admin/storeInsert">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="stlBrandName">브랜드 이름 : </label>
						<input type="text" id="stlBrandName" name="stlBrandName" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="stlInfo">정보 : </label>
						<textarea id="stlInfo" name="stlInfo"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="stlPhone">전화번호 : </label>
						<input type="text" id="stlPhone" name="stlPhone" />
					</td>
				</tr>	
				<tr>
					<td>
						<label for="stlEmail">이메일 : </label>
						<input type="text" id="stlEmail" name="stlEmail" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="stlMarketUniqueNo">고유번호 : </label>
						<input type="text" id="stlMarketUniqueNo" name="stlMarketUniqueNo" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="stlSelRegiNo">사업자등록번호 : </label>
						<input type="text" id="stlSelRegiNo" name="stlSelRegiNo" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="stlPhone">등록날짜 : </label>
						<fmt:parseDate value="${storeOne.stlRegiDate}" var="stlRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${stlRegiDate}" pattern="yyyy.MM.dd"/>
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