<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 헤더, 풋터 CSS 링크 -->
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
* {
	/* 초기화 */
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    letter-spacing: 0;
    word-spacing: 0;
}
/* 주소는 API로 넣기 전까지는 보이지 않음 */
.daum_address_wrapper{
	display: none;
}

/* 판매자폼은 선택하기 전까지는 보이지 않음*/
.seller_entire_form{	
	display: none;
}
/* 버튼 관련 */
	/* 판매자/일반회원 선택버튼 => 버튼의 label태그에 붙어있음 */
	.typebtn{ 
	      height: 40px;
	      width: 120px;
	}
	
	/* 검사관련 버튼 */
	.id_duplicate_check,.phone_btn,.email_duplicate_check,.daum_address_btn,.seller_marketUniqueNo_check{
		height: 40px;
	    width: 150px;
	}
	
	/* 최초 주소찾기 버튼 */
	.address_init_check{
		width:200px;
	}
	
	/* 조인버튼 */
	.join_button{ 
	    height: 60px;
	    width: 200px;
	    font-weight:bold;
	    font-size:25px;
	}
/* 폰트 */
.font_apply{
	font-weight:bold;
    font-size:15px;
}
.join_title{
	font-weight:bold;
    font-size:30px;
}

/* 전체 폼 관련 */
.form_and_checkList_wrapper{
	min-width:800px;
 	overflow: hidden;
/*  	margin: 0 100px; */
 	padding: 0 100px;
/*  	border: 3px solid green; */
}
.form_wrapper{
  	width: 70%;
  	min-width:800px;
	overflow: hidden;
	padding: 0 auto;
/*  	border: 3px solid blue; */
}
.checkList_wrap{
	width: 20%;
}

