<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>고객센터</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 취소
			$("#list_btn").on("click", function(){
				
				location.href = "/board/client";
			})
		})
	</script>
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
		<div>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="ntNo" name="ntNo" value="${noticeOne.ntNo}" />
			</form>
			<table class="table">
				<tr>
					<th>No</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>내용</th>
					<th>등록 날짜</th>
					<th>수정 날짜</th>
					<th>작성자</th>
				</tr>
				<tr>
					<td>${noticeOne.ntNo}</td>
					<td>${noticeOne.ntCategory}</td>
					<td>${noticeOne.ntTitle}</td>
					<td>${noticeOne.ntContent}</td>
				  	<td>
				  		<fmt:parseDate value="${noticeOne.ntRegiDate}" var="ntRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${ntRegiDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>
						<fmt:parseDate value="${noticeOne.ntUpdDate}" var="ntUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${ntUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>${noticeOne.ntadmId}</td>
				</tr>
			</table>
			<div>
				<button type="submit" id="list_btn" class="btn btn-outline-danger">목록</button>
			</div>
		</div>
	</section>
</div>
</body>
</html>