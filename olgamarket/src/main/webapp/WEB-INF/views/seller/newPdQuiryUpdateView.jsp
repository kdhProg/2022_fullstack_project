<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<body>
<div class="container">
	<section id="container">
		<form role="form" method="post"  action="/seller/newPdQuiryUpdate">
			<input type="hidden" value="${npqUp.npqNo}" id="npqNo" name="npqNo" />
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label for="npqTitle">제목 : </label>
							<input type="text" id="npqTitle" name="npqTitle" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="npqContent">내용 : </label>
							<textarea id="npqContent" name="npqContent" class="form-control"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="npqImg">이미지 : </label>
							<input type="text" id="npqImg" name="npqImg" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="btn btn-outline-danger">등록</button>
						</td>
					</tr>
				</tbody>
			</table>	
		</form>	
	</section>
</div>	
</body>
</html>