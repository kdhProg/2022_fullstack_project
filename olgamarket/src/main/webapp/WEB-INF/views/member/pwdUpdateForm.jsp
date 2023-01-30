<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 헤더, 풋터 CSS 링크 -->
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
<link rel="stylesheet" href="/resources/css/mainheader.css" />
<style>
/* 순수정보얻기용 태그 */
.temp_memId, .temp_typeSelRadio{
	display:none;
}	

* {
	/* 초기화 */
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    letter-spacing: 0;
    word-spacing: 0;
}
/* 판매자/일반회원 선택버튼 => 버튼의 label태그에 붙어있음 */
.typebtn{ 
      height: 40px;
      width: 120px;
      font-weight: bold;
}
/* 사업자 등록번호는 처음에는 안보임 */
.form_selRegiNum,.success_result{
	display: none;
}
/* a태그 장식 없애기 */
a{
	text-decoration: none;
	color:black;
}
/* 메인 타이틀 */
.main_title{
	font-weight: bold;
	font-size: 20px;
}
/* row 간격늘리기 */
.row_margin{
	margin-bottom: 10px;
}

.pwd_upd_wrap{
	width:70%;
}

/* 모달 가운데 정렬 */
.center-align{
	text-align: center;
	vertical-align:middle;
	font-weight: bold;
}

/* 로그인/비찾 폰트 */
.find_font{
	font-weight: bold;
	font-size: 12px;
}

/* 찾기버튼 */
.upd_btn{
	height: 40px;
	width:300px;
    font-weight: bold;
    font-size: 15px;
}

/* 아이디 폰트 조정 */
.show_id{
	color:#FF6363;
	font-weight: bold;
}

.show_id_pre{
	font-weight: bold;
}


/* 테스트 */
.col{
/* 	border:1px solid red; */
}
</style>
<body>
<!-- hidden처리한 정보들 -->
<span class="temp_memId">${memId}</span><span class="temp_typeSelRadio">${typeSelRadio}</span>

<div class="pwd_upd_wrap container text-center">
	<div class="row">
		<div class="col col-lg-2">
		</div>
		<div class="col main_title">
			<span>비밀번호 수정(</span><span class="memType_show" style="color:#FF6363"></span><span>)</span>
		</div>
		<div class="col col-lg-2">
		</div>
	</div>
	<form id="find_pwd_form" class="form-horizontal" method="get">
	<!-- hidden처리한 정보 -->
	<input class="typeSelRadio" type="text" hidden="hidden" name="typeSelRadio"/>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input type="hidden" class="id_input form-control" readonly="readonly" name="memId"/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<span class="show_id_pre">아이디: </span><span class="show_id">${memId}</span>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input type="password" class="pw_input form-control" name="memPwd" placeholder="비밀번호를 입력해주세요."/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    	<span class="pwd_alert_box"></span>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input type="password" class="pwck_input form-control" placeholder="비밀번호를 다시한번 입력해주세요."/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    	<span class="pwck_alert_box"></span>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<button type="button" class="upd_btn btn btn-danger">비밀번호 수정</button>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
    </form>
</div>

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

<!-- 모달창 -->
<div id="validataion_warm_msg" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal_msg center-align modal-body">

      </div>
      <div class="center-align modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
let memId = $(".temp_memId").text();
let typeSelRadio = $(".temp_typeSelRadio").text();
let pwdFormatCheck = false;
let pwdChekerFormatCheck = false;

$(document).ready(function(){
	if(typeSelRadio === "normalMem"){
		//일반회원임
		$(".memType_show").text("일반회원");
		$(".id_input").val(memId);
		$(".typeSelRadio").val(typeSelRadio);
	}else{
		//판매자회원임
		$(".memType_show").text("판매자");
		$(".id_input").val(memId);
		$(".typeSelRadio").val(typeSelRadio);
	}
});

$(".upd_btn").click(function(){
	if($(".pw_input").val().length==0){$(".modal_msg").html("<p>비밀번호를 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
	if($(".pwck_input").val().length==0){$(".modal_msg").html("<p>비밀번호 확인란을 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
	// 모든 입력칸 입력됨
	
	if(pwdFormatCheck && pwdChekerFormatCheck){
		$(".modal_msg").html("<p>비밀번호가 성공적으로 수정되었습니다.</p><p>로그인 화면으로 이동합니다.</p>");$('#validataion_warm_msg').modal("show");
		$('#validataion_warm_msg').on('hidden.bs.modal', function () {
			$("#find_pwd_form").attr("action", "/member/updatePwdAct");
			$("#find_pwd_form").submit();
    	});
	}
	return false;
});

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
		}
	}else{
		let pwdOrigin_temp = $('.pwck_input').val();
		let pwdChekcer_temp = $('.pw_input').val();
		if(pwdOrigin_temp !== pwdChekcer_temp){
	 		//비밀번호 + 비밀번호 확인 모두 통과하고 비밀번호를 바꿨는데(=비밀번호랑 비밀번호 확인이랑 다른 경우) 형식은 맞은 경우
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호와 동일하지 않습니다</span>");
			pwdChekerFormatCheck = false;
	 	}
	 	$('.pwd_alert_box').css('display','none');
// 	 	$('.pwd_alert_box').html("<span style='color: green'>비밀번호 형식 검사 완료</span>");
	 	$('.pwck_input').val(null);
	 	pwdFormatCheck = true;
	}
});

function pwdFormatChk(value) {
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
		pwdChekerFormatCheck = false;
	}else{
		if(pwdFormatCheck){
	 	$('.pwck_alert_box').css('display','none');
// 	 	$('.pwck_alert_box').html("<span style='color: green'>동일성 검사 완료</span>");
	 	pwdChekerFormatCheck = true;
		}else{
			//이 경우는 동일한데 형식이 안맞는 경우
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호 형식을 확인하세요</span>");
		}
	}
});


</script>
</html>