.checkList_wrap {position:absolute;width:250px;top:50%;margin-top:-50px;right:100px;background:#fff;}
.checkList_wrap ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.checkList_wrap ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.checkList_wrap ul li input {position:relative;float:left;width:30%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
.checkList_wrap ul li label {position:relative;float:left;width:65%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
.checkList_wrap ul li input:hover {color:#000;}
.checkList_wrap ul li:last-child {border-bottom:0;}


/* 테스트용 보더 */
.col{	
/* 	border:1px solid red; */
}

/* 입력폼감싼 div padding 제거 */
.col-lg-5{
	padding: 0px;
}

/* 생일관련 */
.birth_input_year, .birth_input_month, .birth_input_date{
	text-align: center;
}

.birth_year_div{
	padding-right: 0px;
}
.birth_month_div{
	padding-left: 6px;
	padding-right: 6px;
}
.birth_date_div{
	padding-left: 0px;
}

/* 입력폼 라벨 가운데로 내리기 */
.text_custom_center{
	padding-top: 6px;
}

/* 입력박스 간격 */
.main_title,.typeSelect_btn_wrap,.id_wrap, .pw_wrap, .pwck_wrap,.nameBox_wrap,.email_wrap,.phone_wrap,.init_address_wrap,.birth_wrap,
.gender_wrap,.seller_entire_form,.terms_wrap,.address_margin_spec,.sel_margin_spec{
	margin-bottom:10px;
	/* address_margin_spec클래스는 주소의 postCode, 기본주소, 상세주소에 적용되어있으며 입력박스 간격을 위해 추가함 */
	/* sel_margin_spec클래스도 동일한 목적으로 고유번호 / 판매점명에 적용*/
}

.allCkBox_label_text{
	font-weight:bold;
	font-size:15px;
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

<div class="form_and_checkList_wrapper container">
	<div class="form_wrapper container text-center">
		<form id="join_form" class="form-horizontal" method="get">
		<div class="wrap">
			<div class="main_title row justify-content-center">
			    <div class="col col-lg-2">
			    </div>
			    <div class="col-md-auto">
			      <span class="join_title h2">내 정보 수정</span>
			    </div>
			    <div class="col col-lg-2">
			    </div>
		    </div>
			<br />
			<br />
			<br />
			<!-- 아이디 -->
			<div class="id_wrap row justify-content-start">
				<div class="col col-lg-3 text_custom_center">
			    	<div class="row justify-content-start">
			    		<div class="col-2"></div>
				    	<div class="col-10 text-start">
				    		<label class="id_name font_apply" for="id_input_input_tag">아이디</label>
				    	</div>
			    	</div>
			    </div>
			    <div class="id_input_box col col-lg-5">
			    	<input id="id_input_input_tag" class="id_input form-control" name="memId" maxlength="16" value="${memInfoUpd.memId}" readonly="readonly">
			    </div>
			    <div class="col">
			    </div>
			    <span class="id_alert_box"></span>
				<span class="id_role_msg"></span>
			</div>
			
			<!-- 비밀번호 -->
			<div class="pw_wrap row justify-content-start">
				<div class="col col-lg-3 text_custom_center">
			    	<div class="row justify-content-start">
			    		<div class="col-2"></div>
				    	<div class="col-10 text-start">
				    		<label class="pwd_name font_apply" for="pwd_input_input_tag">비밀번호</label>
				    	</div>
			    	</div>
			    </div>
			    <div class="pwd_input_box col col-lg-5">
			    	<input type="password" id="pwd_input_input_tag" class="pw_input form-control" name="memPwd" maxlength="20">
			    </div>
			    <span class="pwd_alert_box"></span>
			</div>
			
			<!-- 비밀번호확인 -->
			<div class="pwck_wrap row justify-content-start">
				<div class="col col-lg-3 text_custom_center">
			    	<div class="row justify-content-start">
			    		<div class="col-2"></div>
				    	<div class="col-10 text-start">
				    		<label class="pwck_name font_apply" for="pwck_input_input_tag">비밀번호확인</label>
				    	</div>
			    	</div>
			    </div>
			    <div class="pwck_input_box col col-lg-5">
			    	<input type="password" id="pwck_input_input_tag" class="pwck_input form-control" name="memPwdck" maxlength="20">
			    </div>
			    <span class="pwck_alert_box"></span>
			</div>
			
			<!-- 이름 -->
			<div class="nameBox_wrap row justify-content-start">
				<div class="col col-lg-3 text_custom_center">
			    	<div class="row justify-content-start">
			    		<div class="col-2"></div>
				    	<div class="col-10 text-start">
				    		<label class="nameBox_name font_apply" for="nameBox_input_input_tag">성명</label>
				    	</div>
			    	</div>
			    </div>
			    <div class="nameBox_input_box col col-lg-5">
			    	<input type="text" id="nameBox_input_input_tag" class="nameBox_input form-control" name="memName" maxlength="5">
			    </div>
			    <span class="nameBox_alert_box"></span>
			</div>
			
			<!-- 이메일 -->
			<div class="email_wrap row justify-content-start">
				<div class="col col-lg-3 text_custom_center">
			    	<div class="row justify-content-start">
			    		<div class="col-2"></div>
				    	<div class="col-10 text-start">
				    		<label class="email_name font_apply" for="email_input_input_tag">이메일</label>
				    	</div>
			    	</div>
			    </div>
			    <div class="email_input_box col col-lg-5">
			    	<input type="text" id="email_input_input_tag" class="email_input form-control" placeholder="예시: abcde@olga.com" name="memEmail">
			    </div>
			    <div class="col">
			     	<button type="button" class="email_duplicate_check btn btn-outline-success">이메일 중복검사</button>
			    </div>
			    <span class="email_alert_box"></span>
			</div>
			
			<!-- 전화번호 -->
			<div class="phone_wrap row justify-content-start">
				<div class="col col-lg-3 text_custom_center">
			    	<div class="row justify-content-start">
			    		<div class="col-2"></div>
				    	<div class="col-10 text-start">
				    		<label class="phone_name font_apply" for="phone_input_input_tag">전화번호</label>
				    	</div>
			    	</div>
			    </div>
			    <div class="phone_input_box col col-lg-5">
			    	<input type="text" id="phone_input_input_tag" class="phone_input form-control" name="memPhone" maxlength="13" oninput="autoHypen(this)">
			    </div>
			    <div class="col">
			      <button type="button" class="phone_btn btn btn-outline-success">인증번호(구현X)</button>
			    </div>
			    <span class="phone_alert_box"></span>
			</div>
			
			<!-- 주소 -->
			<div class="init_address_wrap row justify-content-start">
					<div class="col col-lg-3 text_custom_center">
						<div class="row justify-content-start">
				    		<div class="col-2"></div>
					    	<div class="col-10 text-start">
					    		<label class="address_name font_apply" for="main_detailAddress">주소</label>
				    		</div>
			    		</div>
					</div>
					<div class="col col-lg-5">
						<button type="button" class="daum_address_btn address_init_check btn btn-outline-success" onclick="execDaumPostcode()">주소 찾기</button>
					</div>
					<div class="col">
					</div>
			</div>

			<div class="address_entire_wrap">
				<div class="address_wrap address_margin_spec row justify-content-start">
					<div class="daum_address_wrapper col col-lg-3 text_custom_center">
						<div class="row justify-content-start">
				    		<div class="col-2"></div>
					    	<div class="col-10 text-start">
					    		<label class="address_name font_apply" for="main_detailAddress">주소</label>
				    		</div>
			    		</div>
					</div>
					<div class="daum_address_wrapper col col-lg-5">
						<input type="text" class="form-control" id="main_postcode" readonly="readonly" name="mainPostcode">
					</div>
					<div class="daum_address_wrapper col">
						<button type="button" class="daum_address_btn btn btn-outline-success" onclick="execDaumPostcode()">재검색</button>
					</div>
				</div>
				<div class="address_wrap address_margin_spec row justify-content-start">
					<div class="daum_address_wrapper col col-lg-3">
					</div>
					<div class="daum_address_wrapper col col-lg-5">
						<input type="text" class="form-control" id="main_address" readonly="readonly" name="mainAddress">
					</div>
					<div class="col">
					</div>
				</div>
				<div class="address_wrap address_margin_spec row justify-content-start">
					<div class="daum_address_wrapper col col-lg-3">
					</div>
					<div class="daum_address_wrapper col col-lg-5">
						<input type="text" class="address_input form-control" id="main_detailAddress" placeholder="상세주소" name="mainDetailAddress">
					</div>
					<div class="col">
					</div>
				</div>
				<span class="address_alert_box"></span>
			</div>			
			
			
			<!-- 생년월일 -->
			<div class="birth_wrap row justify-content-start">
				<div class="col col-lg-3 text_custom_center">
			    	<div class="row justify-content-start">
			    		<div class="col-2"></div>
				    	<div class="col-10 text-start">
				    		<label class="birth_name font_apply" for="birth_input_input_tag">생일</label>
			    		</div>
		    		</div>
			    </div>
			    <div class="birth_input_box col col-lg-5">
			    	<div class="birth_input_box_wrap row">
			    		<div class="birth_data_padding_zero birth_year_div col-sm-4">
			    			<input type="text" id="birth_input_input_tag" class="birth_input_year form-control" name="memBirthYear" maxlength="4" placeholder="YYYY">
			    		</div>
			    		<div class="birth_data_padding_zero birth_month_div col-sm-4">
			    			<input type="text" class="birth_input_month form-control" name="memBirthMonth" maxlength="2" placeholder="MM" disabled="disabled">
			    		</div>
			    		<div class="birth_data_padding_zero birth_date_div col-sm-4">
			    			<input type="text" class="birth_input_date form-control" name="memBirthDate" maxlength="2" placeholder="DD" disabled="disabled">
			    		</div>
			    	</div>
			    </div>
			    <div class="col">
			    </div>
			    <span class="birth_alert_box"></span>
			    <span class="birth_alert_box_adeYear"></span>
			</div>
			
			<!-- 성별 -->
			<div class="gender_wrap row justify-content-start">
				<div class="col col-lg-3 text_custom_center">
					<div class="row justify-content-start">
			    		<div class="col-2"></div>
				    	<div class="col-10 text-start">
				    		<label class="gender_name font_apply" for="">성별</label>
			    		</div>
		    		</div>
				</div>
				<div class="gender_input_box col col-lg-5">
					<div class="row text_custom_center">
						<div class="col">
							<input type="radio" class="form-check-input" id="select" name="memGender" value="남성" checked="checked" autocomplete="off">
							<label class="custom-control-label" for="select">남성</label>
						</div>
						<div class="col">
							<input type="radio" class="form-check-input" id="select2" name="memGender" value="여성" autocomplete="off">
							<label class="custom-control-label" for="select2">여성</label>
						</div>
					</div>
				</div>
				<div class="col">
				
				</div>
			</div>
			
			
			<hr />
			<!-- 약관 -->
			<div class="terms_wrap">		
				<div class="row justify-content-start">
					<div class="col col-lg-3 text_custom_center">
						<div class="row justify-content-start">
				    		<div class="col-2"></div>
					    	<div class="col-10 text-start">
					    		<label class="essential_select_lebel_tag font_apply" for="">이용약관동의</label>
				    		</div>
		    			</div>
				    </div>
				    <div class="col col-lg-5">
				    	<div class="row justify-content-start">
					    	<div class="col-1">
					    		
					    	</div>
					    	<div class="col-md-auto">
					    		
					    	</div>
				    	</div>
				    </div>
				    <div class="col">
				    </div>
				</div>
				
				
				<div class="row justify-content-start">
					<div class="col col-lg-3">
				    </div>
				    <div class="col col-lg-5">
				    	<div class="row justify-content-start">
					    	<div class="col-1">
					    		<input class="choiceOne termsCheckBox form-check-input" id="choiceOneBox" type="checkbox" name="choiceSelectBoxOne" value=1>
					    	</div>
					    	<div class="col-md-auto">
					    		<label for="choiceOneBox" class="form-check-label">정보수신 이용동의(선택)</label>
					    	</div>
				    	</div>
				    </div>
				    <div class="col">
				    	<span class="termShow_ess_btn_1" style="color:#F64848">약관보기＞</span>
				    </div>
				</div>
				<div class="row justify-content-start">
					<div class="col col-lg-3">
				    </div>
				    <div class="col col-lg-5">
				    	<div class="row justify-content-start">
					    	<div class="col-1">
					    		<input class="choiceTwo termsCheckBox form-check-input" id="choiceTwoBox" type="checkbox" name="choiceSelectBoxTwo" value=10>
					    	</div>
					    	<div class="col-md-auto">
					    		<label for="choiceTwoBox" class="form-check-label">위치정보 수집 및 이용동의(선택)</label>
					    	</div>
				    	</div>
				    </div>
				    <div class="col">
				    	<span class="termShow_ess_btn_1" style="color:#F64848">약관보기＞</span>
				    </div>
				</div>
				<div class="row justify-content-start">
					<div class="col col-lg-3">
				    </div>
				    <div class="col col-lg-5">
				    	<div class="row justify-content-start">
					    	<div class="col-1">
					    		<input class="choiceThree termsCheckBox form-check-input" id="choiceThreeBox" type="checkbox" name="choiceSelectBoxThree" value=100>
					    	</div>
					    	<div class="col-md-auto">
					    		<label for="choiceThreeBox" class="form-check-label">기타 서비스 이용동의(선택)</label>
					    	</div>
				    	</div>
				    </div>
				    <div class="col">
				    	<span class="termShow_ess_btn_1" style="color:#F64848">약관보기＞</span>
				    </div>
				</div>
			</div>
			
		</div>
		<br />
		<br />
		<button type="button" class="join_button btn btn-danger">수정 하기</button>
		</form>
	</div>
	
	<!-- 약관 모달1 -->
	<div class="modal fade" id="termShow_ess_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">이용약관</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		    <p>
		      예시 약관 출처:https://www.youtube.com/watch?v=cixW6rogZ48&t=3541s <br />
			제 1 조 (목적) <br />
			이 약관은 {COMPANY_NAME}(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다. <br />
			제 2 조 (약관의 효력 및 변경) <br />
			① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다. <br />
			② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다. <br />
			제 3 조 (용어의 정의) <br />
			이 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br />
			① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다. <br />
			② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다. <br />
			③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다. <br />
			④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다. <br />
			⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다. <br />
			제 2 장 서비스 이용계약 <br />
			제 4 조 (이용계약의 성립) <br />
			① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다. <br />
			② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다. <br />
			제 5 조 (이용신청) <br />
			① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다. <br />
			② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다. <br />
			제 6 조 (이용신청의 승낙) <br />
			① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다. <br />
			② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다. <br />
			가. 서비스 관련 설비에 여유가 없는 경우 <br />
			나. 기술상 지장이 있는 경우 <br />
			다. 기타 사이트가 필요하다고 인정되는 경우 <br />
			③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다. <br />
			가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우 <br />
			나. 이용자 정보를 허위로 기재하여 신청한 경우 <br />
			다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우 <br />
			라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우 <br />
			제 7 조 (이용자정보의 변경) <br />
			회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다. <br />
			제 3 장 계약 당사자의 의무 <br />
			제 8 조 (사이트의 의무) <br />
			① 사이트는 회원에게 각 호의 서비스를 제공합니다. <br />
			가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송 <br />
			나. 추가 도메인 등록시 개인정보 자동 입력 <br /> 
			다. 도메인 등록, 관리를 위한 각종 부가서비스 <br />
			② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다. <br />
			가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우 <br />
			나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 <br />
			다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우 <br />
			③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다. <br />
			제 9 조 (회원의 의무) <br />
			① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다. <br />
			가. 다른 회원의 ID를 부정하게 사용하는 행위 <br />
			나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위 <br />
			다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위 <br />
			라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위 <br />
			마. 범죄와 결부된다고 객관적으로 판단되는 행위 <br />
			바. 기타 관계법령에 위배되는 행위 <br />
			② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다. <br />
			③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.	 <br />
			</p>	      
			</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
		      </div>
		    </div>
	  	</div>
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
</body>
<script>

//현재 세션값
let currentSession = $("#currentSession").text();

 /* 기본 유효성 검사(입력여부/체크여부) 통과유무 변수 */
var pwCheck = false;			// 비번
var pwckCheck = false;			// 비번 확인
var nameCheck = false;         // 이름확인
var emailCheck = false;         // 이메일확인
var phoneCheck = false;        // 전화번호체크
// var addressPostcodeCheck = false;        // 우편번호체크
// var addressMainCheck = false;        // 메인주소체크
var addressDetailWriteCheck = false;        // 상세주소체크(나머지 주소는 자동입력이므로)
/*  성별은 기본값(male)이므로 스킵 */
var birthYearCheck = false;        // 생일-연도 체크
var birthMonthCheck = false;        // 생일-월 체크
var birthDateCheck = false;        // 생일-일 체크


/* 구체적 유효성검사 변수 */
var pwdFormatCheck = false;        // 비밀번호 형식 검사
var pwdChekerFormatCheck = false;        // 비밀번호 확인 검사
var nameFormatCheck = false;         // 이름형식검사
var emailFormatCheck = false;        //이메일 형식 검사
var emailDuplCheck = false;        //이메일 중복 검사
var phoneFormatCheck = false;         // 전화번호형식검사
var birthYearFormatCheck = false;     // 생일-연도 검사
var birthMonthFormatCheck = false;     // 생일-월 검사
var birthDateFormatCheck = false;     // 생일-일 검사
var adequateYearCheck = false;     // 만14세 이상이며 미래에서 오지는 않음



/* 입력값 변수 */
var pw;				// 비밀번호 입력란
var pwck;			// 비밀번호 확인 입력란
var name;			// 이름 입력란
var email;			// 이메일 입력란
var phone;			// 전화번호 입력란
var addressDetail;			// 상세주소 입력란
var birthYear;			// 생일-연도 입력란
var birthMonth;			// 생일-월 입력란
var birthDate;			// 생일-일 입력란


	$(".join_button").click(function(){
		pw = $('.pw_input').val();				// 비밀번호 입력란
		pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란
		name = $('.nameBox_input').val();			// 이름 입력란
		email = $('.email_input').val();			// 이메일 입력란
		phone = $('.phone_input').val();			// 전화번호 입력란
		addressDetail = $('.address_input').val();			// 상세주소 입력란
		birthYear = $('.birth_input_year').val();			// 생일-연도 입력란
		birthMonth = $('.birth_input_month').val();			// 생일-월 입력란
		birthDate = $('.birth_input_date').val();			// 생일-일 입력란
		
		
		
		/* 비밀번호 유효성 검사 */
		if(pw == ""){
			$('.pwd_alert_box').css('display','block');
			$('.pwd_alert_box').html("<span style='color: red'>비밀번호를 입력하세요.</span>");
			pwCheck = false;
		}else{
// 			$('.pwd_alert_box').css('display', 'none');
			pwCheck = true;
		}
		
		/* 비밀번호 확인 유효성 검사 */
		if(pwck == ""){
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호확인 칸을 입력하세요.</span>");
			pwckCheck = false;
		}else{
// 			$('.pwck_alert_box').css('display', 'none');
			pwckCheck = true;
		}
		
		/* 이름 확인 유효성 검사 */
		if(name == ""){
			$('.nameBox_alert_box').css('display','block');
			$('.nameBox_alert_box').html("<span style='color: red'>성함을 입력하세요.</span>");
			nameCheck = false;
		}else{
// 			$('.nameBox_alert_box').css('display', 'none');
			nameCheck = true;
		}
		
		/* 이메일 유효성 검사 */
		if(email == ""){
			$('.email_alert_box').css('display','block');
			$('.email_alert_box').html("<span style='color: red'>이메일을 입력하세요.</span>");
			emailCheck = false;
		}else{
// 			$('.email_alert_box').css('display', 'none');
			emailCheck = true;
		}
		
		/* 전화번호 유효성 검사 */
		if(phone == ""){
			$('.phone_alert_box').css('display','block');
			$('.phone_alert_box').html("<span style='color: red'>전화번호를 입력하세요.</span>");
			phoneCheck = false;
		}else{
// 			$('.phone_alert_box').css('display', 'none');
			phoneCheck = true;
		}
		
		/* 주소 유효성 검사 */
		/* 우편번호하고 메인주소는 자동입력 이므로 상세주소만 반드시 입력하도록 체크한다*/
		if(addressDetail == ""){
			$('.address_alert_box').css('display','block');
			$('.address_alert_box').html("<span style='color: red'>상세주소를 입력하세요.</span>");
			addressDetailWriteCheck = false;
		}else{
			$('.address_alert_box').css('display', 'none');
			addressDetailWriteCheck = true;
		}
		
		/*  성별은 기본값(male)이므로 스킵 */

		
		
		/* 생일 유효성 검사 */
		if(birthYear == "" || birthMonth == "" || birthDate == "" ){
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>생일을 모두 입력해주세요.</span>");
			birthYearCheck = false;
			birthMonthCheck = false;
			birthDateCheck = false;
		}else{
			$('.birth_alert_box').css('display', 'none');
			birthYearCheck = true;
			birthMonthCheck = true;
			birthDateCheck = true;
		}
		
		
		
		/* 선택약관은 체크 여부 무관 */

		
			
			//일반회원의 경우
			if( pwCheck && pwckCheck && nameCheck  && emailCheck && phoneCheck 
					&& addressDetailWriteCheck && birthYearCheck 
					&& birthMonthCheck  && birthDateCheck   
					&&   pwdFormatCheck  && pwdChekerFormatCheck 
					&& nameFormatCheck  && emailFormatCheck  && emailDuplCheck  && phoneFormatCheck  && birthYearFormatCheck 
					&& birthMonthFormatCheck  && birthDateFormatCheck && adequateYearCheck
					){
						$("#join_form").attr("action", "/myPage/memInfoUpdate");
						$("#join_form").submit();
					}
		
		return false;
	}); // 클릭함수 끝

/* 아이디 형식 검사 */










/* 비밀번호 형식 검사 */

$('.pw_input').keyup( function() {
	if(!pwdFormatChk($('.pw_input').val())){
		$('.pwd_alert_box').css('display','block');
		$('.pwd_alert_box').html("<span style='color: red'>숫자+영문자+특수문자 조합으로 8~25자리 이상 사용해야 합니다</span>");
		pwdFormatCheck = false;
		if(pwdChekerFormatCheck){
		// 비밀번호 + 비밀번호 확인 모두 통과했는데 비밀번호만 바꿔서 형식 틀릴경우	
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호 형식을 확인하세요</span>");
			$('.pwck_input').val(null);
			$('.chkList_pwdEqChk').prop('checked',false);
		}
	}else{
		let pwdOrigin_temp = $('.pwck_input').val();
		let pwdChekcer_temp = $('.pw_input').val();
		if(pwdOrigin_temp !== pwdChekcer_temp){
	 		//비밀번호 + 비밀번호 확인 모두 통과하고 비밀번호를 바꿨는데(=비밀번호랑 비밀번호 확인이랑 다른 경우) 형식은 맞은 경우
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호와 동일하지 않습니다</span>");
			$('.chkList_pwdEqChk').prop('checked',false);
			pwdChekerFormatCheck = false;
	 	}
// 	 	$('.pwd_alert_box').css('display','none');
	 	$('.pwd_alert_box').html("<span style='color: green'>사용가능한 비밀번호 입니다.</span>");
	 	$('.pwck_input').val(null);
	 	$('.chkList_pwdEqChk').prop('checked',false);
	 	pwdFormatCheck = true;
	}
});

function pwdFormatChk(value) {
// 	const pattern = new RegExp("^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$");
	const pattern = new RegExp("^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$");
	return pattern.test(value);
}

/* 비밀번호확인란 동일성 검사 */

$('.pwck_input').keyup( function() {
	let pwdOrigin = $('.pwck_input').val();
	let pwdChekcer = $('.pw_input').val();
	if(pwdOrigin !== pwdChekcer){
		$('.pwck_alert_box').css('display','block');
		$('.pwck_alert_box').html("<span style='color: red'>비밀번호와 동일하지 않습니다</span>");
		$('.chkList_pwdEqChk').prop('checked',false);
		pwdChekerFormatCheck = false;
	}else{
		if(pwdFormatCheck){
	 	$('.pwck_alert_box').css('display','none');
// 	 	$('.pwck_alert_box').html("<span style='color: green'>동일성 검사 완료</span>");
	 	$('.chkList_pwdEqChk').prop('checked',true);
	 	pwdChekerFormatCheck = true;
		}else{
			//이 경우는 동일한데 형식이 안맞는 경우
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호 형식을 확인하세요</span>");
			$('.chkList_pwdEqChk').prop('checked',false);
		}
	}
});

/* 이름 한글 형식 검사 */

$('.nameBox_input').keyup( function() {
	if(!nameFormatChk($('.nameBox_input').val())){
		$('.nameBox_alert_box').css('display','block');
		$('.nameBox_alert_box').html("<span style='color: red'>2~5자리의 한글을 입력하세요</span>");
		$('.chkList_nameChk').prop('checked',false);
		nameFormatCheck = false;
	}else{
	 	$('.nameBox_alert_box').css('display','none');
// 	 	$('.nameBox_alert_box').html("<span style='color: green'>이름 형식 검사 완료</span>");
	 	$('.chkList_nameChk').prop('checked',true);
	 	nameFormatCheck = true;
	}
});

function nameFormatChk(value) {
	const pattern = new RegExp("^[가-힣]{2,6}$");
	return pattern.test(value);
}
  
 /* 이메일 형식 검사 */

$('.email_input').keyup( function() {
	if(!emailFormatChk($('.email_input').val())){
		$('.email_alert_box').css('display','block');
		$('.email_alert_box').html("<span style='color: red'>이메일 형식을 지켜주세요</span>");
		emailFormatCheck = false;
	}else{
	 	$('.email_alert_box').css('display','none');
	 	emailFormatCheck = true;
	}
});

function emailFormatChk(value) {
	const pattern = new RegExp("^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
	return pattern.test(value);
}



/* 이메일 중복검사 */
$('.email_duplicate_check').click(function(){
	if(emailFormatCheck){
	var memEmail = $('.email_input').val();			// .id_input에 입력되는 값
	var data = {memEmail : memEmail}					// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	$.ajax({
		type : "post",
		url : "/member/memEmailCheck",
		data : data,
		success : function(result){
			// console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.email_alert_box').css('display','block');
				$('.email_alert_box').html("<span style='color: green'>사용가능한 이메일 입니다</span>");
				$('.chkList_emailDupl').prop('checked',true);
				$('.email_duplicate_check').prop('disabled',true);
				emailDuplCheck = true;
			} else {
				$('.email_alert_box').css('display','block');
				$('.email_alert_box').html("<span style='color: red'>이미 사용중인 이메일입니다</span>");
				$('.chkList_emailDupl').prop('checked',false);
				emailDuplCheck = false;
			}	
		}// success 종료
	}); // ajax 종료	
	}else{
		$('.email_alert_box').css('display','block');
		$('.email_alert_box').html("<span style='color: red'>형식을 맞추고 진행해 주세요.</span>");
		$('.chkList_emailDupl').prop('checked',false);
	}
});// function 종료



/* 이메일 중복검사 했는데 바꾼 경우 */

$('.email_input').keyup( function() {
	if(emailDuplCheck){
		$('.email_alert_box').css('display','block');
		$('.email_alert_box').html("<span style='color: red'>다시 중복검사 해주세요</span>");
		$('.chkList_emailDupl').prop('checked',false);
		$('.email_duplicate_check').prop('disabled',false);
		emailDuplCheck = false;
	}
});

/* 전화번호 형식 검사 */

$('.phone_input').keyup( function() {
	if(phoneFormatChk($('.phone_input').val())==="fail"){
		$('.phone_alert_box').css('display','block');
		$('.phone_alert_box').html("<span style='color: red'>전화번호 형식을 지켜주세요</span>");
		$('.chkList_phoneChk').prop('checked',false);
		phoneFormatCheck = false;
	}else{
	 	$('.phone_alert_box').css('display','none');
// 	 	$('.phone_alert_box').html("<span style='color: green'>전화번호 형식 검사 완료</span>");
	 	$('.chkList_phoneChk').prop('checked',true);
	 	phoneFormatCheck = true;
	}
});

function phoneFormatChk(value) {
	if(value.length === 13){
		return "success";
	}else{
		return "fail";
	}
}

function autoHypen(target){
	return target.value = target.value.replace(/[^0-9]/g, '')
	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	.replace(/(\-{1,2})$/g, "");
}


/* 주소 + 다음주소API */

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
            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("main_postcode").value = data.zonecode;
                document.getElementById("main_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("main_detailAddress").focus();
                $('.init_address_wrap').css('display','none');
                $('.daum_address_wrapper').css('display','block');
                $('.address_input').focus();
                $('.daum_address_btn').text('재검색');
            }else{
            	// 우편 폼만 열고 X 누른경우임 ( 문자열이 0 )
            }
            
        }
    }).open();
    
} //function end


