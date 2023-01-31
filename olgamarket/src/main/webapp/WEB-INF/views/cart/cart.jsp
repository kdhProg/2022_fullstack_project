<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Olga-장바구니</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 헤더, 풋터 CSS 링크 -->
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
#currentSession{
	display:none;
}
/* 수량 증감버튼 패딩 조정 */
.padding_eliminate_left{
	padding-left: 0;
}
.padding_eliminate_right{
	padding-right: 0;
}
/* a태그 기본 장식 제거 */
a{
	text-decoration: none;
	color: black;
}
/* 버튼 기본장식 제거 */
.deleteBtn,.cartQuantityPlus,.cartQuantityMinus{
	border: none;
	background: transparent;
}
/* hr태그 마진 조정 */
hr{
	margin-bottom: 6px;
	margin-top: 6px;
}
/* 굵은 hr */
.strong_hr{
	border:1.5px solid black;
}
/* 배송지/총액 테두리 */
#ship_price_wrapper{
	border:1px solid #FAFAFA;
}
/* 가격 백그라운드 */
#priceWrapper{
	background: #FAFAFA;
}
/* 가격입력버튼 형식설정 */
#totalSalePrice,#totalPrice,#shippingPrice{
	border: none;
	background: transparent;
	font-weight: bold;
	font-size: 1.2em;
	width: 100px;
}
/* 배송지 입력박스 */
#shipList_inputBox{
	border: none;
	width: 100%;
	height:40px;
}
/* 배송지등록+주문버튼 */
#regist_ship_btn,#enter_order{
	width:100%;
}
/* ==========헤더관련=============== */
/* 현재세션 */
#currentSession{
	display: none;
}
/* 스틱키 */
#main_navBars{
	position: sticky;
	top:0px;
	z-index: 999;
	background: white;
 	box-shadow: 0 4px 4px -4px black;
}
/* a태그 장식제거*/
a{
	color:black;
	text-decoration: none;
}
/* a태그 호버 */
a:hover{
	color:#FC5603;
}
/* 카테고리바 숨기기 */
.main2{
	position: absolute;
	left: -9999px;
}
/* 카테고리바 보이기 */
.main1>li:hover .main2 {
	left: 130px;
}
/* 찜/장바구니 버튼 */
#enterFavorPage,#enterCartPage{
	border: none;
	background: transparent;
}
/* 메인로고 */
#mainLogo{
	width:70px;
}
/* 검색창 테두리 */
#searchBox_wrap{
	border: 1px solid #FC5603;
	border-radius: 10px;
}
/* 검색 인풋박스 테두리 */
#search_input_box{
	border: none;
}
/* 카테고리박스 */
.main2{
	border: 1px solid #FAFAFA;
	background: white;
}
/* li태그 마진 조정 */
.cate_li{
	margin-top:20px;
	margin-bottom: 10px;
	font-weight: bold;
	font-size: 0.9em;
}
/* 네비게이션 검색박스 */
#navSearchBox,#navSearchBoxBtn{
	display:none;
}
/* 회원가입 */
#header_join{
	color:red;
}
/* 판매자일시 */
#header_sellName{
	color:tomato;
}
/* 일반멤버일시 */
#header_memName{
	color:tomato;
}
/* 네비게이션 padding 조정 */
.nav_padding_modified{
	padding-top: 10px;
}
/* 세부조정 */
.nav_padding_modified_input{
	padding-top: 5px;
}
/* =============헤더관련 끝================ */
.col{
/*   	border:1px solid red;   */
}
</style>
<body>
<!-- 현재세션값 자바스크립트 넘기기-->
<span id="currentSession">${member.getMemId()}</span>

