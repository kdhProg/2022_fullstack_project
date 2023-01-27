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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
#currentSession{
	display:none;
}
</style>
<body>
<!-- 현재세션값 자바스크립트 넘기기-->
<span id="currentSession">${member.getMemId()}</span>

<h1>장바구니페이지임</h1>
<form action="/order/orderPage" method="post">
	<p>=상온=</p>
	<div id="cartListRoomTemp"></div>
	<hr />
	<p>=냉장=</p>
	<div id="cartListRefrigerated"></div>
	<hr />
	<p>=냉동=</p>
	<div id="cartListFrozen"></div>
	<hr />
	<div>
	<p>총할인가: </p><input type="text" id="totalSalePrice" name="totalSalePrice" readonly="readonly"/>
	<p>총액: </p><input type="text" id="totalPrice" name="totalPrice" readonly="readonly"/>
	</div>
	<button type="button" id="regist_ship_btn">배송지 등록하기</button>
	<input type="text" id="shipList_inputBox" name="shipDestination" placeholder="배송지" readonly="readonly"/><br />
	<button id="enter_order">주문하기</button>
</form>
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
			
			let roomTempString = "<table><tr><th>상품명</th><th>수량조정</th><th>삭제</th></tr>"; //상온
			let refrigeratedString = "<table><tr><th>상품명</th><th>수량조정</th><th>삭제</th></tr>"; //냉장
			let frozenString = "<table><tr><th>상품명</th><th>수량조정</th><th>삭제</th></tr>"; //냉동
			
			totalPrice = 0; // 초기화
			
			for(let i=0;i<cartList.length;i++){
				if(prodResult[i].pdStorageType === "냉동"){
					frozenString += "<tr>";
					frozenString += "<td><a href='/goods/detailView?pdId="+prodResult[i].pdId+"'>"+prodResult[i].pdName+"</a></td>";
					/* 수량버튼추가 */
					frozenString+= '<td><button type="button" class="cartQuantityPlus" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>';
					frozenString+= '<span class="pdQuantity'+cartList[i].caNo+'">'+cartList[i].caQuantity+'</span>';
					frozenString+= '<input type="hidden" name="pdValue'+cartList[i].caNo+'" value="'+prodResult[i].pdPrice+'">'; //증감기능에 상품가격 전달용도
					frozenString+= '<input type="hidden" name="pdSale'+cartList[i].caNo+'" value="'+prodResult[i].pdSale+'">'; //증감기능에 상품할인가 전달용도
					frozenString+= '<input type="hidden" name="caNo'+cartList[i].caNo+'" value="'+cartList[i].caNo+'">'; //AJAX에 pdId 전달용도
					//수량1이면 빼기버튼 disabled상태로 생성
					if(cartList[i].caQuantity===1){
						frozenString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'" disabled="disabled"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button></td>';
					}else{
						frozenString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button></td>';
					}
					/* === */
					frozenString += '<td><button type="button" class="deleteBtn" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></button></td>';
					frozenString += "</tr>";
					totalPrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(100-prodResult[i].pdSale)/100);
					totalSalePrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(prodResult[i].pdSale)/100);
				}
				if(prodResult[i].pdStorageType === "냉장"){
					refrigeratedString += "<tr>";
					refrigeratedString += "<td><a href='/goods/detailView?pdId="+prodResult[i].pdId+"'>"+prodResult[i].pdName+"</a></td>";
					/* 수량버튼추가 */
					refrigeratedString+= '<td><button type="button" class="cartQuantityPlus" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>';
					refrigeratedString+= '<span class="pdQuantity'+cartList[i].caNo+'">'+cartList[i].caQuantity+'</span>';
					refrigeratedString+= '<input type="hidden" name="pdValue'+cartList[i].caNo+'" value="'+prodResult[i].pdPrice+'">'; //증감기능에 상품가격 전달용도
					refrigeratedString+= '<input type="hidden" name="pdSale'+cartList[i].caNo+'" value="'+prodResult[i].pdSale+'">'; //증감기능에 상품할인가 전달용도
					refrigeratedString+= '<input type="hidden" name="caNo'+cartList[i].caNo+'" value="'+cartList[i].caNo+'">'; //AJAX에 pdId 전달용도
					if(cartList[i].caQuantity===1){
						refrigeratedString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'" disabled="disabled"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button></td>';
					}else{
						refrigeratedString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button></td>';
					}
					/* === */
					refrigeratedString += '<td><button type="button" class="deleteBtn" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></button></td>';
					refrigeratedString += "</tr>";
					totalPrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(100-prodResult[i].pdSale)/100);
					totalSalePrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(prodResult[i].pdSale)/100);
				}
				if(prodResult[i].pdStorageType === "상온"){
					roomTempString += "<tr>";
					roomTempString += "<td><a href='/goods/detailView?pdId="+prodResult[i].pdId+"'>"+prodResult[i].pdName+"</a></td>";
					/* 수량버튼추가 */
					roomTempString+= '<td><button type="button" class="cartQuantityPlus" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>';
					roomTempString+= '<span class="pdQuantity'+cartList[i].caNo+'">'+cartList[i].caQuantity+'</span>';
					roomTempString+= '<input type="hidden" name="pdValue'+cartList[i].caNo+'" value="'+prodResult[i].pdPrice+'">'; //증감기능에 상품가격 전달용도
					roomTempString+= '<input type="hidden" name="pdSale'+cartList[i].caNo+'" value="'+prodResult[i].pdSale+'">'; //증감기능에 상품할인가 전달용도
					roomTempString+= '<input type="hidden" name="caNo'+cartList[i].caNo+'" value="'+cartList[i].caNo+'">'; //AJAX에 pdId 전달용도
					if(cartList[i].caQuantity===1){
						roomTempString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'" disabled="disabled"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button></td>';
					}else{
						roomTempString+= '<button type="button" class="cartQuantityMinus" name="'+cartList[i].caNo+'" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button></td>';
					}
					/* === */
					roomTempString += '<td><button type="button" class="deleteBtn" value="'+cartList[i].caNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></button></td>';
					roomTempString += "</tr>";
					totalPrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(100-prodResult[i].pdSale)/100);
					totalSalePrice += (cartList[i].caQuantity)*((prodResult[i].pdPrice)*(prodResult[i].pdSale)/100);
				}
			}
			
			roomTempString += "</table>"; 
			refrigeratedString += "</table>"; 
			frozenString += "</table>"; 
			
			$("#cartListFrozen").html(frozenString);
			$("#cartListRefrigerated").html(refrigeratedString);
			$("#cartListRoomTemp").html(roomTempString);
			
			//총액 계산
			$("#totalPrice").val(totalPrice);
			$("#totalSalePrice").val(totalSalePrice);
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
	$("#totalPrice").val(totalPrice); //화면에 반영
	$("#totalSalePrice").val(totalSalePrice); //화면에 반영
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
	$("#totalPrice").val(totalPrice); //화면에 반영
	$("#totalSalePrice").val(totalSalePrice); //화면에 반영
	//수량이 1이 되면 마이너스 버튼 무력화
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