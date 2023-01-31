<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더, 풋터 CSS 링크 -->
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
<link rel="stylesheet" href="/resources/css/mainheader.css" />
<style>
/* 정보전달용 */
#currMemSession,#currSelSession{
	display:none;
}
/* 이미지 오버플로 처리 */
.img_hover_paraentDiv{
	overflow: hidden;
}
/* 이미지 크기조정 */
.pdImg{
	width: 100%;
 	height: 220px;
}
.pdImg:hover{
	transform:scale(1.05);
	transition:1s;
}
/* 상품이미지 장바구니 버튼 */
.img_absolute{
	position: absolute;
	top:170px;
	right:15px;
}
.img_absolute_cartBtn{
	background-color:rgba(255,66,66,0.5);
	width:40px;
	height:40px;
	border: none;
	border-radius: 50%;
}
/* 버튼 장식 제거 */
.btnCateList,.btnBrandList,.btnPriceList,#filter_reload,#modal_cartQuantityPlus,#modal_cartQuantityMinus{
	background: white;
	border-style: none;
}
</style>
</head>
<body>
<!-- 현재 세션 아이디 넘기기-->
<span id="currMemSession">${member.getMemId()}</span><span id="currSelSession">${seller.getSelId()}</span>

	
	<div class="">
		<div id="pdResultList"></div>
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

<!-- 장바구니 모달 -->
<div id="modal_cart" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      	<div class="container">
      		<div class="row">
      			<div class="col">
      				<span>[</span>
      				<span id="modal_pdstlBrandName"></span>
      				<span>]</span>
      				<span id="modal_pdName"></span>
      			</div>
				<div class="col col-lg-4"></div>
      		</div>
      	</div>
      </div>
      <div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col col-lg-6">
					<span class="font_bold">할인율:</span><span id="modal_pdSale"></span><span>%</span>
					<span class="font_bold">가격:</span><span id="modal_pdPrice"></span>
				</div>
				<div class="col col-lg-2"></div>
				<div class="col col-lg-4">
					<button id="modal_cartQuantityMinus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>
					<span id="modal_pdQuantity">1</span>
					<button id="modal_cartQuantityPlus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>
				</div>
			</div>
			<div class="row">
				<div class="col col-lg-2"><span class="font_bold">합계</span></div>
				<div class="col"><span class="font_bold">상품할인금액:&nbsp;</span><span id="modal_salePrice"></span></div>
				<div class="col"><span class="font_bold">총액:&nbsp;</span><span id="modal_totalPrice" class="font_bold font_bigger"></span></div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
      	<button type="button" id="addCartBtn" class="btn btn-primary" data-bs-dismiss="modal">장바구니 담기</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>



<!-- 모달창-로그인 경고 -->
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

/* 세션관련변수 */
let memSession = $('#currMemSession').text();
let selSession = $('#currSelSession').text();
let currentSession; // 현재세션값
if(memSession.length != 0){currentSession = memSession}else{currentSession = selSession}



$(document).ready(reviewTOP30View(1));
function reviewTOP30View() {
	$.ajax({
        url : "/mainEvent/reviewTOP30View",
        type : "get",
        data : {
        	
        },
        success : function(data){
        	
 
            var reviewPdPageList = data.reviewPd30; // model 처럼
        	console.log(reviewPdPageList);
            var reviewPdContentTag = '<div class="container">';

            $.each(reviewPdPageList,
            		function(key, value) {
            			if ((key % 5) === 0) {
            				reviewPdContentTag += '<div class="row">';
            			} //4열이므로
            			reviewPdContentTag += '<div class="col"><div class="card mb-3 img_hover_paraentDiv">';
            			// 상품이미지 => 임의로 넣은값, 상품레코드의 값 쓰고싶다면 수정하기
            			reviewPdContentTag += '<a href="/goods/detailView?pdId='
            					+ value.pdId
            					+ '"><img src="/resources/pdimages/pd_default.jpg" class="card-img-top pdImg" alt="기본이미지"></a>';
            			reviewPdContentTag += '<div class="img_absolute"><button class="img_absolute_cartBtn" value="'+value.pdId+'"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="white" class="bi bi-cart2" viewBox="0 0 16 16"><path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/></svg></button></div>';
            			/* 단순 전달용 태그 - 시작 */
            			reviewPdContentTag += '<input type="hidden" name="pdPrice'+value.pdId+'" value="'+value.pdPrice+'">'; //증감기능에 상품가격 전달용도
            			reviewPdContentTag += '<input type="hidden" name="pdSale'+value.pdId+'" value="'+value.pdSale+'">'; //증감기능에 상품할인가 전달용도
            			reviewPdContentTag += '<input type="hidden" name="pdName'+value.pdId+'" value="'+value.pdName+'">'; //증감기능에 상품명 전달용도
            			reviewPdContentTag += '<input type="hidden" name="pdstlBrandName'+value.pdId+'" value="'+value.pdstlBrandName+'">'; //증감기능에 상품브랜드명 전달용도
            			/* 단순 전달용 태그 - 끝 */
            			reviewPdContentTag += '<div class="card-body">';
            			reviewPdContentTag += '<h5 class="card-title">['
            					+ value.pdstlBrandName + ']</h5>';
           					reviewPdContentTag += "<span><a href='/goods/detailView?pdId="
            					+ value.pdId
            					+ "'>"
            					+ value.pdName
            					+ "</a></span></br>";
            			if (value.pdSale > 0) {
            				//할인하는상품=>정가/할인율/할인가 모두 표시
            				reviewPdContentTag += "<span class='pdSale_sale'>"
            						+ value.pdSale + "%</span>&nbsp;";
            				reviewPdContentTag += "<span class='pdSale_totalPrice'>"
            						+ ((value.pdPrice) * (100 - value.pdSale) / 100)
            								.toLocaleString('ko-KR')
            						+ "원</span></br>";
            				reviewPdContentTag += "<span class='pdSale_originPrice'>"
            						+ value.pdPrice.toLocaleString('ko-KR')
            						+ "원</span>";
            			} else {
            				//NO할인
            				reviewPdContentTag += "<p class='pdPrice'>"
            						+ value.pdPrice.toLocaleString('ko-KR')
            						+ "원</p>";
            			}
            			reviewPdContentTag += '</div>';
            			reviewPdContentTag += '</div></div>'; // col끝

            			if ((reviewPdPageList.length % 5) !== 0) { // 한 행이4개보다 적을 경우가 생긴다면 마지막에 빈 개수만큼 채워줘야함
            				if (key === reviewPdPageList.length - 1) { //마지막줄에만 적용해야하므로 ( 메인태그 다 만들고 부족한 개수만큼 추가)
            					for (let k = 0; k < (5 - (reviewPdPageList.length % 5)); k++) {
            						reviewPdContentTag += '<div class="col"><div>';
            						reviewPdContentTag += '<div>';
            						reviewPdContentTag += '</div>';
            						reviewPdContentTag += '</div></div>';
            					}
            				}
            			}

            			if ((key % 5) === 4) {
            				reviewPdContentTag += '</div>';
            			} //row끝    
            		});

            reviewPdContentTag += '</div>';
            $("#pdResultList").html(reviewPdContentTag); //메인 컨텐츠 적용
			
			
        },
        error : function(){
             alert('error - reviewPd30');
        }//error
    });//ajax
}// function end