<!-- ======== 헤더시작 ============= -->
<div id="header_and_contents" class="container">
	<div class="row text-center">
		<div class="col col-lg-3"></div>
		<div class="col col-lg-3"></div>
		<div class="col">
			<div class="links">
				<c:choose> 
					<c:when test="${not empty member}">
					<!-- 일반회원 -->
						<strong><span id="header_memName">${member.getMemName()}</span>님</strong>
						<span>|</span>
						<strong><a href="/member/logout">로그아웃</a></strong>
						<span>|</span>
						<strong><a href="/myPage/myPageList?memId=${member.getMemId()}">마이페이지</a></strong>
						<span>|</span>
					</c:when> 
					<c:when test="${not empty seller}">
					<!-- 판매자회원 -->
						<strong><span id="header_sellName">${seller.getSelName()}</span>님</strong>
						<span>|</span>
						<strong><a href="/member/logout">로그아웃</a></strong>
						<span>|</span>
						<c:if test="${seller.getSelTypeGrade() eq 1}">
						<!-- 판매자회원이면서 권한이 유효해야함 -->
							<strong><a href="/seller/dedicated?selId=${seller.getSelId()}&selstlBrandName=${seller.getSelstlBrandName()}">판매자 전용 페이지</a></strong>
							<span>|</span>
						</c:if>
					</c:when> 
					<c:otherwise>
					<!-- 비로그인 -->
						<strong><a href="/member/join" id="header_join">회원가입</a></strong>
						<span>|</span>
						<strong><a href="/member/login">로그인</a></strong>
						<span>|</span>
					</c:otherwise> 
				</c:choose>
				<strong><a href="/board/client" id="header_board_tag" class="link_text">고객센터</a></strong>
			</div>
		</div>
	</div>
	<br />
	<div class="row">
		<div class="col col-lg-4 text-end">
			<a href="/" ><img id="mainLogo" src="/resources/pdimages/logo.png" class="img_logo" alt="" /></a>
		</div>
		<div class="col col-lg-4 text-center">
			<form action="/search/productList">
				<div id="searchBox_wrap" class="row">
					<div class="col">
						<input id="search_input_box" type="search" class="form-control" maxlength="225" tabindex="1" placeholder="검색어를 입력하세요" name="searchKeyWord"/>
					</div>
					<div class="col col-lg-2 text-start">
						<button type="submit" class="btn" tabindex="2"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#FC5603" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/></svg></button>
					</div>
				</div>
			</form>
		</div>
		<div class="col col-lg-4 text-center">
			<div class="row">
				<div class="col col-lg-2"></div>
				<div class="col">
					<div class="fav">
						<button id="enterFavorPage" type="button"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"><path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg></button>
					</div>
				</div>
				<div class="col">
					<div class="shopbasket">
						<button id="enterCartPage" type="button"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16"><path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/></svg></button>
					</div>
				</div>
				<div class="col col-lg-4"></div>
			</div>
		</div>
	</div>
	<div id="main_navBars" class="row">
		<div class="col col-lg-1"></div>
		<div class="nav_padding_modified col">
			<nav>
				<div id="menu">
					<ul class="main1">
						<li style="border: none;"><a href="" onclick="return false;"><b style="font-size: 15px;"><span style="font-size: 15px;">≡</span>카테고리</b></a>
							<ul class="main2">
								<li class="cate_li"><a href="/collections/mainPageCategory?cateName=과일">과일</a></li>
								<li class="cate_li"><a href="/collections/mainPageCategory?cateName=채소">채소</a></li>
								<li class="cate_li"><a href="/collections/mainPageCategory?cateName=쌀/잡곡">쌀/잡곡</a></li>
								<li class="cate_li"><a href="/collections/mainPageCategory?cateName=수산물">수산물</a></li>
								<li class="cate_li"><a href="/collections/mainPageCategory?cateName=축산/계란">축산/계란</a></li>
								<li class="cate_li"><a href="/collections/mainPageCategory?cateName=냉동/냉장/간편식">냉동/냉장/간편식</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="nav_padding_modified col text-center"><a href="/collections/newProduct"><strong>신상품</strong></a></div>
		<div class="nav_padding_modified col text-center"><a href="/collections/best"><strong>베스트</strong></a></div>
		<div class="nav_padding_modified col text-center"><a href="/collections/nowOnSale"><strong>할인/특가</strong></a></div>
		<div id="navSearchBox" class="nav_padding_modified_input col col-lg-2 text-center"><input id="navSearchBox_input" type="search" class="form-control" maxlength="225" tabindex="1" placeholder="검색어를 입력하세요" name="searchKeyWord"/></div>
		<div id="navSearchBoxBtn" class="nav_padding_modified_input col col-lg-1 text-start"><button id="navSearchBoxBtn_Btn" type="submit" class="btn" tabindex="2"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#FC5603" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/></svg></button></div>
		<div class="col col-lg-1"></div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<!-- =======헤더끝================= -->
	
