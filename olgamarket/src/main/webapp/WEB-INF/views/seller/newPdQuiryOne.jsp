<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Seller</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<body>
<div class="container">
	<section id="container">
		<div>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="npqNo" name="npqNo" value="${newPdQuiryOne.npqNo}" />
			</form>
			<br />
			<h3>문의</h3>
			<table class="table">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>내용</th>
					<th>상세 이미지</th>
					<th>답변 상태</th>
					<th>등록 날짜</th>
					<th>작성자</th>
				</tr>
				<tr>
					<td>${newPdQuiryOne.npqNo}</td>
					<td>${newPdQuiryOne.npqTitle}</td>
					<td>${newPdQuiryOne.npqContent}</td>
					<td>${newPdQuiryOne.npqImg}</td>
					<td>${newPdQuiryOne.npqState}</td>
					<td>
						<fmt:parseDate value="${newPdQuiryOne.npqUpdDate}" var="npqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${npqUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>${newPdQuiryOne.npqselId}</td>
				</tr>
			</table>
			<br />
			<h3>답변</h3>
	 		<table class="table">
	 			<tr>
	 				<th>답변 내용</th>
	 				<th>작성 날짜</th>
	 			</tr>
			    <c:forEach items="${newPdAnList}" var="newPdAnList">
			    	<tr>
			    		<td>${newPdAnList.npaContent}</td>
			    		<td>
				        	<fmt:parseDate value="${newPdAnList.npaUpdDate}" var="npaUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
				        	<fmt:formatDate value="${npaUpdDate}" pattern="yyyy-MM-dd" />
			    		</td>
			    	</tr>
			    </c:forEach>   
			</table>	
			<form name="updateForm" method="post" action="/seller/newPdQuiryUpdateView?npqNo=${newPdQuiryOne.npqNo}">
				<div>
					<button type="submit" class="btn btn-outline-danger">수정</button>
				</div>
			</form>	
			<form name="deleteForm" method="post" action="/seller/newPdQuiryDelete?npqNo=${newPdQuiryOne.npqNo}">
				<div>
					<button type="submit" class="btn btn-outline-danger">삭제</button>
				</div>
			</form>
			<form name="listForm" method="post" action="/seller/newPdQuiryList">
				<div>
					<button type="submit" class="btn btn-outline-danger">목록</button>
				</div>
			</form>	
		</div>
	</section>
</div>
</body>
</html>