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
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
<link rel="stylesheet" href="/resources/css/mainheader.css" />
<style>
div {
/* 	border : 1px solid black; */
border : 3px solid red;
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

<!-- ======== 헤더시작 ============= -->
<header>
		<div class="links">
			<a href="/member/join" class="link_text">회원가입</a> <a href="/member/login" class="link_text">로그인</a>
			<a href="/board/client" class="link_text">고객센터</a>
		</div>

		<a href="/" ><img src="/resources/pdimages/logo.png" class="img_logo" alt="" /></a>
		<form action="/search/productList">
			<fieldset>
				<legend class="visually-hidden">검색</legend>
				<div class="search_box">
					<input type="search" maxlength="225" tabindex="1" placeholder="검색어를 입력하세요" name="searchKeyWord"/>
					<button type="submit" tabindex="2"><i class="fas fa-search"></i></button>
				</div>
			</fieldset>
		</form>

		<div class="fav">
			<button type="button" onclick="location.href='/myPage/myPageList'"></button>
		</div>

		<div class="shopbasket">
			<button type="button" onclick="location.href='/cart/enterCartPage'"></button>
		</div>


		<nav>
			<div id="menu">
				<ul class="main1">
					<li style="border: none;"><b style="font-size: 15px;"><span
							style="font-size: 15px;">≡</span> 카테고리</b>
						<ul class="main2">
							<li class="cate_li"><a href="/collections/mainPageCategory?cateName=과일">[과일]</a></li>
							<li class="cate_li"><a href="/collections/mainPageCategory?cateName=채소">[채소]</a></li>
							<li class="cate_li"><a href="/collections/mainPageCategory?cateName=쌀/잡곡">[쌀/잡곡]</a></li>
							<li class="cate_li"><a href="/collections/mainPageCategory?cateName=수산물">[수산물]</a></li>
							<li class="cate_li"><a href="/collections/mainPageCategory?cateName=축산/계란">[축산/계란]</a></li>
							<li class="cate_li"><a href="/collections/mainPageCategory?cateName=냉동/냉장/간편식">[냉동/냉장/간편식]</a></li>
						</ul>
					</li>
					<li><a href="/collections/newProduct">신상품</a></li>
					<li><a href="/collections/best">베스트</a></li>
					<li><a href="/collections/nowOnSale">할인/특가</a></li>
				</ul>
			</div>
		</nav>
	</header>

<!-- =======헤더끝================= -->
<br />
<br />
<br />
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
	<!-- 메인페이지 지금 할인 중 select -->
	<div class="row">
		<div class="col col-lg-3"></div>
		<div class="col text-center">
			<p class="show_swiper_title">지금 할인 중</p>
		</div>
		<div class="col col-lg-3"></div>
	</div>
	<div class="row">
	<!-- 메인페이지 지금 할인 중 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="list" items="${salePd}" varStatus="vs">
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
	<!-- 메인페이지 만원 이하 판매량 높은 제품 select -->
	<div class="row">
		<div class="col col-lg-3"></div>
		<div class="col text-center">
			<p class="show_swiper_title">만원 이하 판매량 높은 제품</p>
		</div>
		<div class="col col-lg-3"></div>
	</div>
	<div class="row">
	<!-- 메인페이지 만원 이하 판매량 높은 제품 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="list" items="${svPd}" varStatus="vs">
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
	<!-- 메인페이지 후기 10,000개 이상 select -->
	<div class="row">
		<div class="col col-lg-3"></div>
		<div class="col text-center">
			<p class="show_swiper_title">후기 10,000개 이상</p>
		</div>
		<div class="col col-lg-3"></div>
	</div>
	<div class="row">
	<!-- 메인페이지 후기 10,000개 이상 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="list" items="${reviewPd}" varStatus="vs">
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
	<!-- 메인페이지 조회수 100,000 이상 select -->
	<div class="row">
		<div class="col col-lg-3"></div>
		<div class="col text-center">
			<p class="show_swiper_title">조회수 100,000 이상</p>
		</div>
		<div class="col col-lg-3"></div>
	</div>
	<div class="row">
	<!-- 메인페이지 조회수 100,000 이상 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="list" items="${hitsPd}" varStatus="vs">
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
	<!-- 메인페이지 제품 출시 6개월 미만 판매량 높은 제품 select -->
	<div class="row">
		<div class="col col-lg-3"></div>
		<div class="col text-center">
			<p class="show_swiper_title">제품 출시 6개월 미만 판매량 높은 제품</p>
		</div>
		<div class="col col-lg-3"></div>
	</div>
	<div class="row">
	<!-- 메인페이지 제품 출시 6개월 미만 판매량 높은 제품 select -->
		<div class="container">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="list" items="${datePd}" varStatus="vs">
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
</div>
<!-- =======================푸터 시작======================= -->
<footer class="footer">
		<div class="footer-limit">
			<div class="footer-content">
				<div class="footer-column">
					<h2 class="footer-contact_title">고객행복센터</h2>
					<div class="footer-contact_desc">
						1644-1107<span class="footer-contact_time"> 월~토요일 오전 7시 -
							오후 6시</span>
					</div>
					<ul class="footer-section">
						<li class="footer-section_item">
							<a href="/board/client"><button class="footer-section_button">고객센터</button></a>
							<p class="footer-section_desc">
								월~금요일 | 오전 9시 - 오후 6시<br>점심시간 | 낮 12시 - 오후 1시
							</p>
						</li>
					</ul>
					<div class="footer-nonmembers" onclick="window.open('');">
						비회원 문의 : help@olgacorp.com <br>비회원 대량주문 문의 :
						olgagift@kurlycorp.com
					</div>
				</div>
				<div class="footer-column">
					<ul class="footer-policy">
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">소개</a></li>
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">소개영상</a></li>
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">인재채용</a></li>
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">이용약관</a></li>
						<li class="footer-policy_item"><a
							class="footer-policy__link footer-policy__link--strong" href="">개인정보처리방침</a>
						</li>
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">이용안내</a></li>
					</ul>
					<div class="footer-address">
						법인명 (상호) : 주식회사 olga | 사업자등록번호 : 222-222-222<a
							class="footer-address_link" href=""> 사업자정보 확인</a><br> 통신판매업
						: 제 2018-서울강남-01646호 | 개인정보보호책임자 : 홍길동<br> 주소 : 경기도 분당구
						미금역  | 대표이사 : 홍길동<br> 입점문의 :<a
							class="footer-address_link" href=""> 입점문의하기</a> | 제휴문의 :<a
							class="footer-address_link" href=""> business@kulycorp.com</a><br>
						채용문의 :<a class="footer-address_link" href="">
							recruit@kurlycorp.com</a><br> 팩스 : 000 - 0000 - 0000
					</div>
					<ul class="footer-sns">
						<li class="footer-sns_item"><a class="footer-sns_link"
							href=""><img class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt=""></a>
							<a class="footer-sns_link" href=""><img
								class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt=""></a>
							<a class="footer-sns_link" href=""><img
								class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt=""></a>
							<a class="footer-sns_link" href=""><img
								class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt=""></a>
							<a class="footer-sns_link" href=""><img
								class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt=""></a>
						</li>
					</ul>
				</div>
			</div>
			<ul class="footer-certification">
				<li class="footer-certification_item" onclick="window.open('');">
					<img class="footer-certification_logo"
					src="https://res.kurly.com/pc/ico/2208/logo_isms.svg">
					<p class="footer-certification_desc">
						[인증범위 쇼핑몰 서비스 개발·운영<br> (심사받지 않은 물리적 인프라 제외)<br>
						[유효기간] 2022.01.19 - 2025.01.18
					</p>
				</li>
				<li class="footer-certification_item" onclick="window.open('');">
					<img class="footer-certification_logo"
					src="https://res.kurly.com/pc/ico/2208/logo_privacy.svg">
					<p class="footer-certification_desc">
						개인정보보호 우수 웬사이트 ·<br> 개인정보처리시스템 인증(ePRIVACY PLUS)
					</p>
				</li>
				<li class="footer-certification_item" onclick="window.open('');">
					<img
					class="footer-certification__logo footer-certification__logo--long"
					src="https://res.kurly.com/pc/ico/2208/logo_tosspayments.svg">
					<p class="footer-certification_desc">
						토스페이먼츠 구매안전(에스크로)<br> 서비스를 이용하실 수 있습니다.
					</p>
				</li>
				<li class="footer-certification_item" onclick="window.open('');">
					<img class="footer-certification_logo"
					src="https://res.kurly.com/pc/ico/2208/logo_wooriBank.svg">
					<p class="footer-certification_desc">
						고객님이 현금으로 결제한 금액에 대해 우리은행과<br> 채무지급보증 계약을 체결하여 안전거래를 보장하고<br>
						있습니다.
					</p>
				</li>
			</ul>
		</div>
		<div class="footer-full">
	<span class="footer-copyright">©
				OLGA CORP . ALL RIGHTS RESERVED</span>
		</div>
	</footer>

	
<!-- =======================푸터 끝======================= -->	
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