<div class="container">
	<form action="/order/orderPage" class="form-horizontal" method="post">
		<div class="row text-center">
			<div class="col col-lg-4"></div>
			<div class="col">
				<h4><strong>장바구니</strong></h4>
			</div>
			<div class="col col-lg-4"></div>
		</div>
		<br />
		<br />
		<br />
		<div class="row">
			<div class="col col-lg-8">
				<div class="row">
					<hr class="strong_hr" />
					<div><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="skyblue" class="bi bi-droplet" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M7.21.8C7.69.295 8 0 8 0c.109.363.234.708.371 1.038.812 1.946 2.073 3.35 3.197 4.6C12.878 7.096 14 8.345 14 10a6 6 0 0 1-12 0C2 6.668 5.58 2.517 7.21.8zm.413 1.021A31.25 31.25 0 0 0 5.794 3.99c-.726.95-1.436 2.008-1.96 3.07C3.304 8.133 3 9.138 3 10a5 5 0 0 0 10 0c0-1.201-.796-2.157-2.181-3.7l-.03-.032C9.75 5.11 8.5 3.72 7.623 1.82z"/><path fill-rule="evenodd" d="M4.553 7.776c.82-1.641 1.717-2.753 2.093-3.13l.708.708c-.29.29-1.128 1.311-1.907 2.87l-.894-.448z"/></svg><strong>냉장 상품</strong></div>
					<div id="cartListRefrigerated"></div>
				</div>
				<div class="row">
					<hr class="strong_hr" />
					<div><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="blue" class="bi bi-snow" viewBox="0 0 16 16"><path d="M8 16a.5.5 0 0 1-.5-.5v-1.293l-.646.647a.5.5 0 0 1-.707-.708L7.5 12.793V8.866l-3.4 1.963-.496 1.85a.5.5 0 1 1-.966-.26l.237-.882-1.12.646a.5.5 0 0 1-.5-.866l1.12-.646-.884-.237a.5.5 0 1 1 .26-.966l1.848.495L7 8 3.6 6.037l-1.85.495a.5.5 0 0 1-.258-.966l.883-.237-1.12-.646a.5.5 0 1 1 .5-.866l1.12.646-.237-.883a.5.5 0 1 1 .966-.258l.495 1.849L7.5 7.134V3.207L6.147 1.854a.5.5 0 1 1 .707-.708l.646.647V.5a.5.5 0 1 1 1 0v1.293l.647-.647a.5.5 0 1 1 .707.708L8.5 3.207v3.927l3.4-1.963.496-1.85a.5.5 0 1 1 .966.26l-.236.882 1.12-.646a.5.5 0 0 1 .5.866l-1.12.646.883.237a.5.5 0 1 1-.26.966l-1.848-.495L9 8l3.4 1.963 1.849-.495a.5.5 0 0 1 .259.966l-.883.237 1.12.646a.5.5 0 0 1-.5.866l-1.12-.646.236.883a.5.5 0 1 1-.966.258l-.495-1.849-3.4-1.963v3.927l1.353 1.353a.5.5 0 0 1-.707.708l-.647-.647V15.5a.5.5 0 0 1-.5.5z"/></svg><strong>냉동 상품</strong></div>
					<div id="cartListFrozen"></div>
				</div>
				<div class="row">
					<hr class="strong_hr" />
					<div><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="orange" class="bi bi-brightness-high" viewBox="0 0 16 16"><path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/></svg><strong>상온 상품</strong></div>
					<div id="cartListRoomTemp"></div>
				</div>
			</div>
			<div id="ship_price_wrapper" class="col col-lg-4">
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col col-lg-2"></div>
							<div class="col text-center">
								<button type="button" id="regist_ship_btn" class="btn btn-outline-danger">배송지 등록하기</button>
							</div>
							<div class="col col-lg-2"></div>
						</div>
						<br />
						<div class="row">
							<div class="col col-lg-1"></div>
							<div class="col text-center">
								<input type="text" id="shipList_inputBox" name="shipDestination" placeholder="배송지를 등록하세요." readonly="readonly"/>
							</div>
							<div class="col col-lg-1"></div>
						</div>
					</div>
				</div>
				<br />
				<div id="priceWrapper" class="row">
					<div class="col">
						<div class="row">
							<div class="col col-lg-4">
								<p>상품할인금액</p>
							</div>
							<div class="col text-center">
								<input type="text" id="totalSalePrice" name="totalSalePrice" readonly="readonly"/><strong>원</strong>
							</div>
							<div class="col col-lg-2"></div>
						</div>
						<div class="row">
							<div class="col col-lg-4">
								<p>배송비</p>
							</div>
							<div class="col text-center">
								<input type="text" id="shippingPrice" readonly="readonly" value="0"/><strong>원</strong>
							</div>
							<div class="col col-lg-2"></div>
						</div>
						<div class="row">
							<div class="col col-lg-4">
								<p>결제예정금액</p>
							</div>
							<div class="col text-center">
								<input type="text" id="totalPrice" name="totalPrice" readonly="readonly"/><strong>원</strong>
							</div>
							<div class="col col-lg-2"></div>
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col col-lg-2"></div>
					<div class="col text-center">
						<button id="enter_order" class="btn btn-danger">주문하기</button>
					</div>
					<div class="col col-lg-2"></div>
				</div>
			</div>
		</div>
	</form>