/* 생일 형식 검사 */

	/* 1단계 - 연도 */
	$('.birth_input_year').keyup( function() {
		if(!brYearChk($('.birth_input_year').val())){
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>연도를 확인해주세요</span>");
			$(".birth_input_month").prop('disabled', true); // 달 비활성화
			$(".birth_input_date").prop('disabled', true); // 일 비활성화
			$(".birth_input_month").val(null); // 달 초기화
			$(".birth_input_date").val(null); // 일 초기화
			$('.chkList_birthChk').prop('checked',false);
			birthYearFormatCheck = false;
		}else{
	 	 	$('.birth_alert_box').css('display','none');
// 		 	$('.birth_alert_box').html("<span style='color: green'>연도 검사 완료</span>");
		 	$(".birth_input_month").prop('disabled', false); // 달 활성화
// 		 	$(".birth_input_month").focus(); 포커싱 보류
		 	birthYearFormatCheck = true;
		}
	});
	
	function brYearChk(target){
		// isNan => 숫자가 아니면 true 리턴
		if(!isNaN(target)){
			// 일단 숫자를 입력하였음
			var year = new Date().getFullYear()
			if(target < (year-100) || target > year){
				// 100세 이상 or 미래 시간여행자
				return false;
			}else{
				return true;
			}
		}else{
			// 숫자말고 다른 문자 감지됨
			return false;
		}
	}
	
	/* 2단계 - 월 */
	$('.birth_input_month').keyup( function() {
		if(!brMonthChk($('.birth_input_month').val())){
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>월을 확인해주세요</span>");
			$(".birth_input_date").prop('disabled', true); // 일 비활성화
			$(".birth_input_date").val(null); // 일 초기화
			$('.chkList_birthChk').prop('checked',false);
			birthMonthFormatCheck = false;
		}else{
	 	 	$('.birth_alert_box').css('display','none');
// 		 	$('.birth_alert_box').html("<span style='color: green'>월 검사 완료</span>");
		 	$(".birth_input_date").val(null); // 일 초기화
		 	$(".birth_input_date").prop('disabled', false); // 일 활성화
		 	$('.chkList_birthChk').prop('checked',false);
// 		 	$(".birth_input_date").focus(); 11월을 입력하고 싶은데 1 입력시 validation test를 통과하므로 focus가 옮겨지면 안됨
		 	birthMonthFormatCheck = true;
		}
	});
	
	function brMonthChk(target){
		// isNan => 숫자가 아니면 true 리턴
		if(!isNaN(target)){
			// 일단 숫자를 입력하였음
			if(12 < target || target < 1){
				// 12 초과 or 1 미만=> false
				return false;
			}else{
				return true;
			}
		}else{
			// 숫자말고 다른 문자 감지됨
			return false;
		}
	}
	
	
	/* 3단계 - 일 */
	/* 윤달은 아직 고려X -> 2월은 28일로 고정 */

	$('.birth_input_date').keyup( function() {
		if(!brDateChk($('.birth_input_date').val())){
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>일을 확인해주세요</span>");
			$('.chkList_birthChk').prop('checked',false);
			birthDateFormatCheck = false;
		}else{
	 	 	$('.birth_alert_box').css('display','none');
// 		 	$('.birth_alert_box').html("<span style='color: green'>일 검사 완료</span>");
		 	$('.chkList_birthChk').prop('checked',true);
		 	birthDateFormatCheck = true;
		}
	});
	
	function brDateChk(target){
		// isNan => 숫자가 아니면 true 리턴
		const oddMonthArr = ['1','3','5','7','9','11','01','03','05','07','09'];
		const evenMonthArr = ['4','6','8','10','12','04','06','08'];
		//2월은 28일 이므로 별도 처리
		if(!isNaN(target)){
			if(oddMonthArr.includes($('.birth_input_month').val())){
				//홀수 달인 경우
				if(30 < target || target < 1){
					// 30 초과 or 1 미만=> false
					return false;
				}else{
					return true;
				}
			}
			if(evenMonthArr.includes($('.birth_input_month').val())){
				//짝수 달인 경우 (2월제외)
				if(31 < target || target < 1){
					// 31 초과 or 1 미만=> false
					return false;
				}else{
					return true;
				}
			}
			if($('.birth_input_month').val() === '2' || $('.birth_input_month').val() === '02'){
				// 2월인 경우
				if(28 < target || target < 1){
					// 12 초과 or 1 미만=> false
					return false;
				}else{
					return true;
				}
			}
		}else{
			// 숫자말고 다른 문자 감지됨
			return false;
		}
	}
	
