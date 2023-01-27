<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	div {
		border : 1px solid black;
	}
#currentSession{
	display: none;
}
</style>
<body>
<!-- 현재세션값 자바스크립트 넘기기-->
<span id="currentSession">${member.getMemId()}</span>

	<form action="/search/productList">
		<input type="text" placeholder="검색어 입력" name="searchKeyWord"/>
		<input type="submit" value="검색"/>
	</form>
	<c:choose> 
		<c:when test="${not empty member}">
		<!-- 일반회원 -->
			<p>일반회원: ${member.getMemName()}님</p>
			<a href="/member/logout">로그아웃</a>
			<a href="/myPage/myPageList?memId=${member.getMemId()}">마이페이지</a>
		</c:when> 
		<c:when test="${not empty seller}">
		<!-- 판매자회원 -->
			<p>판매자회원: ${seller.getSelName()}님</p>
			<a href="/member/logout">로그아웃</a><br />
			<c:if test="${seller.getSelTypeGrade() eq 1}">
			<!-- 판매자회원이면서 권한이 유효해야함 -->
				<a href="/seller/dedicated?selId=${seller.getSelId()}&selstlBrandName=${seller.getSelstlBrandName()}">판매자 전용 페이지</a>
			</c:if>
		</c:when> 
		<c:otherwise>
		<!-- 비로그인 -->
			<a href="/member/join">회원가입하기</a><br />
			<a href="/member/login">로그인</a>
		</c:otherwise> 
	</c:choose> 
	
	
	<hr />
	<h2>카테고리 리스트</h2>
	<a href="/collections/mainPageCategory?cateName=과일">[과일]</a>&nbsp;<a href="/collections/mainPageCategory?cateName=채소">[채소]</a>&nbsp;
	<a href="/collections/mainPageCategory?cateName=쌀/잡곡">[쌀/잡곡]</a>&nbsp;<a href="/collections/mainPageCategory?cateName=수산물">[수산물]</a>&nbsp;
	<a href="/collections/mainPageCategory?cateName=축산/계란">[축산/계란]</a>&nbsp;<a href="/collections/mainPageCategory?cateName=냉동/냉장/간편식">[냉동/냉장/간편식]</a>
	<hr />
	<a href="/collections/newProduct">신상품</a>
	<hr />
	<a href="/collections/best">베스트</a>
	<hr />
	<a href="/collections/nowOnSale">할인/특가</a>
	<hr />
	<a href="/board/client">고객센터</a>
	<hr />
	<button type="button" id="enterCartPage">장바구니</button>
	
	   
	<div class="fruitPd">
		<table>
			<c:forEach var="list" items="${fruitPd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="salePd">
		<table>
			<c:forEach var="list" items="${salePd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="svPd">
		<table>
			<c:forEach var="list" items="${svPd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="reviewPd">
		<table>
			<c:forEach var="list" items="${reviewPd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="hitsPd">
		<table>
			<c:forEach var="list" items="${hitsPd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="datePd">
		<table>
			<c:forEach var="list" items="${datePd}">
				<tr>
					<td>${list.getPdThumbImg()}</td>
					<td>${list.getPdName()}</td>
					<td>${list.getPdPrice()}</td>
					<td>${list.getPdSale()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	
<!-- 모달창-로그인 -->
<div id="login_warn_modal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
		<p>로그인시 이용할 수 있는 서비스 입니다.</p>
      </div>
      <div class="modal-footer">
     	<button type="button" id="warn_modal_login" class="btn btn-primary" data-bs-dismiss="modal">로그인</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
//현재 세션값
let currentSession = $("#currentSession").text();

//장바구니 버튼 클릭
$("#enterCartPage").click(function(){
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	location.href="/cart/enterCartPage";
});

//모달창에서 로그인 버튼
$("#warn_modal_login").click(function(){
	location.href = "/member/login";
});

</script>
</html>