</div>
</div> <!-- 헤더 따라오는 탭 때문에 넣은것 => id가header_and_contents인 최상위 div의 마침태그임 -->
<br />
<br />
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

<!-- 모달창-삭제버튼 -->
<div id="modal_delete" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
		<p>삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
     	<button type="button" id="modal_delete_btn" class="btn btn-danger" data-bs-dismiss="modal">삭제</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달창-배송지등록 -->
<div id="ship_list_modal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      	<div id="default_shipPoint"></div>
      </div>
      <div class="modal-body">
		<div id="ship_list_modal_body"></div>
      </div>
      <div class="modal-footer">
     	<button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="execDaumPostcode()">배송지 추가등록</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달창-경고문구 -->
<div id="modal_warn_msg" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
		<div id="warn_msg_content"></div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
//현재 세션값
let currentSession = $("#currentSession").text();

//전체 값
let totalPrice =0;
//전체할인공제가
let totalSalePrice = 0;

//초기 장바구니 리스트 생성
$(document).ready(function(){
	makeCartList();
});

//총액 설정 => 하단의 리스트 생성 AJAX에서 작업

// 장바구니 리스트만들기
function makeCartList(){
	$.ajax({
		type : "post",
		url : "/cart/getCartListByMemId",
		data : {
			memId : currentSession
		},
		success : function(result){
			// 핵심: 상품리스트와 장바구니리스트에 담긴 상품의 순서는 같음
			let prodResult = result.prodList;
			let cartList = result.cartList;
			
			let roomTempString = ""; //상온
			let refrigeratedString = ""; //냉장
			let frozenString = ""; //냉동
			
			totalPrice = 0; // 초기화
			totalSalePrice = 0; // 초기화
			
			for(let i=0;i<cartList.length;i++){
				if(prodResult[i].pdStorageType === "냉동"){
					frozenString += "<div class='row'>";
					frozenString += "<div class='col'>";
						frozenString += "<div class='row'>";
							frozenString += "<div class='col col-lg-5 text-center'>";
								frozenString += "<p><strong>["+prodResult[i].pdstlBrandName+"]</strong></p>";
							frozenString += '</div>';
							frozenString += "<div class='col'>";
								frozenString += "<a href='/goods/detailView?pdId="+prodResult[i].pdId+"'><strong>"+prodResult[i].pdName+"</strong></a>";
							frozenString += '</div>';
						frozenString += '</div>';
					frozenString += '</div>';
					/* 수량버튼추가 */
					frozenString+= "<div class='col col-lg-4'>";
					frozenString+= '<input type="hidden" name="pdValue'+cartList[i].caNo+'" value="'+prodResult[i].pdPrice+'">'; //증감기능에 상품가격 전달용도
					frozenString+= '<input type="hidden" name="pdSale'+cartList[i].caNo+'" value="'+prodResult[i].pdSale+'">'; //증감기능에 상품할인가 전달용도
					frozenString+= '<input type="hidden" name="caNo'+cartList[i].caNo+'" value="'+cartList[i].caNo+'">'; //AJAX에 pdId 전달용도
						frozenString += "<div class='row'>";
							frozenString += "<div class='col text-end padding_eliminate_right'>";
								if(cartList[i].caQuantity===1){
									frozenString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'" disabled="disabled"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>';
								}else{
									frozenString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>';
								}
							frozenString += "</div>";
							frozenString += "<div class='col col-lg-2 text-center'>";
								frozenString+= '<span class="pdQuantity'+cartList[i].caNo+'">'+cartList[i].caQuantity+'</span>';
							frozenString += "</div>";
							frozenString += "<div class='col text-start padding_eliminate_left'>";
								frozenString+= '<button type="button" class="cartQuantityPlus" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>';
							frozenString += "</div>";
						frozenString += "</div>";
					frozenString += "</div>";
					/* === */
					frozenString += "<div class='col col-lg-3'>";
						frozenString += "<div class='row'>";
							frozenString += "<div class='col col-lg-6 text-center'>";
								frozenString += "<span class='pdTotalPricePerOne"+cartList[i].caNo+"'>"+((prodResult[i].pdPrice)*((100-prodResult[i].pdSale)/100)*(cartList[i].caQuantity)).toLocaleString('ko-KR')+"원</span>";
							frozenString += "</div>";
							frozenString += "<div class='col col-lg-3'>";
								frozenString += '<button type="button" class="deleteBtn" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></button>';
							frozenString += "</div>";
						frozenString += "</div>";
					frozenString += "</div>";
					
					frozenString += "</div>";
					frozenString += "<hr/>";
					totalPrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(100-prodResult[i].pdSale)/100);
					totalSalePrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(prodResult[i].pdSale)/100);
				}
				if(prodResult[i].pdStorageType === "냉장"){
					refrigeratedString += "<div class='row'>";
					refrigeratedString += "<div class='col'>";
						refrigeratedString += "<div class='row'>";
							refrigeratedString += "<div class='col col-lg-5 text-center'>";
								refrigeratedString += "<p><strong>["+prodResult[i].pdstlBrandName+"]</strong></p>";
							refrigeratedString += '</div>';
							refrigeratedString += "<div class='col'>";
								refrigeratedString += "<a href='/goods/detailView?pdId="+prodResult[i].pdId+"'><strong>"+prodResult[i].pdName+"</strong></a>";
							refrigeratedString += '</div>';
						refrigeratedString += '</div>';
					refrigeratedString += '</div>';
					/* 수량버튼추가 */
					refrigeratedString += "<div class='col col-lg-4'>";
					refrigeratedString+= '<input type="hidden" name="pdValue'+cartList[i].caNo+'" value="'+prodResult[i].pdPrice+'">'; //증감기능에 상품가격 전달용도
					refrigeratedString+= '<input type="hidden" name="pdSale'+cartList[i].caNo+'" value="'+prodResult[i].pdSale+'">'; //증감기능에 상품할인가 전달용도
					refrigeratedString+= '<input type="hidden" name="caNo'+cartList[i].caNo+'" value="'+cartList[i].caNo+'">'; //AJAX에 pdId 전달용도
						refrigeratedString += "<div class='row'>";
							refrigeratedString += "<div class='col text-end padding_eliminate_right'>";
								if(cartList[i].caQuantity===1){
									refrigeratedString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'" disabled="disabled"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>';
								}else{
									refrigeratedString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>';
								}
							refrigeratedString += "</div>";
							refrigeratedString += "<div class='col col-lg-2 text-center'>";
								refrigeratedString+= '<span class="pdQuantity'+cartList[i].caNo+'">'+cartList[i].caQuantity+'</span>';
							refrigeratedString += "</div>";
							refrigeratedString += "<div class='col text-start padding_eliminate_left'>";
								refrigeratedString+= '<button type="button" class="cartQuantityPlus" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>';
							refrigeratedString += "</div>";
						refrigeratedString += "</div>";
					refrigeratedString += "</div>";
					/* === */
					refrigeratedString += "<div class='col col-lg-3'>";
						refrigeratedString += "<div class='row'>";
							refrigeratedString += "<div class='col col-lg-6 text-center'>";
								refrigeratedString += "<span class='pdTotalPricePerOne"+cartList[i].caNo+"'>"+((prodResult[i].pdPrice)*((100-prodResult[i].pdSale)/100)*(cartList[i].caQuantity)).toLocaleString('ko-KR')+"원</span>";
							refrigeratedString += "</div>";
							refrigeratedString += "<div class='col col-lg-3'>";
								refrigeratedString += '<button type="button" class="deleteBtn" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></button>';
							refrigeratedString += "</div>";
						refrigeratedString += "</div>";
					refrigeratedString += "</div>";
					
					refrigeratedString += "</div>";
					refrigeratedString += "<hr/>";
					totalPrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(100-prodResult[i].pdSale)/100);
					totalSalePrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(prodResult[i].pdSale)/100);
				}
				if(prodResult[i].pdStorageType === "상온"){
					roomTempString += "<div class='row'>";
					roomTempString += "<div class='col'>";
						roomTempString += "<div class='row'>";
							roomTempString += "<div class='col col-lg-5 text-center'>";
								roomTempString += "<p><strong>["+prodResult[i].pdstlBrandName+"]</strong></p>";
							roomTempString += '</div>';
							roomTempString += "<div class='col'>";
								roomTempString += "<a href='/goods/detailView?pdId="+prodResult[i].pdId+"'><strong>"+prodResult[i].pdName+"</strong></a>";
							roomTempString += '</div>';
						roomTempString += '</div>';
					roomTempString += '</div>';
					/* 수량버튼추가 */
					roomTempString += "<div class='col col-lg-4'>";
					roomTempString+= '<input type="hidden" name="pdValue'+cartList[i].caNo+'" value="'+prodResult[i].pdPrice+'">'; //증감기능에 상품가격 전달용도
					roomTempString+= '<input type="hidden" name="pdSale'+cartList[i].caNo+'" value="'+prodResult[i].pdSale+'">'; //증감기능에 상품할인가 전달용도
					roomTempString+= '<input type="hidden" name="caNo'+cartList[i].caNo+'" value="'+cartList[i].caNo+'">'; //AJAX에 pdId 전달용도
						roomTempString += "<div class='row'>";
							roomTempString += "<div class='col text-end padding_eliminate_right'>";
								if(cartList[i].caQuantity===1){
									roomTempString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'" disabled="disabled"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>';
								}else{
									roomTempString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>';
								}
							roomTempString += "</div>";
							roomTempString += "<div class='col col-lg-2 text-center'>";
								roomTempString+= '<span class="pdQuantity'+cartList[i].caNo+'">'+cartList[i].caQuantity+'</span>';
							roomTempString += "</div>";
							roomTempString += "<div class='col text-start padding_eliminate_left'>";
								roomTempString+= '<button type="button" class="cartQuantityPlus" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button></td>';
							roomTempString += "</div>";
						roomTempString += "</div>";
					roomTempString += "</div>";
					/* === */
					roomTempString += "<div class='col col-lg-3'>";
						roomTempString += "<div class='row'>";
							roomTempString += "<div class='col col-lg-6 text-center'>";
								roomTempString += "<span class='pdTotalPricePerOne"+cartList[i].caNo+"'>"+((prodResult[i].pdPrice)*((100-prodResult[i].pdSale)/100)*(cartList[i].caQuantity)).toLocaleString('ko-KR')+"원</span>";
							roomTempString += "</div>";
							roomTempString += "<div class='col col-lg-3'>";
								roomTempString += '<button type="button" class="deleteBtn" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></button>';
							roomTempString += "</div>";
						roomTempString += "</div>";
					roomTempString += "</div>";
					
					roomTempString += "</div>";
					roomTempString += "<hr/>";
					totalPrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(100-prodResult[i].pdSale)/100);
					totalSalePrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(prodResult[i].pdSale)/100);
				}
			}
			
			roomTempString += ""; 
			refrigeratedString += "</table>"; 
			frozenString += "</table>"; 
			
			$("#cartListFrozen").html(frozenString);
			$("#cartListRefrigerated").html(refrigeratedString);
			$("#cartListRoomTemp").html(roomTempString);
			
			//총액 계산
			$("#totalPrice").val(totalPrice.toLocaleString('ko-KR'));
			$("#totalSalePrice").val(totalSalePrice.toLocaleString('ko-KR'));
		}// success 종료
	}); // ajax 종료	
}