/* 미래에서 온사람 잡기 or 만14세 미만잡기*/
$('.birth_input_date').keyup( function() {
	var temp_birth_year = $('.birth_input_year').val();
	var temp_birth_month = $('.birth_input_month').val();
	var temp_birth_date = $('.birth_input_date').val();
	if(birthYearFormatCheck==true && birthMonthFormatCheck==true && birthDateFormatCheck==true){
		let inputDate = new Date(temp_birth_year+"-"+temp_birth_month+"-"+temp_birth_date);
		let nowDate = new Date();
		if(inputDate > nowDate){
			/* 미래에서 왔음 */
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>미래에서 오셨습니다</span>");
			$('.chkList_birthChk').prop('checked',false);
			adequateYearCheck = false;
		}else{
			/* 최소한 미래에서 오지는 않음 */
			/* 만나이 계산 로직 */
			let age = nowDate.getFullYear() - inputDate.getFullYear();
			const m = nowDate.getMonth() - inputDate.getMonth();
			if (m < 0 || (m === 0 && nowDate.getDate() < inputDate.getDate())) {
			    age--;
			}
			if(age < 14){
				//만 14세 미만 => 빠꾸
				$('.birth_alert_box').css('display','block');
				$('.birth_alert_box').html("<span style='color: red'>[필수]만14세 이상이어야 합니다</span>");
				$('.chkList_birthChk').prop('checked',false);
				adequateYearCheck = false;
			}else{
				// 미래인도 아니고 만14세 미만도 아님
				$('.birth_alert_box').css('display','none');
				$('.chkList_birthChk').prop('checked',true);
				adequateYearCheck = true;
			}
		}
			
		
	}
	
});



	
	/* 비밀번호 */
	$('.pw_input').keyup( function() {
		if($('.pw_input').val() == ""){
			pwCheck = false;
		}else{
			pwCheck = true;
		}
	});
	
	/* 비밀번호확인 */
	$('.email_input').keyup( function() {
		if($('.email_input').val() == ""){
			pwckCheck = false;
		}else{
			pwckCheck = true;
		}
	});
	
	/* 이름 */
	$('.nameBox_input').keyup( function() {
		if($('.nameBox_input').val() == ""){
			nameCheck = false;
		}else{
			nameCheck = true;
		}
	});
	
	/* 이메일 */
	$('.nameBox_input').keyup( function() {
		if($('.nameBox_input').val() == ""){
			emailCheck = false;
		}else{
			emailCheck = true;
		}
	});
	
	/* 전화번호 */
	$('.phone_input').keyup( function() {
		if($('.phone_input').val() == ""){
			phoneCheck = false;
		}else{
			phoneCheck = true;
		}
	});
	
	/* 상세주소 */
	$('.address_input').keyup( function() {
		if($('.address_input').val() == ""){
			$('.chkList_detailAddressChk').prop('checked',false);
			addressDetailWriteCheck = false;
		}else{
			$('.chkList_detailAddressChk').prop('checked',true);
			addressDetailWriteCheck = true;
		}
	});
	
	/* 생일-연도 */
	$('.birth_input_year').keyup( function() {
		if($('.birth_input_year').val() == ""){
			birthYearCheck = false;
		}else{
			birthYearCheck = true;
		}
	});
	
	/* 생일-월 */
	$('.birth_input_month').keyup( function() {
		if($('.birth_input_month').val() == ""){
			birthMonthCheck = false;
		}else{
			birthMonthCheck = true;
		}
	});
	
	/* 생일-일 */
	$('.birth_input_date').keyup( function() {
		if($('.birth_input_date').val() == ""){
			$('.chkList_birthChk').prop('checked',false);
			birthDateCheck = false;
		}else{
			birthDateCheck = true;
		}
	});
	


	
	/* 약관 모달 */
	// 현재 하나의 모달만 만들어 링크건 상태임
$('.termShow_ess_btn_1').click(function(e){
	e.preventDefault();
	$('#termShow_ess_1').modal("show");
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