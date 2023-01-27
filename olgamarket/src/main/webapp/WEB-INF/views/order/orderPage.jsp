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
<style>
#currentSession,#totalPriceSession,#totalSalePriceSession{
	display:none;
}
#pay_simple{
	display:none;
}
</style>
<body>
<!-- 현재세션값 자바스크립트 넘기기-->
<span id="currentSession">${member.getMemId()}</span>
<!-- 총가격,총할인가-->
<span id="totalPriceSession">${totalPrice}</span>
<!-- 총가격,총할인가-->
<span id="totalSalePriceSession">${totalSalePrice}</span>


<h1>여기는 주문 페이지임</h1>
<span id="showFirstCartProduct"></span><span id="prodAdditionalCountInfo"><span>외</span><span id="showProductCount"></span><span>건을 주문합니다.</span></span><span id="singleOrder">을(를) 주문합니다.</span>
<hr />
<div>
	<span id="showDestination">배송지:${shipDestination}</span>
</div>
<hr />
<p>결제수단</p>
<form action="/order/orderAction" method="post">
<div class="row justify-content-center">
	<div class="col col-lg-3">
		<input type="radio" class="btn-check" name="payType" id="payType1" value="payType1" autocomplete="off" checked="checked">
		<label class="btn btn-outline-danger" for="payType1">신용카드</label>
	</div>
	<div class="col col-lg-3">
		<input type="radio" class="btn-check" name="payType" id="payType2" value="payType2" autocomplete="off">
		<label class="btn btn-outline-danger" for="payType2">간편결제</label>
	</div>
	<div class="col col-lg-3">
		<input type="radio" class="btn-check" name="payType" id="payType3" value="payType3" autocomplete="off">
		<label class="btn btn-outline-danger" for="payType3">휴대폰</label>
	</div>
</div>
<div id="pay_card">
	<select name="payCard" >
		<option value="none" disabled="disabled">=== 카드선택 ===</option>
		<option value="현대">현대</option>
		<option value="신한">신한</option>
		<option value="KB국민">KB국민</option>
	</select>
</div>
<div id="pay_simple">
	<label for="naverPay">네이버페이</label>
	<input type="radio" id="naverPay" name="pay_simple" value="네이버페이" checked="checked">
	<br />
	<label for="smilePay">스마일페이</label>
	<input type="radio" id="smilePay" name="pay_simple" value="스마일페이">
	<br />
	<label for="toss">토스</label>
	<input type="radio" id="toss" name="pay_simple" value="토스">
	<br />
	<label for="payco">페이코</label>
	<input type="radio" id="payco" name="pay_simple" value="페이코">
</div>
<div id="essentialChkBoxes">
	<label for="essOne">필수약관1</label>
	<input type="checkbox" id="essOne" value="ess1">
	<br />
	<label for="essTwo">필수약관2</label>
	<input type="checkbox" id="essTwo" value="ess1">
</div>
<!-- 여기부터는 순수 전송용 -->
<input type="hidden" value="${member.getMemId()}" name="memId"/>
<input type="hidden" value="${shipDestination}"  name="shipDestination"/>

<p>총할인액:${totalSalePrice}</p>
<p>총가격:${totalPrice}</p>
<button id="orderBtn">${totalPrice}원 주문하기</button>
</form>

<!-- 필수약관 경고 모달 -->
<div id="validataion_warn_msg" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="center-align modal-body">
        <p>필수약관을 체크하세요.</p>
      </div>
      <div class="center-align modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>



</body>
<script>
//현재 세션값(memId)
let currentSession = $("#currentSession").text();
// 전체값 / 할인공제값
let totalPrice = $("#totalPriceSession").text();
let totalSalePrice = $("#totalSalePriceSession").text();


$(document).ready(function(){
	//초기 상품명 / 몇건 표시
		$.ajax({
			type : "post",
			url : "/cart/getOrderInitInfos",
			data : {
				memId : currentSession
			},
			success : function(result){
				let cartListFirstProdName = result.cartListFirstProdName; //장바구니 첫번째 상품명
				let cartListCount = Number(result.cartListCount); //장바구니에 담긴 상품 개수
				
				/* 상단 ~ 건 ~주문 정보 표시 */
				$("#showFirstCartProduct").text(cartListFirstProdName);
				if(cartListCount === 1){
					//상품종류가 1개인 경우 => ~외 몇 건 표시 필요없음
					$("#prodAdditionalCountInfo").css("display","none");
				}else{
					$("#showProductCount").text(cartListCount-1); //~외 몇건 이므로 -1하기
					$("#singleOrder").css("display","none");
				}
				
				/* input박스에 넣기 */
				
				
			}// success 종료
		}); // ajax 종료	
});


//결제수단 토글
//신용카드
$("#payType1").click(function(){
	$("#pay_simple").css('display','none');
	$("#pay_card").css('display','block');
});

//간편결제
$("#payType2").click(function(){
	$("#pay_simple").css('display','block');
	$("#pay_card").css('display','none');
});

//휴대폰결제
$("#payType3").click(function(){
	$("#pay_simple").css('display','none');
	$("#pay_card").css('display','none');
});


//주문버튼 - 필수약관 다 체크해야 주문됨
/* 필수약관체크1 */
$('.essentialOne').change( function() {
	if($('.essentialOne').is(':checked')){
		essentialOneCheck = true;
	}
});

$("#orderBtn").click(function(){
	if(!$('#essOne').is(':checked') || !$('#essTwo').is(':checked')){$("#validataion_warn_msg").modal("show");return false;}
});
</script>
</html>