//장바구니 삭제버튼 - 모달 띄우기
let caNo; //삭제할 기본키
$(document).on('click', '.deleteBtn', function(){
	$("#modal_delete").modal("show");
	caNo = $(this).val();
});

//삭제모달 삭제 버튼
$("#modal_delete_btn").click(function(){
	$.ajax({
		type : "post",
		url : "/cart/deleteCart",
		data : {
			caNo : caNo
		},
		success : function(result){
			makeCartList(); //리스트 재설정
		}// success 종료
	}); // ajax 종료	
});

// ---수량증감---
//현재 뺴기 버튼에만 name속성 부여
// 증가
$(document).on('click', '.cartQuantityPlus', function(){
	let tempVal = $(this).val();
	let currentVal = Number($("span[class=pdQuantity"+tempVal+"]").text());
	$("span[class=pdQuantity"+tempVal+"]").text(currentVal+1);
	//전체값 업데이트
	let pdPrice = Number($("input[name=pdValue"+tempVal+"]").val()); //1개당가격
	let pdSale = Number($("input[name=pdSale"+tempVal+"]").val()); //1개당 할인율
	totalPrice += pdPrice*(100-pdSale)/100; //한개 추가되었으므로 1개 가격만큼 증가시킨다.
	totalSalePrice += pdPrice*(pdSale)/100;
	$("#totalPrice").val(totalPrice.toLocaleString('ko-KR')); //화면에 반영
	$("#totalSalePrice").val(totalSalePrice.toLocaleString('ko-KR')); //화면에 반영
	
	//각각 행별 값
	let pricePerOne = Number($("span[class=pdQuantity"+tempVal+"]").text()) * (pdPrice*(100-pdSale)/100);
	$(".pdTotalPricePerOne"+tempVal).text(pricePerOne.toLocaleString('ko-KR')+"원");
	// 수량이 2이상이면 마이너스 버튼 재활성화
	if(currentVal===1){$("button[name="+tempVal+"]").attr("disabled",false);}
	
	//AJAX로 DB에 반영
	let caNo = $("input[name=caNo"+tempVal+"]").val();
	let state = "plus"; // 현재 증가인지 감소인지 알려줌
	$.ajax({
		type : "post",
		url : "/cart/modifyCartQuantity",
		data : {
			caNo : caNo,
			state : state
		},
		success : function(rst){
			
		}// success 종료
	}); // ajax 종료
});
// 감소
$(document).on('click', '.cartQuantityMinus', function(){
	let tempVal = $(this).val();
	let currentVal = Number($("span[class=pdQuantity"+tempVal+"]").text());
	$("span[class=pdQuantity"+tempVal+"]").text(currentVal-1);
	//전체값 업데이트
	let pdPrice = Number($("input[name=pdValue"+tempVal+"]").val());
	let pdSale = Number($("input[name=pdSale"+tempVal+"]").val()); //1개당 할인율
	totalPrice -= pdPrice*(100-pdSale)/100; //한개 추가되었으므로 1개 가격만큼 감소시킨다.
	totalSalePrice -= pdPrice*(pdSale)/100;
	$("#totalPrice").val(totalPrice.toLocaleString('ko-KR')); //화면에 반영
	$("#totalSalePrice").val(totalSalePrice.toLocaleString('ko-KR')); //화면에 반영
	
	//각각 행별 값
	let pricePerOne = Number($("span[class=pdQuantity"+tempVal+"]").text()) * (pdPrice*(100-pdSale)/100);
	$(".pdTotalPricePerOne"+tempVal).text(pricePerOne.toLocaleString('ko-KR')+"원");
	//2이면 1로 줄며 동시에 버튼 무력화
	if(currentVal===2){ $("button[name="+tempVal+"]").attr("disabled",true);}
	
	//AJAX로 DB에 반영
	let caNo = $("input[name=caNo"+tempVal+"]").val();
	let state = "minus"; // 현재 증가인지 감소인지 알려줌
	$.ajax({
		type : "post",
		url : "/cart/modifyCartQuantity",
		data : {
			caNo : caNo,
			state : state
		},
		success : function(rst){
			
		}// success 종료
	}); // ajax 종료
});


