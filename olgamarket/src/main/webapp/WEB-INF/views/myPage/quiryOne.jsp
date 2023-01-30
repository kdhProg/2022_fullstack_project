<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
			<a href="#" onclick="purchaseList(1, '${member.getMemId()}');return false;" id="plListBt" class="nav-link">주문 내역</a>
	 	</li>
		<li class="nav-item">
	    	<a href="#" onclick="myShipList(1, '${member.getMemId()}');return false;" id="slListBt" class="nav-link">배송지</a>
		</li>
		<li class="nav-item">
			<a href="#" onclick="myFavorList(1, '${member.getMemId()}');return false;" id="favListBt" class="nav-link">찜</a>
		</li>
		<li class="nav-item">
			<a href="#" onclick="myReviewList(1, '${member.getMemId()}');return false;" id="rvListBt" class="nav-link">상품 후기</a>
		</li>
		<li class="nav-item">
			<a href="#" onclick="myQuiryList(1, '${member.getMemId()}');return false;" id="quListBt" class="nav-link">상품 문의</a>
		</li>
		<li class="nav-item">
			<a href="/myPage/memInfoUpdateView?memId=${member.getMemId()}" id="memUpdateBt" class="nav-link">내 정보 수정</a>
		</li>
	</ul>
	<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="iqNo" name="iqNo" value="${quiryOne.iqNo}" />
			</form>	
			<br />
			<h3>문의</h3>
			<table class="table">
				<tr>
					<th>No</th>
					<th>상품 아이디</th>
					<th>제목</th>
					<th>내용</th>
					<th>답변 상태</th>
					<th>비밀글</th>
					<th>등록일</th>
				</tr>
				<tr>
					<td>${quiryOne.iqNo}</td>
					<td>${quiryOne.iqpdId}</td>
					<td>${quiryOne.iqTitle}</td>
					<td>${quiryOne.iqContent}</td>
					<td>${quiryOne.iqPrivate}</td>
					<td>${quiryOne.iqState}</td>
					<td>
						<fmt:parseDate value="${quiryOne.iqUpdDate}" var="iqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${iqUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
			</table>
			<br />
			<h3>답변</h3>
			<table class="table">
				<tr>
					<th>답변 내용</th>
					<th>작성 날짜</th>
				</tr>
			    <c:forEach items="${answerList}" var="answerList">
					<tr>
						<td>${answerList.iaContents}</td>
						<td>
							<fmt:parseDate value="${answerList.iqUpdDate}" var="iqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
			        		<fmt:formatDate value="${iqUpdDate}" pattern="yyyy-MM-dd" />	
						</td>
					</tr>
			    </c:forEach>   
			</table>
			<form name="readForm" method="post" action="/myPage/quiryUpdateView?iqNo=${quiryOne.iqNo}">
				<div>
					<button type="submit" class="btn btn-outline-danger">문의 수정</button>
				</div>
			</form>	
			<form name="deleteForm" method="post" action="/myPage/quiryDelete?iqNo=${quiryOne.iqNo}">
				<div>
					<button type="submit" class="btn btn-outline-danger">문의 삭제</button>
				</div>
			</form>		
			<form name="listForm" method="post" action="/myPage/myPageList">
				<div>
					<button type="submit" class="btn btn-outline-danger">목록</button>
				</div>
			</form>	
	</section>
</div>	
</body>
</html>