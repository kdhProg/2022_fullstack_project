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
.col{
/*  	border:1px solid red;  */
}
</style>
<body>
<!-- 현재세션값 자바스크립트 넘기기-->
<span id="currentSession">${member.getMemId()}</span>

<div class="container">
	<form action="/order/orderPage" class="form-horizontal" method="post">
		<div class="row text-center">
			<div class="col col-lg-4"></div>
			<div class="col">
				<h4><strong>장바구니</strong></h4>
			</div>
			<div class="col col-lg-4"></div>
		</div>
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
			defaultAddress += "<button class='defaultAddress_btn' value='"+result.defaultAddress+"'>선택</button>";
			
			let shipList = result.shipList; //다른 배송지 주소들
			
			let shipListString = "<table><tr><th>등록된 배송지</th></tr>";
			$.each(shipList, function(key, value) {
				shipListString += "<tr>";
				shipListString += "<td>"+value.slAddress+"</td>"
				shipListString += "<td><button class='shipList' value='"+value.slAddress+"'>선택</button></td>"
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
</script>
</html>