/* ====배송지 관련==== */
 
//배송지등록 모달 띄우기
$("#regist_ship_btn").click(function(){
	$("#ship_list_modal").modal("show");
});

//초기 배송지 세팅
$(document).ready(function(){
	setShipList(currentSession);
});


//배송지 세팅 함수
function setShipList(memId){
	$.ajax({
		type : "post",
		url : "/cart/setShipList",
		data : {
			memId : currentSession
		},
		success : function(result){
			let defaultAddress = "<strong>기본 배송지</strong></br>"+result.defaultAddress; //기본주소
			defaultAddress += "<button class='defaultAddress_btn btn btn-outline-secondary' value='"+result.defaultAddress+"'>선택</button>";
			
			let shipList = result.shipList; //다른 배송지 주소들
			
			let shipListString = "<table><tr><th>등록된 배송지</th></tr>";
			$.each(shipList, function(key, value) {
				shipListString += "<tr>";
				shipListString += "<td>"+value.slAddress+"</td>"
				shipListString += "<td><button class='shipList btn btn-outline-secondary' value='"+value.slAddress+"'>선택</button></td>"
				shipListString += "</tr>";
            });
			shipListString += "</table>";
			
			$("#default_shipPoint").html(defaultAddress);
			$("#ship_list_modal_body").html(shipListString);
		}// success 종료
	}); // ajax 종료
}

