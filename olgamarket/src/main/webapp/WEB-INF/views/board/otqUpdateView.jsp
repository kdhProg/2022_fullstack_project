<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<ul class="nav nav-pills">
	  <li class="nav-item">
	    <a href="#" onclick="noticeList(1);return false;" aria-current="page" id="noticeBt" class="nav-link" href="#">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a href="#" onclick="faqList(1);return false;" id="faqBt" class="nav-link">FAQ</a>
	  </li>
	  <li class="nav-item">
		<a href="#" onclick="otList(1);return false;" id="onetooneBt" class="nav-link">1 : 1 문의</a>
	  </li>
	</ul>
	<section id="container">
		<form role="form" method="post"  action="/board/otqUpdate">
			<input type="text" value="${otqUp.otqNo}"  name="otqNo" readonly="readonly" class="form-control"/>
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label for="otqMainCategory">메인 카테고리 : </label>
							<input type="text" id="otqMainCategory" value="${otqUp.otqMainCategory}" name="otqMainCategory" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="otqSubCategory">서브 카테고리 : </label>
							<input type="text" id="otqSubCategory" value="${otqUp.otqSubCategory}" name="otqSubCategory" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="otqTitle">제목 : </label>
							<input type="text" id="otqTitle" name="otqTitle" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="otqContent">내용 : </label>
							<textarea id="otqContent" name="otqContent" class="form-control"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="btn btn-outline-danger">수정</button>
						</td>
					</tr>
				</tbody>
			</table>	
		</form>	
	</section>
</div>	
</body>
</html>