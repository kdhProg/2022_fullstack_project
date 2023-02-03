<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>마이페이지</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 헤더, 풋터 CSS 링크 -->
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
</head>
<style>
#plListBt, #slListBt, #favListBt, #memUpdateBt, #quListBt, #rvListBt{
	text-decoration: none;
}

.sessionMemIdOrder, .sessionMemIdShip, .sessionMemIdFavor, .sessionMemIdReview, .sessionMemIdQuiry{
	display: none;
}
a {
	text-decoration: none;
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
/* 등급-기본 */
#grade_Friend{
	width: 70px;
	height: 50px;
	border:2px solid #FC5603;
	border-radius: 10%;
	box-shadow: 0px 0px 1px 1px #FC5603;
	color:#FC5603;
}
/* 등급-VIP */
#grade_VIP{
	width: 70px;
	height: 50px;
	border:2px solid silver;
	border-radius: 10%;
	box-shadow: 0px 0px 1px 1px silver;
	color:silver;
}
/* 등급-VVIP */
#grade_VVIP{
	width: 70px;
	height: 50px;
	border:2px solid gold;
	border-radius: 10%;
	box-shadow: 0px 0px 1px 1px gold;
	color:gold;
}
/* 마진/패딩 조정 */
.grade_String{
	margin-top:10px;
}
#mem_name_string{
	margin-top:10px;
	font-size: 1.2em;
}
#saved_money_percent{
	margin-top: 7px;
}
/* 회색배경 */
#simple_member_infos{
	padding-top:30px;
	padding-bottom:30px;
	background: #FAFAFA;
}
/* 각각요소 흰색배경 */
#grade_name_svPercent,#saved_money_entire_wrapper{
	padding-top:10px;
	background: white;
	padding-bottom:10px;
}
/* 적립금 표시 */
#savedMoney{
	color:#fc5603;
	font-weight: bold;
	font-size: 2em;
}

/* 적립금 파트 마진 추가조정 */
#saved_money_label{
	margin-top: 15px;
	margin-bottom: 10px;
	margin-left: 30px;
}
#saved_money_show{
	margin-left: 30px;
}

/* 버튼장식제거 */
.favor_deleteBtn,.cartQuantityPlus,.cartQuantityMinus{
	border: none;
	background: transparent;
}