//배송지 선택버튼 - 기본
$(document).on('click', '.defaultAddress_btn', function(){
	let addressVal = $(this).val();
	$("#shipList_inputBox").val(addressVal);
	$("#ship_list_modal").modal("hide");
});

//배송지 선택버튼 - 나머지
$(document).on('click', '.shipList', function(){
	let addressVal = $(this).val();
	$("#shipList_inputBox").val(addressVal);
	$("#ship_list_modal").modal("hide");
});


/* 주소 + 다음주소API */
// 다음API + 테이블에 추가까지 수행
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                
                // 원래주소 + 참고주소
                addr += extraAddr;
            } else {
            	addr += extraAddr;
            }
            if(addr != ""){
                let finalAddress = data.zonecode + " " + addr
                // 배송지 리스트에 추가하는 AJAX
                $.ajax({
					type : "post",
					url : "/cart/addShipList",
					data : {
						finalAddress : finalAddress,
						memId : currentSession
					},
					success : function(result){
						//배송지추가 성공 -> 모달의 배송리스트 재조정
						setShipList(currentSession);
						$("#ship_list_modal").modal("show"); //다시 모달 띄우기
					}// success 종료
				}); // ajax 종료
            }else{
            	// 우편 폼만 열고 X 누른경우임 ( 문자열이 0 )
            }
            
        }
    }).open();
    
} //function end


