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

.find_id_wrap{
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
.find_btn{
	height: 40px;
	width:300px;
    font-weight: bold;
    font-size: 15px;
}

/* 테스트 */
.col{
/* 	border:1px solid red; */
}
</style>
<body>
<div class="find_id_wrap container text-center">
	<div class="row">
		<div class="col col-lg-2">
		</div>
		<div class="col">
			<span class="main_title">아이디 찾기</span>
		</div>
		<div class="col col-lg-2">
		</div>
	</div>
	<form class="form-horizontal" action="" method="get">
		<div class="row_margin inside_form_wrap">
			<!-- 일반회원/판매자 토글 버튼 : 컨트롤러에서 value를 보고 판단하도록 한다. -->
			<div class="typeSelect_btn_wrap row_margin row justify-content-center">
			    <div class="col col-lg-3">
		    		<input type="radio" class="btn-check" name="typeSelRadio" id="typeSel1" value="normalMem" autocomplete="off" checked="checked">
					<label class="typebtn btn btn-outline-danger" for="typeSel1">일반회원</label>
			    </div>
			    <div class="col col-lg-3">
			   		<input type="radio" class="btn-check" name="typeSelRadio" id="typeSel2" value="sellerMem" autocomplete="off">
					<label class="typebtn btn btn-outline-danger" for="typeSel2">판매자회원</label>
			    </div>
		    </div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input class="form_name form-control" name="memName" type="text" placeholder="성함을 입력하세요" maxLength="5"/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input class="form_phone form-control" name="memPhone" type="text" oninput="autoHyphen(this)" placeholder="전화번호를 입력하세요" maxLength="13"/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input class="form_selRegiNum form-control" name="selRegiNum" type="text" placeholder="사업자등록번호를 입력하세요" maxLength="10" 
	    		oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<button type="button" class="find_btn btn btn-danger">아이디 찾기</button>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="success_result row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="success_result_msg col">
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="success_result_btn row_margin row">
		    <div class="col col-lg-4"></div>
		    	<div class="find_font col">
		    		<a href="/member/login">로그인</a>
		    	</div>
		    	<div class="find_font col">
		    		<a href="/member/findPwd">비밀번호찾기</a>
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
let sellerSelected = false;
$(".find_btn").click(function(){
	if($(".form_name").val().length==0){$(".modal_msg").html("<p>이름을 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
	if($(".form_phone").val().length==0){$(".modal_msg").html("<p>전화번호를 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
	if(sellerSelected){
		if($(".form_selRegiNum").val().length==0){$('.warn_msg').css('display','block');$(".modal_msg").html("<p>사업자등록번호를 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
	}
	// 모든 입력칸 입력됨
	let memName = $(".form_name").val();
	let memPhone = $(".form_phone").val();
	let selSelRegiNo;
	if(sellerSelected){
		//판매자면 값 담기
		selSelRegiNo = $(".form_selRegiNum").val();
	}else{
		//일반회원의 경우
		selSelRegiNo = "defaultMember";
	}
	$.ajax({
		type : "get",
		url : "/member/findIdAct",
		data : {
			memName : memName,
			memPhone : memPhone,
			selSelRegiNo : selSelRegiNo
		},
		success : function(result){
			if(result != "failed"){
				// 찾기 성공
				$('.success_result_msg').html("<p style='color: green'>아이디를 찾았습니다: "+result+"</p>");	
				$('.success_result').show();	
				// 찾으면 입력폼 / 경고메시지 none
				$('.form_name').prop('disabled',true);
				$('.form_phone').prop('disabled',true);
				$('.form_selRegiNum').prop('disabled',true);
				$('.find_btn').prop('disabled',true);
				$('#typeSel2').prop('disabled',true);
				$('#typeSel1').prop('disabled',true);
			}else{
				// 찾기 실패
				$(".modal_msg").html("<p>아이디가 존재하지 않습니다.</p>");
				$('#validataion_warm_msg').modal("show");
			}
		}// success 종료
	}); // ajax 종료	
});

// $(".form_name").keyup(function(){
// 	if($(".form_name").val()==""){
// 		$(".modal_msg").html("<p>이름을 입력하세요.</p>");
// 		$('#validataion_warm_msg').modal("show");
// 	}
// });

// $(".form_phone").keyup(function(){
// 	if($(".form_phone").val()==""){
// 		$(".modal_msg").html("<p>전화번호를 입력하세요.</p>");
// 		$('#validataion_warm_msg').modal("show");
// 	}
// });

// $(".form_selRegiNum").keyup(function(){
// 	if(sellerSelected){
// 		if($(".form_selRegiNum").val()==""){
// 			$(".modal_msg").html("<p style='color: red'>사업자등록번호를 입력하세요.</p>");
// 			$('#validataion_warm_msg').modal("show");
// 		}
// 	}
// });

//전화번호 오토하이픈
function autoHyphen(target){
	return target.value = target.value.replace(/[^0-9]/g, '')
	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	.replace(/(\-{1,2})$/g, "");
}


/* 판매자 회원 버튼 토글 */

//판매자 모드
$("#typeSel2").click(function(){
	$(".form_selRegiNum").css('display','block');
	sellerSelected = true;
});

//일반 모드
$("#typeSel1").click(function(){
	$(".form_selRegiNum").css('display','none');
	sellerSelected = false;
});

</script>
</html>