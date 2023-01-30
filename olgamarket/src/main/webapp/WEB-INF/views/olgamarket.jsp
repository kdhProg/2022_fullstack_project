<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Olga</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
div {
/* 	border : 1px solid black; */
}
/* 현재세션 */
#currentSession{
	display: none;
}
/* 슬라이드 이미지 조정 */
.show_img_div{
	overflow: hidden;
}
.show_img_size{
	width:500px;
	height: 250px;
}
/*  */
/* 스와이프 가격문구 */
.swiper_pdSale{
	color:#fc5603;
	font-weight: bold;
}
.swiper_pdOriginPrice{
	color:grey;
	text-decoration: line-through;
	font-weight: bold;
}
.swiper_pdTotalPrice{
	font-weight: bold;
}
/* hr태그 마진 조정*/
hr{
	margin-top: 6px;
	margin-bottom : 6px;
}
/* 스와이프 브랜드명/상품명 */
.show_pdName,.show_pdBrandName{
	font-weight:bold;
	color:#666666;
}
.show_swiper_title{
	font-weight: bold;
	font-size: 1.3em;
}

/* =========스와이프========= */
.swiper-container {
	width:800px;
	height:380px;
/* 	border:5px solid silver; */
	border-radius:7px;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}

.col{
/* 	border:2px solid green; */
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
<!-- =====================================리모델링============================================== -->
<%-- <c:forEach var="list" items="${fruitPd}" varStatus="vs"> --%>
<!-- 	<tr> -->
<%-- 		<td>${vs.index}</td> --%>
<%-- 		<td>${list.getPdThumbImg()}</td> --%>
<%-- 		<td>${list.getPdName()}</td> --%>
<%-- 		<td>${list.getPdPrice()}</td> --%>
<%-- 		<td>${list.getPdSale()}</td> --%>
<!-- 	</tr> -->
<%-- </c:forEach> --%>

<div class="product_swiper_container container">
	<!-- 제철과일 타이틀 -->
	<div class="row">
		<div class="col col-lg-3"></div>
		<div class="col text-center">
			<p class="show_swiper_title">제철과일</p>
		</div>
		<div class="col col-lg-3"></div>
	</div>
	<div class="row">
	<!-- 제철과일 콘텐츠 -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="list" items="${fruitPd}" varStatus="vs">
						<div class="swiper-slide">
							<div class="row">
								<div class="col">
								<!-- 개별상품1개 -->
									<div class="row">
										<div class="col">
											<span class="show_pdBrandName">[${list.getPdstlBrandName()}]</span>
											<br />
											<hr />
											<span class="show_pdName">${list.getPdName()}</span>
										</div>
										<div class="col">
											<c:if test="${list.getPdSale() gt 0}">
												<c:set var="total" value="${list.getPdPrice() * (100-list.getPdSale())/100 }" />
												<fmt:parseNumber var="parsed_total" value="${total}" integerOnly="true" />
												<span class="swiper_pdSale">${list.getPdSale()}%</span>&nbsp;<span class="swiper_pdTotalPrice">${parsed_total}원</span><br />
												<span class="swiper_pdOriginPrice">${list.getPdPrice()}원</span>
											</c:if>
											<c:if test="${list.getPdSale() eq 0}">
												<span><strong>${list.getPdPrice()}원</strong></span>
											</c:if>
										</div>
									</div>
									<div class="row">
										<div class="col show_img_div">
											<img class="show_img_size" src="/resources/pdimages/pd_main_default.jpg" alt="" />
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a href="/goods/detailView?pdId=${list.getPdId()}"><button class="btn btn-outline-secondary">상세보기</button></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="row">
	<!-- 메인페이지 지금 할인 중 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="row">
							<div class="col col-lg-3">
							aa
							</div>
							<div class="col col-lg-3">
							bb
							</div>
							<div class="col col-lg-3">
							cc
							</div>
							<div class="col col-lg-3">
							dd
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="row">
	<!-- 메인페이지 만원 이하 판매량 높은 제품 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="row">
							<div class="col col-lg-3">
							aa
							</div>
							<div class="col col-lg-3">
							bb
							</div>
							<div class="col col-lg-3">
							cc
							</div>
							<div class="col col-lg-3">
							dd
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="row">
	<!-- 메인페이지 후기 10,000개 이상 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="row">
							<div class="col col-lg-3">
							aa
							</div>
							<div class="col col-lg-3">
							bb
							</div>
							<div class="col col-lg-3">
							cc
							</div>
							<div class="col col-lg-3">
							dd
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="row">
	<!-- 메인페이지 조회수 100,000 이상 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="row">
							<div class="col col-lg-3">
							aa
							</div>
							<div class="col col-lg-3">
							bb
							</div>
							<div class="col col-lg-3">
							cc
							</div>
							<div class="col col-lg-3">
							dd
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="row">
	<!-- 메인페이지 제품 출시 6개월 미만 판매량 높은 제품 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="row">
							<div class="col col-lg-3">
							aa
							</div>
							<div class="col col-lg-3">
							bb
							</div>
							<div class="col col-lg-3">
							cc
							</div>
							<div class="col col-lg-3">
							dd
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			</div>
		</div>
	</div>
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

//스와이파
new Swiper('.swiper-container', {
	navigation : {
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>
</html>