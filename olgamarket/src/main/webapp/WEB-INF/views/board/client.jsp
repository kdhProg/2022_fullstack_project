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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 헤더, 풋터 CSS 링크 -->
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
<style>
#noticeBt,#faqBt,#onetooneBt{
	text-decoration: none;
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
	    <a href="#" onclick="noticeList(1);return false;" id="noticeBt" aria-current="page" class="nav-link"  href="#">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a href="#" onclick="faqList(1);return false;" id="faqBt" class="nav-link">FAQ</a>
	  </li>
	  <li class="nav-item">
		<a href="#" onclick="otList(1);return false;" id="onetooneBt" class="nav-link">1 : 1 문의</a>
	  </li>
	</ul>
	
	<!-- 공지사항 -->	
		<div id="noticeDiv" style="display : show;">
			<div id="noticeResultList"></div>
			<div id="noticeResultPagingNo"></div>
		</div>
	
	<!-- faq -->	
		<div id="faqDiv" style="display : none;">
		<a href="#" onclick="sortFaqList('defaultCate');return false;" id="categoryBt1" class="btn btn-light">전체</a>
		<a href="#" onclick="sortFaqList('주문/결제');return false;" id="categoryBt2" class="btn btn-light">주문/결제</a>
		<a href="#" onclick="sortFaqList('취소/교환/환불');return false;" id="categoryBt3" class="btn btn-light">취소/교환/환불</a>
		<a href="#" onclick="sortFaqList('회원');return false;" id="categoryBt5" class="btn btn-light">회원</a>
			<div id="faqResultList"></div>
			<div id="faqResultPagingNo"></div>
		</div>
		
	<!-- 1대1 문의 -->	
	<form name="insertForm" method="post" action="/board/otqInsertView">	
		<div id="otoDiv" style="display : none;">
		<br />
		<div class="row">
			<div class="col text-end">
				<button type="submit" class="btn btn-outline-danger">등록</button>
			</div>
		</div>
		<a href="#" onclick="sortList(1);return false;" id="sortBtn1" class="btn btn-light">답변 대기</a>
		<a href="#" onclick="sortList(2);return false;" id="sortBtn2" class="btn btn-light">답변 완료</a>
			<div id="otoResultList"></div>
			<div id="otoResultPagingNo"></div>
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
let currentSession = $("#currentSession").text();
/********************* 공지사항 *******************************************************************/
$(document).ready(noticeList(1));
function noticeList(pageNo) {
	$.ajax({
        url : "/board/noticeList",
        type : "get",
        data : {
        	showPage : pageNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var noticePageList = data.noticeList; // model 처럼
        	
            var noticeContentTag = "<table class='table'><tr><th>No</th><th>제목</th><th>작성자</th><th>등록일</th></tr>";
            var noticePagingTag = "";

			$.each(noticePageList, function(key, value) {
				noticeContentTag += "<tr>";
				noticeContentTag += "<td><a href='/board/noticeOne?ntNo="+value.ntNo+"'class='btn btn-danger'>"+value.ntNo+"</a></td>";
				noticeContentTag += "<td>"+value.ntTitle+"</td>";
				noticeContentTag += "<td>"+value.ntadmId+"</td>";
				noticeContentTag += "<td>"+value.ntUpdDate.substring(0,10)+"</td>";
				noticeContentTag += "</tr>";                
             });
			noticePagingTag += "</table>";
			$("#noticeResultList").html(noticeContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				noticePagingTag+="<a href='#' onclick='noticeList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					noticePagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					noticePagingTag+="<a href='#' onclick='noticeList(" + i + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				noticePagingTag+="<a href='#' onclick='noticeList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#noticeResultPagingNo").html(noticePagingTag); //페이징 적용
        },
        error : function(){
             alert('error - noticeList');
        }//error
    });//ajax
}// function end

/********************* faq *******************************************************************/
var sortFaqType='defaultCate';
$(document).ready(faqList(1,sortFaqType));
function faqList(pageNo, category) {
	$.ajax({
        url : "/board/faqList",
        type : "get",
        data : {
        	showPage : pageNo,
        	category : category
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var faqPageList = data.faqList; // model 처럼
        	
            var faqContentTag = "<table class='table'><tr><th>No</th><th>카테고리</th><th>제목</th><th>작성자</th><th>등록일</th></tr>";
            var faqPagingTag = "";

			$.each(faqPageList, function(key, value) {
				faqContentTag += "<tr>";
				faqContentTag += "<td><a href='/board/faqOne?faqNo="+value.faqNo+"'class='btn btn-danger'>"+value.faqNo+"</a></td>";
				faqContentTag += "<td>"+value.faqCategory+"</td>";
				faqContentTag += "<td>"+value.faqTitle+"</td>";
				faqContentTag += "<td>"+value.faqadmId+"</td>";
				faqContentTag += "<td>"+value.faqUpdDate.substring(0,10)+"</td>";
				faqContentTag += "</tr>";                
             });
			faqContentTag += "</table>";
			$("#faqResultList").html(faqContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				faqPagingTag+="<a href='#' onclick='faqList("+(pageInfo.firstPageNoOnPageList-1)+ ", \"" + sortFaqType + "\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					faqPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					faqPagingTag+="<a href='#' onclick='faqList(" + i + ", \"" + sortFaqType + "\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				faqPagingTag+="<a href='#' onclick='faqList("+(pageInfo.lastPageNoOnPageList+1)+ ", \"" + sortFaqType + "\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#faqResultPagingNo").html(faqPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - faqList');
        }//error
    });//ajax
}// function end

//정렬을 결정하는 함수임
function sortFaqList(inputsort){
	sortFaqType = inputsort;
	faqList(1, sortFaqType);
}

/********************* 1대1 문의 *******************************************************************/ 
var sortType = 1;
$(document).ready(otList(1), 1);
function otList(pageNo, sortNo) {
	$.ajax({
        url : "/board/boardQnList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var otPageList = data.otoList; // model 처럼
        	
            var otContentTag = "<table class='table'><tr><th>No</th><th>메인 카테고리</th><th>서브 카테고리</th><th>제목</th><th>작성자</th><th>답변 상태</th><th>등록일</th></tr>";
            var otPagingTag = "";

			$.each(otPageList, function(key, value) {
				otContentTag += "<tr>";
				otContentTag += "<td><a href='/board/boardQnOne?otqNo="+value.otqNo+"'class='btn btn-danger'>"+value.otqNo+"</a></td>";
				otContentTag += "<td>"+value.otqMainCategory +"</td>";
				otContentTag += "<td>"+value.otqSubCategory  +"</td>";
				otContentTag += "<td>"+value.otqTitle+"</td>";
				otContentTag += "<td>"+value.otqmemId+"</td>";
				if(value.otqState === 1){otContentTag += "<td><p style='color:green;'><strong>답변완료</strong><p></td>";}else{otContentTag += "<td><p><strong>처리대기중</strong><p></td>";}
				otContentTag += "<td>"+value.otqRegiDate.substring(0,10)+"</td>";
				otContentTag += "</tr>";                
             });
			otContentTag += "</table>";
			$("#otoResultList").html(otContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				otPagingTag+="<a href='#' onclick='otList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					otPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					otPagingTag+="<a href='#' onclick='otList(" + i + ", " + sortType +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				otPagingTag+="<a href='#' onclick='otList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#otoResultPagingNo").html(otPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - otList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList(inputsort){
	sortType = inputsort;
	otList(1,sortType);
}

$("#noticeBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#noticeDiv').css('display', 'block');
	$("#faqBt").css('font-weight', 'normal');
	$("#onetooneBt").css('font-weight', 'normal');
	$('#faqDiv').css('display', 'none');
	$('#otoDiv').css('display', 'none');
});
$("#faqBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#faqDiv').css('display', 'block');
	$("#noticeBt").css('font-weight', 'normal');
	$("#onetooneBt").css('font-weight', 'normal');
	$('#noticeDiv').css('display', 'none');
	$('#otoDiv').css('display', 'none');
});
$("#onetooneBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#otoDiv').css('display', 'block');
	$("#noticeBt").css('font-weight', 'normal');
	$("#faqBt").css('font-weight', 'normal');
	$('#faqDiv').css('display', 'none');
	$('#noticeDiv').css('display', 'none');
});

//정렬 A태그 디자인 관련
$("#sortBtn1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn2").css('font-weight', 'normal');
});
$("#sortBtn2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
});

// faq 카테고리
$("#categoryBt1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt2").css('font-weight', 'normal');
	$("#categoryBt3").css('font-weight', 'normal');
	$("#categoryBt4").css('font-weight', 'normal');
	$("#categoryBt5").css('font-weight', 'normal');
});
$("#categoryBt2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt3").css('font-weight', 'normal');
	$("#categoryBt4").css('font-weight', 'normal');
	$("#categoryBt5").css('font-weight', 'normal');
	$("#categoryBt1").css('font-weight', 'normal');
});
$("#categoryBt3").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt4").css('font-weight', 'normal');
	$("#categoryBt5").css('font-weight', 'normal');
	$("#categoryBt1").css('font-weight', 'normal');
	$("#categoryBt2").css('font-weight', 'normal');
});
$("#categoryBt4").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt5").css('font-weight', 'normal');
	$("#categoryBt1").css('font-weight', 'normal');
	$("#categoryBt2").css('font-weight', 'normal');
	$("#categoryBt3").css('font-weight', 'normal');
});
$("#categoryBt5").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt1").css('font-weight', 'normal');
	$("#categoryBt2").css('font-weight', 'normal');
	$("#categoryBt3").css('font-weight', 'normal');
	$("#categoryBt4").css('font-weight', 'normal');
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