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
				<input type="hidden" id="otqNo" name="otqNo" value="${boardQnOne.otqNo}" />
			</form>
			<br />
			<h3>문의</h3>
			<table class="table">
				<tr>
					<th>No</th>
					<th>메인 카테고리</th>
					<th>서브 카테고리</th>
					<th>제목</th>
					<th>내용</th>
					<th>답변 상태</th>
					<th>등록 날짜</th>
					<th>수정 날짜</th>
					<th>작성자</th>
				</tr>
				<tr>
					<td>${boardQnOne.otqNo}</td>
					<td>${boardQnOne.otqMainCategory}</td>
					<td>${boardQnOne.otqSubCategory}</td>
					<td>${boardQnOne.otqTitle}</td>
					<td>${boardQnOne.otqContent}</td>
					<td>${boardQnOne.otqState}</td>
				  	<td>
				  		<fmt:parseDate value="${boardQnOne.otqRegiDate}" var="otqRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${otqRegiDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>
						<fmt:parseDate value="${boardQnOne.otqUpdDate}" var="otqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${otqUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>${boardQnOne.otqmemId}</td>
				</tr>
			</table>
	 		<br />
			<h3>답변</h3>
			<table class="table">
				<c:forEach items="${boardAnList}" var="boardAnList">
					<tr>
						<td>
							 작성자 : ${boardAnList.otaadmId}<br />
						     메인 카테고리 : ${boardAnList.otaMainCategory}<br />
						     서브 카테고리 : ${boardAnList.otaSubCategory}<br />
						     제목 :  ${boardAnList.otaTitle}<br />
						     답변 내용 : ${boardAnList.otaContent}<br />
						     작성 날짜 : 
						     <fmt:parseDate value="${boardAnList.otaUpdDate}" var="otaUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
						     <fmt:formatDate value="${otaUpdDate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
			    </c:forEach>   
			</table>
			<form name="updateForm" method="post" action="/board/otqUpdateView?otqNo=${boardQnOne.otqNo}">
				<div>
					<button type="submit" class="btn btn-outline-danger">수정</button>
				</div>
			</form>	
			<form name="deleteForm" method="post" action="/board/otqDelete?otqNo=${boardQnOne.otqNo}">
				<div>
					<button type="submit" class="btn btn-outline-danger">삭제</button>
				</div>
			</form>	
			<form name="listForm" method="post" action="/board/client">
				<div>
					<button type="submit" class="btn btn-outline-danger">목록</button>
				</div>
			</form>	
		</div>
	</section>
</div>
</body>
</html>