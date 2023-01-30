<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Olga-결제페이지</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
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
/* 버튼 영역에 꽉채우기 */
.full-width-btn{
	width:100%;
}
/* col클래스 padding제거 */
.eliminate_padding_col{
	padding: 0;
}
/* hr태그 마진 조정 */
hr{
	margin-bottom: 6px;
	margin-top: 6px;
}
/* 전체 폼 크기조정 */
#entire_container{
	width:80%;
}
/* 상세정보버튼 크기조정*/
#detailInfo_btn{
	height: 35px;
}
/* 주문상품문구 폰트 */
#singleOrder,#showFirstCartProduct{
	font-weight: bold;
}
.col{
/* 	border: 1px red solid; */
}
</style>
<body>
<!-- 현재세션값 자바스크립트 넘기기-->
<span id="currentSession">${member.getMemId()}</span>
<!-- 총가격,총할인가-->
<span id="totalPriceSession">${totalPrice}</span>
<!-- 총가격,총할인가-->
<span id="totalSalePriceSession">${totalSalePrice}</span>

<div id="entire_container" class="container">
	<form action="/order/orderAction" method="post">
		<div class="row text-center">
			<div class="col col-lg-4"></div>
			<div class="col">
				<h4><strong>주문서</strong></h4>
			</div>
			<div class="col col-lg-4"></div>
		</div>
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col col-lg-2"><h5><strong>주문상품</strong></h5></div>
				</div>
				<hr />
				<div class="row">
					<div class="col text-center">
						<span id="showFirstCartProduct"></span><span id="prodAdditionalCountInfo"><span>외</span><span id="showProductCount"></span><span>건을 주문합니다.</span></span><span id="singleOrder">을(를) 주문합니다.</span>
					</div>
				</div>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col col-lg-2"><h5><strong>주문자 정보</strong></h5></div>
				</div>
				<hr />
				<div class="row">
					<div class="col col-lg-2">보내는분</div>
					<div class="col"><span id="order_memName"></span></div>
				</div>
				<div class="row">
					<div class="col col-lg-2">휴대폰</div>
					<div class="col"><span id="order_memPhone"></span></div>
				</div>
				<div class="row">
					<div class="col col-lg-2">이메일</div>
					<div class="col"><span id="order_memEmail"></span></div>
				</div>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col col-lg-2"><h5><strong>배송 정보</strong></h5></div>
				</div>
				<hr />
				<div class="row">
					<div class="col col-lg-2">배송지</div>
					<div class="col">
						<span id="showDestination">${shipDestination}</span>
					</div>
				</div>
				<div class="row">
					<div class="col col-lg-2">상세정보</div>
					<div class="col">
						<button id="detailInfo_btn" type="button" class="btn btn-outline-secondary">입력</button>
					</div>
				</div>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col col-lg-2">
						<h5><strong>결제수단선택</strong></h5>
					</div>
					<hr />
					<div class="col">
						<div class="row">
							<div class="col">
								<div class="row justify-content-center">
									<div class="eliminate_padding_col col col-lg-3">
										<input type="radio" class="btn-check" name="payType" id="payType1" value="payType1" autocomplete="off" checked="checked">
										<label class="full-width-btn btn btn-outline-danger" for="payType1"><strong>신용카드</strong></label>
									</div>
									<div class="eliminate_padding_col col col-lg-3">
										<input type="radio" class="btn-check" name="payType" id="payType2" value="payType2" autocomplete="off">
										<label class="full-width-btn btn btn-outline-danger" for="payType2"><strong>간편결제</strong></label>
									</div>
									<div class="eliminate_padding_col col col-lg-3">
										<input type="radio" class="btn-check" name="payType" id="payType3" value="payType3" autocomplete="off">
										<label class="full-width-btn btn btn-outline-danger" for="payType3"><strong>휴대폰</strong></label>
									</div>
								</div>
							</div>
							<br />
							<div class="row text-center">
								<div class="col col-lg-2"></div>
								<div class="col">
									<div id="pay_card">
										<select class="form-select" name="payCard" >
											<option value="none" disabled="disabled">=== 카드선택 ===</option>
											<option value="현대">현대</option>
											<option value="신한">신한</option>
											<option value="KB국민">KB국민</option>
										</select>
									</div>
									<div id="pay_simple" class="text-start">
										<input type="radio" id="naverPay" class="form-check-input" name="pay_simple" value="네이버페이" checked="checked">
										<label class="form-check-label" for="naverPay">네이버페이</label>
										<br />
										<input type="radio" id="smilePay" class="form-check-input" name="pay_simple" value="스마일페이">
										<label class="form-check-label" for="smilePay">스마일페이</label>
										<br />
										<input type="radio" id="toss" class="form-check-input" name="pay_simple" value="토스">
										<label class="form-check-label" for="toss">토스</label>
										<br />
										<input type="radio" id="payco" class="form-check-input" name="pay_simple" value="페이코">
										<label class="form-check-label" for="payco">페이코</label>
									</div>
								</div>
								<div class="col col-lg-2"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col col-lg-3">
				<div class="row">
					<div class="col col-lg-6"><h5><strong>결제금액</strong></h5></div>
				</div>
				<div class="row">
					<div class="col col-lg-6">주문금액</div>
					<div class="col">${totalPrice}</div>
				</div>
				<div class="row">
					<div class="col col-lg-6">배송비</div>
					<div class="col">0원</div>
				</div>
				<div class="row">
					<div class="col col-lg-6">상품할인금액</div>
					<div class="col">
						${totalSalePrice}
					</div>
				</div>
				<div class="row">
					<div class="col col-lg-6">최종결제금액</div>
					<div class="col">${totalPrice}</div>
				</div>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col col-lg-2"><h5><strong>개인정보 수집/제공</strong></h5></div>
				</div>
				<hr />
				<div class="row">
					<div class="col col-lg-2"></div>
					<div class="col">
						<div id="essentialChkBoxes">
							<input type="checkbox" id="essOne" class="form-check-input" value="ess1">
							<label class="form-check-label" for="essOne">(필수) 개인정보 수집∙이용 및 처리 동의</label>
							<br />
							<input type="checkbox" id="essTwo" class="form-check-input" value="ess1">
							<label class="form-check-label" for="essTwo">(필수) 개인정보 제3자 제공 동의</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br />
		<!-- 순수 전송용 시작-->
		<input type="hidden" value="${member.getMemId()}" name="memId"/>
		<input type="hidden" value="${shipDestination}"  name="shipDestination"/>
		<!-- 순수 전송용 끝-->
		<div class="row">
			<div class="col col-lg-4"></div>
			<div class="col text-center">
				<button id="orderBtn" class="btn btn-danger"><strong>${totalPrice}원 주문하기</strong></button>
			</div>
			<div class="col col-lg-4"></div>
		</div>
	</form>
</div>

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
$("#orderBtn").click(function(){
	if(!$('#essOne').is(':checked') || !$('#essTwo').is(':checked')){$("#validataion_warn_msg").modal("show");return false;}
});

//회원정보 나타내기
$(document).ready(()=>{
	let memId = currentSession;
	$.ajax({
		type : "post",
		url : "/member/getMemVOBySessionFromOrderPage",
		data : {
			memId : currentSession
		},
		success : function(rst){
			let result = rst.currMemVO;
			$('#order_memName').text(result.memName);
			$('#order_memPhone').text(result.memPhone);
			$('#order_memEmail').text(result.memEmail);
		}// success 종료
	}); // ajax 종료	
});
</script>
</html>