.col{
/* 	border: 1px solid blue; */
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
	<!-- =======헤더끝================= -->

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
	<!-- 회원개인정보 개요 -->
	<div id="simple_member_infos" class="row">
		<div class="col col-lg-3"></div>
		<div id="grade_name_svPercent" class="col">
			<div class="row">
				<div id="mem_grade" class="col col-lg-3">
					<c:if test="${member.getMemGrade() eq 'Friend'}">
						<div id="grade_Friend" class="text-center"><div class="grade_String"><strong>Friend</strong></div></div>
					</c:if>
					<c:if test="${member.getMemGrade() eq 'VIP'}">
						<div id="grade_VIP" class="text-center"><div class="grade_String"><strong>VIP</strong></div></div>
					</c:if>
					<c:if test="${member.getMemGrade() eq 'VVIP'}">
						<div id="grade_VVIP" class="text-center"><div class="grade_String"><strong>VVIP</strong></div></div>
					</c:if>
				</div>
				<div id="mem_name" class="col col-lg-9">
					<div id="mem_name_string">
						<strong>${member.getMemName()}</strong><span>님</span>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div id="saved_money_percent" class="col">
					<c:if test="${member.getMemGrade() eq 'Friend'}">
						<span>적립 5%</span>
					</c:if>
					<c:if test="${member.getMemGrade() eq 'VIP'}">
						<span>적립 10%</span>
					</c:if>
					<c:if test="${member.getMemGrade() eq 'VVIP'}">
						<span>적립 20%</span>
					</c:if>
				</div>
				<div id="saved_btn" class="col">
					<button id="showSavedMoneyBtn" class="btn btn-outline-secondary">적립기준 보기</button>
				</div>
			</div>
		</div>
		<div id="saved_money_entire_wrapper" class="col">
			<div class="row">
				<div id="saved_money_label" class="col">
					<span><b>적립금</b></span>
				</div>
			</div>
			<div class="row">
				<div id="saved_money_show" class="col">
					<span id="savedMoney"></span><span><b>원</b></span>
				</div>
			</div>
		</div>
		<div class="col col-lg-3"></div>
	</div>
	
<!-- 주문 내역-->	
	<div id="plDiv" style="display : show;">
		<span class="sessionMemIdOrder">${member.getMemId()}</span>
		<div id="plResultList"></div>
		<div id="plResultPagingNo"></div>
	</div>
	
<!-- 배송지 -->	
<form name="insertForm" method="post" action="/myPage/shipInsertView">
	<div id="slDiv" style="display : none;">
		<br />
		<div class="row">
			<div class="col text-end">
				<button type="submit" class="btn btn-outline-danger">배송지 등록</button>
			</div>
		</div>
		<span class="sessionMemIdShip">${member.getMemId()}</span>
		<div id="slResultList"></div>
		<div id="slResultPagingNo"></div>
	</div>
</form>	
	
<!-- 찜 -->	
	<div id="favDiv" style="display : none;">
		<span class="sessionMemIdFavor">${member.getMemId()}</span>
		<div id="favResultList"></div>
		<div id="favResultPagingNo"></div>
	</div>
	
<!-- 상품후기 -->	
	<div id="rvDiv" style="display : none;">
		<span class="sessionMemIdReview">${member.getMemId()}</span>
		<div id="rvResultList"></div>
		<div id="rvResultPagingNo"></div>
	</div>	
	
<!-- 상품문의 -->	
	<div id="quDiv" style="display : none;">
		<span class="sessionMemIdQuiry">${member.getMemId()}</span>
		<div id="quResultList"></div>
		<div id="quResultPagingNo"></div>
	</div>		
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

<!-- 모달창-적립기준-->
<div id="show_savedMoney_modal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header text-center">
      	<strong>등급 기준</strong>
      </div>
      <div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col">
					<div id="grade_VVIP" class="text-center"><div class="grade_String"><strong>VVIP</strong></div></div>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col">
					<b>전월 500,000원이상 결제</b>
				</div>
				<div class="col">
					<b>적립 20%</b>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div id="grade_VIP" class="text-center"><div class="grade_String"><strong>VIP</strong></div></div>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col">
					<b>전월 200,000원이상 결제</b>
				</div>
				<div class="col">
					<b>적립 10%</b>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div id="grade_Friend" class="text-center"><div class="grade_String"><strong>Friend</strong></div></div>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col">
					<b>제한없음</b>
				</div>
				<div class="col">
					<b>적립 5%</b>
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달창-찜 삭제 -->
<div id="fv_delete_modal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
		<p>찜목록에서 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
     	<button type="button" id="fv_delete_modal_btn" class="btn btn-danger" data-bs-dismiss="modal">삭제</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
//현재 세션값
let currentSession = $("#currentSession").text();
/********************* 주문내역 *******************************************************************/
let memIdType1 = $(".sessionMemIdOrder").text();
$(document).ready(purchaseList(1, memIdType1));
function purchaseList(pageNo, plmemId) {
	$.ajax({
        url : "/myPage/purchase",
        type : "get",
        data : {
        	showPage : pageNo,
        	plmemId : plmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var purchasePageList = data.purchaseList; // model 처럼
        	
            var purchaseContentTag = "<table class='table'><tr><th>No</th><th>주문 번호</th><th>상품 ID</th><th>수량</th><th>가격</th><th>적립금</th><th>결제방식</th><th>배송지</th><th>주문 상태</th><th>주문 날짜</th></tr>";
            var purchasePagingTag = "";

			$.each(purchasePageList, function(key, value) {
				purchaseContentTag += "<tr>";
				purchaseContentTag += "<td>"+value.plNo+"</td>";
				purchaseContentTag += "<td>"+value.plOrderNo+"</td>";
				purchaseContentTag += "<td><a href='/goods/detailView?pdId="+value.plpdId+"'class='btn btn-danger'>"+value.plpdId+"</td>";
				purchaseContentTag += "<td>"+value.plPdQuantity+"</td>";
				purchaseContentTag += "<td>"+value.plTotalPrice+"</td>";
				purchaseContentTag += "<td>"+value.plSavedMoney+"</td>";
				purchaseContentTag += "<td>"+value.plPayWay+"</td>";
				purchaseContentTag += "<td>"+value.plShipAddInfo+"</td>";
				purchaseContentTag += "<td>"+value.plOrderState+"</td>";
				purchaseContentTag += "<td>"+value.plDate+"</td>";
             });
			purchaseContentTag += "</table>";
			$("#plResultList").html(purchaseContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				purchasePagingTag+="<a href='#' onclick='purchaseList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType1 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					purchasePagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					purchasePagingTag+="<a href='#' onclick='purchaseList(" + i + ", \""+ memIdType1 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				purchasePagingTag+="<a href='#' onclick='purchaseList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType1 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#plResultPagingNo").html(purchasePagingTag); //페이징 적용
        },
        error : function(){
             alert('error - purchaseList');
        }//error
    });//ajax
}// function end

/********************* 배송지 *******************************************************************/
let memIdType2 = $(".sessionMemIdShip").text();
$(document).ready(myShipList(1, memIdType2));
function myShipList(pageNo, slmemId) {
	$.ajax({
        url : "/myPage/shipList",
        type : "get",
        data : {
        	showPage : pageNo,
        	slmemId : slmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var shipPageList = data.myShipList; // model 처럼
        	
            var shipContentTag = "<table class='table'><tr><th>No</th><th>주소</th></tr>";
            var shipPagingTag = "";

			$.each(shipPageList, function(key, value) {
				shipContentTag += "<tr>";
				shipContentTag += "<td><a href='/myPage/shipOne?slNo="+value.slNo+"'class='btn btn-danger'>"+value.slNo+"</a></td>";
				shipContentTag += "<td>"+value.slAddress+"</td>";
             });
			shipContentTag += "</table>";
			$("#slResultList").html(shipContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				shipPagingTag+="<a href='#' onclick='myShipList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType2 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					shipPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					shipPagingTag+="<a href='#' onclick='myShipList(" + i + ", \""+ memIdType2 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				shipPagingTag+="<a href='#' onclick='myShipList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType2 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#slResultPagingNo").html(shipPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - myShipList');
        }//error
    });//ajax
}// function end

/********************* 찜목록 *******************************************************************/
let memIdType3 = $(".sessionMemIdFavor").text();
$(document).ready(myFavorList(1, memIdType3));
function myFavorList(pageNo, fvmemId) {
	$.ajax({
        url : "/myPage/favorList",
        type : "get",
        data : {
        	showPage : pageNo,
        	fvmemId : fvmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var favorPageList = data.myFavorList; // model 처럼
        	
            var favorContentTag = "<table class='table'><tr><th>No</th><th>아이디</th><th>상품 아이디</th><th>삭제</th></tr>";
            var favorPagingTag = "";

			$.each(favorPageList, function(key, value) {
				favorContentTag += "<tr>";
				favorContentTag += "<td>"+value.fvNo+"</td>";
				favorContentTag += "<td>"+value.fvmemId+"</td>";
				favorContentTag += "<td><a href='/goods/detailView?pdId="+value.fvpdId+"'class='btn btn-danger'>"+value.fvpdId+"</a></td>";
				favorContentTag += '<td><button type="button" class="favor_deleteBtn" value="'+value.fvpdId+'"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></button></td>';
             });
			favorContentTag += "</table>";
			$("#favResultList").html(favorContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				favorPagingTag+="<a href='#' onclick='myFavorList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType3 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					favorPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					favorPagingTag+="<a href='#' onclick='myFavorList(" + i + ", \""+ memIdType3 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				favorPagingTag+="<a href='#' onclick='myFavorList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType3 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#favResultPagingNo").html(favorPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - myFavorList');
        }//error
    });//ajax
}// function end



//삭제 버튼 누를시 모달 띄우기 fv_delete_modal_btn
let fvNo; //삭제할 기본키
$(document).on('click', '.favor_deleteBtn', function(){
	$("#fv_delete_modal").modal("show");
	fvNo = $(this).val();
});

//삭제모달 삭제 버튼
$("#fv_delete_modal_btn").click(function(){
	$.ajax({
		type : "post",
		url : "/goods/deleteFavors",
		data : {
			currentSession : currentSession,
			pdId : fvNo
		},
		success : function(){
			//찜목록 다시띄우기
			myFavorList(1, memIdType3)
		}// success 종료
	}); // ajax 종료	
});

/********************* 상품 후기 *******************************************************************/
let memIdType4 = $(".sessionMemIdReview").text();
$(document).ready(myReviewList(1, memIdType4));
function myReviewList(pageNo, rvmemId) {
	$.ajax({
        url : "/myPage/reviewList",
        type : "get",
        data : {
        	showPage : pageNo,
        	rvmemId : rvmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var reviewPageList = data.myReviewList; // model 처럼
        	
            var reviewContentTag = "<table class='table'><tr><th>No</th><th>상품 아이디</th><th>내용</th><th>이미지</th><th>추천수</th><th>신고수</th><th>등록일</th></tr>";
            var reviewPagingTag = "";

			$.each(reviewPageList, function(key, value) {
				reviewContentTag += "<tr>";
				reviewContentTag += "<td><a href='/myPage/reviewOne?rvNo="+value.rvNo+"'class='btn btn-danger'>"+value.rvNo+"</a></td>";
				reviewContentTag += "<td><a href='/goods/detailView?pdId="+value.rvpdId+"'class='btn btn-danger'>"+value.rvpdId+"</a></td>";
				reviewContentTag += "<td>"+value.rvContent+"</td>";
				reviewContentTag += "<td>"+value.rvImg+"</td>";
				reviewContentTag += "<td>"+value.rvNice+"</td>";
				reviewContentTag += "<td>"+value.rvReport+"</td>";
				reviewContentTag += "<td>"+value.rvUpdDate+"</td>";
             });
			reviewContentTag += "</table>";
			$("#rvResultList").html(reviewContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				reviewPagingTag+="<a href='#' onclick='myReviewList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType4 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					reviewPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					reviewPagingTag+="<a href='#' onclick='myReviewList(" + i + ", \""+ memIdType4 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				reviewPagingTag+="<a href='#' onclick='myReviewList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType4 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#rvResultPagingNo").html(reviewPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - myReviewList');
        }//error
    });//ajax
}// function end

/********************* 상품 문의 *******************************************************************/
let memIdType5 = $(".sessionMemIdQuiry").text();
$(document).ready(myQuiryList(1, memIdType5));
function myQuiryList(pageNo, iqmemId) {
	$.ajax({
        url : "/myPage/quiryList",
        type : "get",
        data : {
        	showPage : pageNo,
        	iqmemId : iqmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var quiryPageList = data.myQuiryList; // model 처럼
        	
            var quiryContentTag = "<table class='table'><tr><th>No</th><th>상품 아이디</th><th>제목</th><th>답변 상태</th><th>등록일</th></tr>";
            var quiryPagingTag = "";

			$.each(quiryPageList, function(key, value) {
				quiryContentTag += "<tr>";
				quiryContentTag += "<td><a href='/myPage/quiryOne?iqNo="+value.iqNo+"'class='btn btn-danger'>"+value.iqNo+"</a></td>";
				quiryContentTag += "<td><a href='/goods/detailView?pdId="+value.iqpdId+"'class='btn btn-danger'>"+value.iqpdId+"</a></td>";
				quiryContentTag += "<td>"+value.iqTitle+"</td>";
				if(value.iqState === 1){quiryContentTag += "<td><p style='color:green;'><strong>답변완료</strong><p></td>";}else{quiryContentTag += "<td><p><strong>처리대기중</strong><p></td>";}
				quiryContentTag += "<td>"+value.iqRegiDate+"</td>";
             });
			quiryContentTag += "</table>";
			$("#quResultList").html(quiryContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				quiryPagingTag+="<a href='#' onclick='myQuiryList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType5 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					quiryPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					quiryPagingTag+="<a href='#' onclick='myQuiryList(" + i + ", \""+ memIdType5 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				quiryPagingTag+="<a href='#' onclick='myQuiryList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType5 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#quResultPagingNo").html(quiryPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - myQuiryList');
        }//error
    });//ajax
}// function end
$("#plListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#plDiv').css('display', 'block');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
	$("#rvListBt").css('font-weight', 'normal');
	$('#rvDiv').css('display', 'none');
	$("#quListBt").css('font-weight', 'normal');
	$('#quDiv').css('display', 'none');
});
$("#slListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#slDiv').css('display', 'block');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
	$("#rvListBt").css('font-weight', 'normal');
	$('#rvDiv').css('display', 'none');
	$("#quListBt").css('font-weight', 'normal');
	$('#quDiv').css('display', 'none');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
});
$("#favListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#favDiv').css('display', 'block');
	$("#rvListBt").css('font-weight', 'normal');
	$('#rvDiv').css('display', 'none');
	$("#quListBt").css('font-weight', 'normal');
	$('#quDiv').css('display', 'none');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
});
$("#rvListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#rvDiv').css('display', 'block');
	$("#quListBt").css('font-weight', 'normal');
	$('#quDiv').css('display', 'none');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
});
$("#quListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#quDiv').css('display', 'block');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
	$("#rvListBt").css('font-weight', 'normal');
	$('#rvDiv').css('display', 'none');
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

// 적립기준 모달 보여주기
$("#showSavedMoneyBtn").click(()=>{
	$("#show_savedMoney_modal").modal("show");
});

// 누적적립금 보여주기
$(document).ready(()=>{
	$.ajax({
		type : "post",
		url : "/myPage/getSavedMoneyBymemId",
		data : {
			memId : currentSession
		},
		success : function(rst){
			let savedMoney = rst;
			$("#savedMoney").text(Number(savedMoney).toLocaleString('ko-KR'));
			
		}// success 종료
	}); // ajax 종료
});
</script>	
</html>