/* 주소입력 + 상품총가격이 0보다 높아야 버튼 먹힘 */
$("#enter_order").click(function(){
	if($("#shipList_inputBox").val() == ""){$("#warn_msg_content").html("<p>배송지를 등록하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if(totalPrice === 0){$("#warn_msg_content").html("<p>상품을 담아 주세요.</p>");$("#modal_warn_msg").modal("show");return false;}
	let shipDestination = $("#shipList_inputBox").val();
});
/* 헤더관련  - 시작*/
//모달창에서 로그인 버튼
$("#warn_modal_login").click(function(){
	location.href = "/member/login";
});
//장바구니 버튼 클릭
$("#enterCartPage").click(function(){
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	location.href="/cart/enterCartPage";
});
//찜하기 버튼 클릭
$("#enterFavorPage").click(function(){
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	location.href="/myPage/myPageList";
});
//고객센터 버튼 클릭
$("#header_board_tag").click(function(){
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
});
//스크롤관련
let scrollPosition = Math.ceil($("#searchBox_wrap").offset().top);
$(window).scroll(function(){
	if(window.scrollY >= scrollPosition) {
		$("#navSearchBox").css("display","block");
		$("#navSearchBoxBtn").css("display","block");
	}else{
		$("#navSearchBox").css("display","none");
		$("#navSearchBoxBtn").css("display","none");
	}
});

$("#navSearchBoxBtn_Btn").click(()=>{
	let navSearchKeyWord = $("#navSearchBox_input").val();
	location.href="/search/productList?searchKeyWord="+navSearchKeyWord;
});
/* 헤더관련  - 끝*/
</script>
</html>