/* 장바구니 관련 */
//변수선언
let pdPrice;
let pdSale;
let pdName;
let pdstlBrandName;
let pdId;

//모달창 열기
$(document).on('click', '.img_absolute_cartBtn', function(){
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	pdId = $(this).val();
	pdPrice = $("input[name=pdPrice"+pdId+"]").val();
	pdSale = $("input[name=pdSale"+pdId+"]").val();
	pdName = $("input[name=pdName"+pdId+"]").val();
	pdstlBrandName = $("input[name=pdstlBrandName"+pdId+"]").val();
	
	//모달창 내용 수정
	quantityVal = 1; // 증감변수 1로 초기화
	$("#modal_pdQuantity").text(1);
	$("#modal_pdPrice").text(Number(pdPrice).toLocaleString('ko-KR'));
	$("#modal_pdSale").text(pdSale);
	$("#modal_totalPrice").text(pdPrice.toLocaleString('ko-KR'));
	$("#modal_salePrice").text((pdPrice *(pdSale)/100).toLocaleString('ko-KR'));
	$("#modal_pdName").text(pdName);
	$("#modal_pdstlBrandName").text(pdstlBrandName);
	
	$("#modal_cart").modal("show");
});

//모달창에서 로그인 버튼
$("#warn_modal_login").click(function(){
	location.href = "/member/login";
});

//수량증감용 변수
let quantityVal = 1;

//총가격
let computeTotal;
//총할인공제가
let computeSaleTotal;

$("#modal_cartQuantityPlus").click(function(){
	quantityVal += 1;
	computeTotal = pdPrice *(100-pdSale)/100 * quantityVal;
	computeSaleTotal = pdPrice *(pdSale)/100 * quantityVal;
	$("#modal_totalPrice").text(computeTotal.toLocaleString('ko-KR'));
	$("#modal_pdQuantity").text(quantityVal);
	$("#modal_salePrice").text(computeSaleTotal.toLocaleString('ko-KR'));
});
$("#modal_cartQuantityMinus").click(function(){
	if(quantityVal===1){return false;}  // 수량이1이면 더이상 감소X
	quantityVal -= 1;
	computeTotal = pdPrice *(100-pdSale)/100 * quantityVal;
	computeSaleTotal = pdPrice *(pdSale)/100 * quantityVal;
	$("#modal_totalPrice").text(computeTotal.toLocaleString('ko-KR'));
	$("#modal_pdQuantity").text(quantityVal);
	$("#modal_salePrice").text(computeSaleTotal.toLocaleString('ko-KR'));
});

//장바구니 버튼 클릭
$("#addCartBtn").click(function(){
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	let productQuantity = $("#pdQuantity").text();
	$.ajax({
		type : "post",
		url : "/cart/addCart",
		data : {
			currentSession : currentSession,
			pdId : pdId,
			productQuantity : quantityVal
		},
		success : function(rst){
			let result = rst;
			if(result === "alreadyIn"){
				alert("장바구니에 상품을 추가했습니다. 이미 담은 상품에 수량을 추가했습니다.");
			}else{
				alert("장바구니에 상품을 추가했습니다.");
			}
		}// success 종료
	}); // ajax 종료
});
</script>
</html>