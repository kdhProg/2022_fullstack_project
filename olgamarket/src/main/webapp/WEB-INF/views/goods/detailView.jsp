<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title></title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
/* 데이터만을위한 태그 시야에서 제거 */
#justForPdId,#currMemSession,#currSelSession,#favorList,#justForPdId,#pdPrice,#pdSale{
 	display:none;
}
/* 세션값 */
#irrBnoString,#irrGoodString,#irrBadString{
	display:none;
}
/* a태그 장식제거 */
a{
	text-decoration: none;
}
/* 정렬버튼 */
#sortBtn1{
	font-weight: bold;
}
/* 볼드체 */
.font-custom{
	font-weight: bold;
}
.font_iqModal_header,.font_rvModal_header{
	font-weight: bold;
	color:#ff6b61;
}


/* 상품문의 모달창 textarea 크기 제어 */
/* 부모태그 */
#inquiry_content_div,#rv_content_div{
	width:550px;
}
#inquiry_content,#rv_content{
	resize:none;
	width:100%;
	height:250px; 
}

/* 상품문의답변 모달창 크기제어 */
#inquiryAnswer_content, #inquiryAnsInq_content{
	resize:none;
	width:100%;
	height:250px;
}

/* 커서 설정 */
#favor_heart_btn{
	cursor : pointer;
}
/* 상품 썸네일 */
.pd_thumbnail{
	height:500px;
	overflow: hidden;
}
/* hr태그 마진 조정 */
hr{
	margin-bottom: 6px;
	margin-top: 6px;
}
/* 전체 컨테이너 너비 조정 */
.modify_width_container{
	width:70%;
}
/* 버튼 기본장식 제거 */
.eliminate_default{
	background: white;
	border-style: none;
}
/* 판매사/상품명 */
#show_brdName,#show_pdName{
	font-weight:bold;
	font-size: 1.3em;
}
/* 할인가 표시*/
#show_pdOriginPrice{
	font-weight:bold;
	color:grey;
	text-decoration: line-through;
}
#show_pdTotalPrice{
	font-weight:bold;
	font-size: 1.5em;
}
#show_pdSale{
	font-weight: bold;
	color:#fc5603;
	font-size: 1.5em;
}
/* No할인 정가 표시 */
#show_noSale_price{
	font-weight:bold;
	font-size: 1.5em;
}
/* 장바구니 담기 버튼 */
#addCartBtn{
	width:300px;
	font-weight: bold;
}
/* 상품 상세정보 폰트 조정 */
.font_style_modified{
	color:grey;
	font-family: Georgia, "Malgun Gothic", serif;
}
/* 총 상품금액 폰트 조정 */
#totalPrice{
	font-weight:bold;
	font-size: 1.5em;
}
/* 상품 네비게이션 바 */
.prod_detail_navBar_label{
	width:100%;
	font-weight:bold;
}
/* padding없애기 */
.elminate_padding{
	padding:0;
}
.prod_detail_navBar_div{
	position: sticky;
	background-color: #F8F9FA;
  	top: 0;
}
/* 상품상세이미지 */
#show_prodDetailInfos{
	overflow: hidden;
	width:90%;
}
#show_prodDetailInfosImg{
	width:100%;
	/* 옆으로 미는 용도 */
	padding-left: 100px;
}
/* 상품후기 등록일 작은 폰트*/
.small_font{
	font-size: 0.7em;
}
/* 추천비추천 기본 형식 제거 */
.goodBtn,.badBtn{
	background-color: transparent;
	border-style: none;
}
/* 추천비추천버튼 보더 꾸미기 */
.rvListBtn_wrapper{
	display: inline-block;
/* 	background-color: grey; */
	border-radius:20% / 50%;
	border:1px solid grey;
}
/* 리뷰 이미지 div태그 */
.rv_img_div{
	overflow:hidden;
	width:100px;
	height:70px;
}
/* a태그 검게 */
.a-text-black> a{
	color:black;
}
/* 리뷰/후기 작성 버튼 */
#productReviewEnterBtn,#productInquiryEnterBtn{
	width:100%;
}

/* 테스트 */
.col{
/*    	border:1px solid red; */
}
</style>
</head>
<body>
<!-- 현재 세션 아이디 넘기기-->
<span id="currMemSession">${member.getMemId()}</span><span id="currSelSession">${seller.getSelId()}</span>
<!-- 현재PdId값+기타 -->
<p id="justForPdId">${productDetail.getPdId()}</p>
<span id="pdPrice">${productDetail.getPdPrice()}</span>
<span id="pdSale">${productDetail.getPdSale()}</span>
<!-- 찜목록 -->
<span id="favorList">${favor}</span>
<!-- 상품리뷰 세션값 넘기기 -->
<span id="irrBnoString">${irrBnoString}</span><span id="irrGoodString">${irrGoodString}</span><span id="irrBadString">${irrBadString}</span>
<span id="sessionUpdate"></span>

<div class="container modify_width_container">
	<div class="row justify-content-center">
		<div class="col col-lg-6">
		<!-- 상품썸네일 -->
			<div class="pd_thumbnail">
				<img src="/resources/pdimages/pd_default.jpg" alt="" />
			</div>	
		</div>
		<div class="col col-lg-6">
		<!-- 상품정보 + 찜/장바구니 버튼 -->
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col">
							<span id="show_brdName">[${productDetail.getPdstlBrandName()}]</span>
							<span id="show_pdName">${productDetail.getPdName()}</span>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col col-lg-5">
							<span id="show_pdPrice"></span>
						</div>
						<div class="col col-lg-7">
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					 <div class="row">
						<div class="col col-lg-3">
							<span class="font_style_modified">판매사</span>
						</div>
						<div class="col col-lg-9">
							<span>${productDetail.getPdstlBrandName()}</span>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col col-lg-3">
							<span class="font_style_modified">포장타입</span>
						</div>
						<div class="col col-lg-9">
							<span>${productDetail.getPdStorageType()}</span>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col col-lg-3">
							<span class="font_style_modified">판매단위</span>
						</div>
						<div class="col col-lg-9">
							<span>${productDetail.getPdUnit()}</span>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col col-lg-3">
							<span class="font_style_modified">중량/용량</span>
						</div>
						<div class="col col-lg-9">
							<span>${productDetail.getPdWeight()}</span>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col col-lg-3">
							<span class="font_style_modified">원산지</span>
						</div>
						<div class="col col-lg-9">
							<span>${productDetail.getPdCountry()}</span>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col col-lg-3">
							<span class="font_style_modified">유통기한</span>
						</div>
						<div class="col col-lg-9">
							<span>${productDetail.getPdBBE()}</span>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col col-lg-3">
							<span class="font_style_modified">상품선택</span>
						</div>
						<div class="col col-lg-9">
							<button id="cartQuantityMinus" class="eliminate_default"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-dash-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>
							<span id="pdQuantity">1</span>
							<button id="cartQuantityPlus" class="eliminate_default"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fc5603" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col col-lg-3">
							<span class="font_style_modified">총 상품금액</span>
						</div>
						<div class="col col-lg-9">
							<div>상품할인금액: <span id="salePrice"></span>원</div>
							<div>총 상품금액: <span id="totalPrice"></span>원</div>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="row text-center">
				<div class="col col-lg-2">
					<div id="favor_form">
						<div id="favor_heart_btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="37" height="37" fill="red" class="bi bi-heart" viewBox="0 0 16 16">
							  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
							</svg>
						</div>
					</div>
				</div>
				<div class="col col-lg-10">
					<button type="button" id="addCartBtn" class="btn btn-danger">장바구니 담기</button>
				</div>
			</div>
			<hr />
		</div>
	</div>
	<br />
	<div class="row text-center prod_detail_navBar_div">
		<div class="col elminate_padding">
			<input type="button" class="prod_detail_navBar_input btn-check" id="prod_detail_explains">
			<label class="prod_detail_navBar_label btn btn-light" for="prod_detail_explains">상품설명</label>
		</div>
		<div class="col elminate_padding">
			<input type="button" class="prod_detail_navBar_input btn-check" id="prod_detail_info">
			<label class="prod_detail_navBar_label btn btn-light" for="prod_detail_info">상세정보</label>
		</div>
		<div class="col elminate_padding">
			<input type="button" class="prod_detail_navBar_input btn-check" id="prod_reviews">
			<label class="prod_detail_navBar_label btn btn-light" for="prod_reviews">후기</label>
		</div>
		<div class="col elminate_padding">
			<input type="button" class="prod_detail_navBar_input btn-check" id="prod_inquirys">
			<label class="prod_detail_navBar_label btn btn-light" for="prod_inquirys">문의</label>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<div id="show_prodDetailInfos">
				<!-- 임시로 이미지 설정 -->
				<img id="show_prodDetailInfosImg" src="/resources/pdimages/default_pdDetailImg.png" alt="" />
			</div>
		</div>
	</div>
	<hr />
	<br />
	<br />
	<br />
	<hr />
	<div class="row">
		<div class="col">
			<div id="reivewStart">
				<h5><strong>상품후기</strong></h5>
			</div>
		</div>
		<div class="col">
			<div class="text-end a-text-black">
				<a href="#" onclick="sortList(1);return false;" id="sortBtn1">등록순</a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="sortList(2);return false;" id="sortBtn2">추천순</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="reviewResultList"></div>
		<div id="reviewResultPagingNo"></div>
	</div>
	<div class="row">
		<div class="col col-lg-4"></div>
		<div class="col">
			<button id="productReviewEnterBtn" class="btn btn-danger">후기작성</button>
		</div>
		<div class="col col-lg-4"></div>
	</div>
	<hr />
	<br />
	<br />
	<br />
	<hr />
	<div class="row">
		<div class="col">
			<div id="quiryStart">
				<h5><strong>상품문의</strong></h5>
			</div>
		</div>
	</div>
	<hr />
	<div class="row">
		<div id="quiryResultList"></div>
		<div id="quiryResultPagingNo"></div>
	</div>
	<div class="row">
		<div class="col col-lg-4"></div>
		<div class="col">
			<button id="productInquiryEnterBtn" class="btn btn-danger">문의하기</button>
		</div>
		<div class="col col-lg-4"></div>
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

<!-- 모달창-로그인/기타 경고 -->
<div id="selfRv_warn_modal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
		<p>자신이 작성한 후기는 추천/비추천이 불가합니다.</p>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달창-상품리뷰 -->
<div id="productReviewForm" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      <span>
      	<span class="font_rvModal_header">${productDetail.getPdName()}</span><span class="font-custom">에 대한 상품리뷰 작성하기</span>
      </span>
      </div>
      <div class="modal-body container">
      <form action="">
		<input type="hidden" value="${productDetail.getPdId()}" name="pdId"/>
		<!-- =======작성자======= -->
		<div class="row">
			<div class="col col-lg-3">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="rv_memId">작성자</label>
			    	</div>
		    	</div>
		    </div>
		    <div class="col col-lg-5">
		    	<input type="text" id="rv_memId" class="form-control" name="memId" value="${member.getMemId()}${seller.getSelId()}" readonly="readonly">
		    </div>
		</div>
		<!-- =======내용======= --> <br />
		<div class="row">
			<div class="col col-lg-3">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="rv_content">내용</label>
			    	</div>
		    	</div>
		    </div>
		    <div id="rv_content_div" class="col col-lg-5">
		    	<textarea id="rv_content" class="form-control" name="rvContent"></textarea>
		    </div>
		</div>
		<!-- 경고 -->
		<div class="row justify-content-center">
			<div class="col col-lg-5"></div>
	    	<div class="col">
	    		<div id="rvmodal_alert_msg"></div>
	    	</div>
	    	<div class="col col-lg-2"></div>
	    </div>
      </form>
      </div>
      <div class="modal-footer">
      	<button type="button" id="rvModal_register_btn" class="btn btn-primary">후기등록</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>



<!-- 모달창-상품문의 -->
<div id="productInquiryForm" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      <span>
      	<span class="font_iqModal_header">${productDetail.getPdName()}</span><span class="font-custom">에 대한 상품문의 작성하기</span>
      </span>
      </div>
      <div class="modal-body container">
      <form action="">
		<input type="hidden" value="${productDetail.getPdId()}" name="pdId"/>
		<!-- =======작성자======= -->
		<div class="row">
			<div class="col col-lg-3">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiry_memId">작성자</label>
			    	</div>
		    	</div>
		    </div>
		    <div class="col col-lg-5">
		    	<input type="text" id="inquiry_memId" class="form-control" name="memId" value="${member.getMemId()}${seller.getSelId()}" readonly="readonly">
		    </div>
		</div>
		<!-- =======제목======= --> <br />
		<div class="row">
			<div class="col col-lg-3">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiry_title">제목</label>
			    	</div>
		    	</div>
		    </div>
		    <div class="col col-lg-5">
		    	<input type="text" id="inquiry_title" class="form-control" name="iqTitle">
		    </div>
		</div>
		<!-- =======내용======= --> <br />
		<div class="row">
			<div class="col col-lg-3">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiry_content">내용</label>
			    	</div>
		    	</div>
		    </div>
		    <div id="inquiry_content_div" class="col col-lg-5">
		    	<textarea id="inquiry_content" class="form-control" name="iqContent"></textarea>
		    </div>
		</div>
		<!-- 경고 -->
		<div class="row justify-content-center">
			<div class="col col-lg-5"></div>
	    	<div class="col">
	    		<div id="iqmodal_alert_msg"></div>
	    	</div>
	    	<div class="col col-lg-2"></div>
	    </div>
		<!-- =======비밀글여부======= --> <br />
		<div class="row justify-content-center">
			<div class="col col-lg-5"></div>
	    	<div class="col">
	    		<input class="form-check-input" id="secretCheck" type="checkbox" name="iqSecretState" value=1>
	    		<label for="secretCheck" class="form-check-label font-custom">비밀글입니다.</label>
	    	</div>
	    	<div class="col col-lg-2"></div>
		</div>
      </form>
      </div>
      <div class="modal-footer">
      	<button type="button" id="iqModal_register_btn" class="btn btn-primary">문의등록</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<!-- 모달창-상품문의답글 -->
<div id="productInquiryAnswerForm" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body container">
      <!-- =======문의내용======= -->
		<div class="row">
			<div class="col col-lg-2">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiryAnsInq_content">문의내용</label>
			    	</div>
		    	</div>
		    </div>
		    <div id="inquiry_content_div" class="col col-lg-10">
		    	<textarea id="inquiryAnsInq_content" class="form-control" readonly="readonly"></textarea>
		    </div>
		</div>
		<!-- =======답글내용======= -->
		<div class="row">
			<div class="col col-lg-2">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiryAnswer_content">문의답글</label>
			    	</div>
		    	</div>
		    </div>
		    <div id="inquiry_content_div" class="col col-lg-10">
		    	<textarea id="inquiryAnswer_content" class="form-control" readonly="readonly"></textarea>
		    </div>
		</div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
// 현재 세션값 - 각각 일반회원/판매자회원
let memSession = $('#currMemSession').text();
let selSession = $('#currSelSession').text();

let currentSession; // 현재세션값
if(memSession.length != 0){currentSession = memSession}else{currentSession = selSession}
// 현재PdId값
let pdId = $("#justForPdId").text();
// 현재 pd가격
let pdPrice = Number($("#pdPrice").text());
//할인율
let pdSale = Number($("#pdSale").text());
//1개당 할인가(할인율을적용한 가격)
let totalPricePerOne = pdPrice * ((100-pdSale)/100);
//1개당 할인가(할인되어 빠진 가격)
let totalSalePerOne = pdPrice * (pdSale/100);

// 브랜드명/상품명
let show_brdName = $('#show_brdName').text();
let show_pdName = $('#show_pdName').text();

//파비콘 문구(페이지명)
document.title = show_brdName+show_pdName;

//초기 가격/할인공제가
$("#salePrice").text(totalSalePerOne.toLocaleString('ko-KR'));
$("#totalPrice").text(totalPricePerOne.toLocaleString('ko-KR'));

// 할인가or정가 표시
$(document).ready(()=>{
	let pdPriceString = '';
	if(pdSale === 0){
		//할인안함 - 정가만 표시
		pdPriceString += '<span id="show_noSale_price">'+pdPrice.toLocaleString('ko-KR')+'원</span>';
		$('#show_pdPrice').html(pdPriceString);
		}else{
		//할인하는경우 - 정가 / 할인율 / 할인적용가 표시
		pdPriceString += '<span id="show_pdSale">'+pdSale+'%</span><span id="show_pdTotalPrice">'+((pdPrice)*(100-pdSale)/100).toLocaleString('ko-KR')+'원</span></br><span id="show_pdOriginPrice">'+pdPrice.toLocaleString('ko-KR')+'원</span>';
		$('#show_pdPrice').html(pdPriceString);
	}
});

//상품 네비게이션 바 이동
$("#prod_detail_explains").click(()=>{
	let scrollPosition = $("#show_brdName").offset().top;
	window.scrollTo(0, scrollPosition);
});
$("#prod_detail_info").click(()=>{
	let scrollPosition = $("#show_prodDetailInfos").offset().top;
	window.scrollTo(0, scrollPosition);
});
$("#prod_reviews").click(()=>{
	let scrollPosition = $("#reivewStart").offset().top;
	window.scrollTo(0, scrollPosition);
});
$("#prod_inquirys").click(()=>{
	let scrollPosition = $("#quiryStart").offset().top;
	window.scrollTo(0, scrollPosition);
});

//찜 관련 변수들
let favorList = $("#favorList").text().split("/"); // 구분자로 나누어 배열로 pdId를 저장
let favorDetected = false; //찜목록에 없다면 false

//추천/비추천관련
let irrBnoString = $("#irrBnoString").text().split("/");
let irrGoodString = $("#irrGoodString").text().split("/");
let irrBadString = $("#irrBadString").text().split("/");


/* 장바구니 구현 */
// 수량증감용 변수
let quantityVal = 1;

//총가격
let computeTotal = totalPricePerOne * quantityVal;
//총할인공제가
let computeSaleTotal = totalSalePerOne * quantityVal;

$("#cartQuantityPlus").click(function(){
	quantityVal += 1;
	computeTotal = totalPricePerOne * quantityVal;
	computeSaleTotal = totalSalePerOne * quantityVal;
	$("#totalPrice").text(computeTotal.toLocaleString('ko-KR'));
	$("#pdQuantity").text(quantityVal);
	$("#salePrice").text(computeSaleTotal.toLocaleString('ko-KR'));
});
$("#cartQuantityMinus").click(function(){
	if(quantityVal===1){return false;}  // 수량이1이면 더이상 감소X
	quantityVal -= 1;
	computeTotal = totalPricePerOne * quantityVal;
	computeSaleTotal = totalSalePerOne * quantityVal;
	$("#totalPrice").text(computeTotal.toLocaleString('ko-KR'));
	$("#pdQuantity").text(quantityVal);
	$("#salePrice").text(computeSaleTotal.toLocaleString('ko-KR'));
});


// 장바구니 버튼 클릭
$("#addCartBtn").click(function(){
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	let productQuantity = $("#pdQuantity").text();
	$.ajax({
		type : "post",
		url : "/cart/addCart",
		data : {
			currentSession : currentSession,
			pdId : pdId,
			productQuantity : productQuantity
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



/* 찜하기 구현 */
// 리스트 반복문 돌려서 pdId 감지

if(favorList.includes(pdId)){
	$("#favor_heart_btn").html('<svg xmlns="http://www.w3.org/2000/svg" width="37" height="37" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>');
	favorDetected = true;
}



$("#favor_heart_btn").click(function(){
	//로그인 안했을시 모달창 띄우기
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	if(favorDetected){
		//찜목록에 있는경우에 클릭했을경우 -> delete + 하트바꾸기
		$.ajax({
			type : "post",
			url : "/goods/deleteFavors",
			data : {
				currentSession : currentSession,
				pdId : pdId
			},
			success : function(){
				$("#favor_heart_btn").html('<svg xmlns="http://www.w3.org/2000/svg" width="37" height="37" fill="red" class="bi bi-heart" viewBox="0 0 16 16"><path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg>');
				favorDetected = false;
			}// success 종료
		}); // ajax 종료
	}else{
		//찜목록에 없는경우에 클릭했을경우 -> insert + 하트바꾸기
		$.ajax({
			type : "post",
			url : "/goods/addFavors",
			data : {
				currentSession : currentSession,
				pdId : pdId
			},
			success : function(){
				$("#favor_heart_btn").html('<svg xmlns="http://www.w3.org/2000/svg" width="37" height="37" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>');
				favorDetected = true;
			}// success 종료
		}); // ajax 종료	
	}
});


/*#############
 상품후기 관련 
 #############*/
//초기값은 1
var sortType=1;
// 초기 리스트
$(document).ready(reviewList(1,1));

//상품후기 버튼 활성화 여부 검증 (해당상품 구매여부+후기작성기록 여부)
$(document).ready(function(){
	$.ajax({
		type : "post",
		url : "/goods/rvBtnValidationChk",
		data : {
			memId : currentSession,
			pdId : pdId
		},
		success : function(result){
			let rst = result;
			if(rst === "btnON"){
				$("#productReviewEnterBtn").prop("disabled", false);
			}else{
				$("#productReviewEnterBtn").prop("disabled", true);
			}
		}// success 종료
	}); // ajax 종료	
});

//상품후기 버튼 클릭
$("#productReviewEnterBtn").click(function(){
	$("#productReviewForm").modal("show"); //모달 띄우기
});

//상품후기- 모달 등록버튼
$("#rvModal_register_btn").click(function(){
	if($("#rv_content").val().length==0){$("#rvmodal_alert_msg").html("<p style='color:red'>내용을 입력해주세요.</p>");return false;}
	$("#rvmodal_alert_msg").css('display','none');
	let rvmemId = currentSession; // 작성자 - 세션에서 얻어오기
	let rvpdId = pdId; // 상품ID
	let rvContent = $('#rv_content').val(); //내용
	$.ajax({
		type : "post",
		url : "/goods/reviewRegist",
		data : {
			rvmemId : rvmemId,
			rvpdId : rvpdId,
			rvContent : rvContent
		},
		success : function(result){
			if(result === "success"){
				//성공
				alert("리뷰가 성공적으로 등록되었습니다.");
				$('#productReviewForm').modal("hide");  //모달 숨기기
				$("#productReviewEnterBtn").prop("disabled", true); //등록버튼 무력화
				reviewList(1,1); //다시 리스트 불러오기
			}else{
				//실패
				alert("후기등록에 실패하였습니다.");
			}
			
		}// success 종료
	}); // ajax 종료	
});


//추천/비추천 호출함수  situation:추천에서 비추인지, 비추에서 추천인지 등 판단
function goodBadUpdate(bno,good,bad,situation){
	$.ajax({
		type : "post",
		url : "/goods/goodBtnPressed",
		data : {
			bno : bno,
			currentSession : currentSession,
			good : good,
			bad : bad,
			situation : situation
		},
		success : function(result){
			
			let irrBnoStringSession = result.irrBnoString;
			let irrGoodStringSession = result.irrGoodString;
			let irrBadStringSession = result.irrBadString;
			
			/* AJAX로 세션 생성이후 JS로 바로 세션값을 가져올 수 없으므로 태그만들고 다시 가져올라했는데 않됨 => Map으로 반환받는 것으로 해결 */
// 			$("#sessionUpdate").html('<span id="irrBnoStringUpd">${irrBnoString}</span><span id="irrGoodStringUpd">${irrGoodString}</span><span id="irrBadStringUpd">${irrBadString}</span>');
// 			irrBnoString = $("#irrBnoStringUpd").text().split("/");
// 			irrGoodString = $("#irrGoodStringUpd").text().split("/");
// 			irrBadString = $("#irrBadStringUpd").text().split("/");

			irrBnoString = irrBnoStringSession.split("/");
			irrGoodString = irrGoodStringSession.split("/");
			irrBadString = irrBadStringSession.split("/");

// 			console.log("irrGoodString    "+irrGoodString);
			//세션값 업데이트
		}// success 종료
	}); // ajax 종료	
}

//추천비추천
$(document).on('click', '.goodBtn', function(){
// 	alert($(this).val());
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	let bno = $(this).val();
	if($("input[name=rvMemButton"+bno+"]").val() === currentSession){$("#selfRv_warn_modal").modal("show");return false;}
	if($(this).children('svg').attr('class') == "bi bi-hand-thumbs-up"){
		//추천이 안되있을 경우
		$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="green" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16"><path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/></svg>');
		if($("button[name=badButton"+bno+"]").children('svg').attr('class') == "bi bi-hand-thumbs-down-fill"){
			// 이미비추가 되어있는 경우
			$("button[name=badButton"+bno+"]").html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16"><path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z"/></svg>');	
			goodBadUpdate(bno,1,0,"badToGood");
		}else{
			//비추도 아닌 경우
			goodBadUpdate(bno,1,0,"nothingToGood");
		}
	}else{
		//추천이 이미 되어있는 경우
		$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="green" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16"><path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/></svg>');
		goodBadUpdate(bno,0,0,"goodToNothing");
	}
});
$(document).on('click', '.badBtn', function(){
// 	alert($(this).val());
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	let bno = $(this).val();
	if($("input[name=rvMemButton"+bno+"]").val() === currentSession){$("#selfRv_warn_modal").modal("show");return false;}
	if($(this).children('svg').attr('class') == "bi bi-hand-thumbs-down"){
		//비추천이 안되있을 경우
		$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16"><path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/></svg>');
		if($("button[name=goodButton"+bno+"]").children('svg').attr('class') == "bi bi-hand-thumbs-up-fill"){
			//이미 추천되어있는경우
			$("button[name=goodButton"+bno+"]").html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="green" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16"><path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/></svg>');
			goodBadUpdate(bno,0,1,"goodToBad");
		}else{
			//아무것도 없는 경우
			goodBadUpdate(bno,0,1,"nothingToBad");
		}
	}else{
		//비추천이 이미 되어있는 경우
		$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16"><path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z"/></svg>');
		goodBadUpdate(bno,0,0,"badToNothing");
	}
});





// 페이징
function reviewList(pageNo, sortNo) {
	
	$.ajax({
		url : "reviewPageInitInfos",
		type : 'GET',
		data : {
			showPage : pageNo,
			sort : sortNo,
			"pdId" : pdId
		},
		success : function(data) {
			var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var rvPageList = data.rvPageList;
            
            if(pageInfo.totalRecordCount!=0){
            
	            var rstContentTag = '<div class="container">';
	            var rstPagingTag = "";
	
				$.each(rvPageList, function(key, value) {
					rstContentTag += '<hr/>';
					rstContentTag += '<div class="row">';
	                rstContentTag += "<div class='col col-lg-1'>";
		                rstContentTag += "<input type='hidden' value="+value.rvmemId+" name='rvMemButton"+value.rvNo+"'>"; //값 전달용
		                rstContentTag += "<p>"+value.rvmemId.substring(0,3)+"***</p>";
	                rstContentTag += "</div>";
	                rstContentTag += "<div class='col'>";
		                rstContentTag += "<p>"+value.rvContent+"</p>";
		                rstContentTag += "<div class='rv_img_div'>"
		                	rstContentTag += '<img src="/resources/pdimages/rV_default.jpg" alt="" />'; //임시이미지로 통일
		                rstContentTag += "</div>"
		                rstContentTag += "<p class='small_font'>"+value.rvRegiDate.substring(0,10)+"</p>";
	                rstContentTag += "</div>";
	                // 추천/비추천이력찾기
	                rstContentTag += "<div class='col col-lg-2 text-end'>";
	                rstContentTag += "</br></br></br>";
	                rstContentTag += "<div class='rvListBtn_wrapper'>";
	                if(irrBnoString.includes(String(value.rvNo))){   //rvNO는 number이고 irrBnoString배열의 원소들은 String이므로 String()함수로 형변환
	                	//추천 있는지 찾기
	                	let pointer = irrBnoString.indexOf(String(value.rvNo));  //인덱스로 찾기 ( 컨트롤러에서 리스트 가져올때 순서가 bno와 good/bad가 같으므로)
	                	if(irrGoodString[pointer] == 1){
	                		//좋아요가 1이라는 뜻
	                		rstContentTag += '<button type="button" class="goodBtn" name="goodButton'+value.rvNo+'" value="'+value.rvNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="green" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16"><path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/></svg></button>';
	                		rstContentTag += '<button type="button" class="badBtn" name="badButton'+value.rvNo+'" value="'+value.rvNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16"><path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z"/></svg></button>';
	                	}
	                	if(irrBadString[pointer] ==1){
	                		//비추천이 1이라는 뜻
	                		rstContentTag += '<button type="button" class="goodBtn" name="goodButton'+value.rvNo+'" value="'+value.rvNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="green" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16"><path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/></svg></button>';
		                	rstContentTag += '<button type="button" class="badBtn" name="badButton'+value.rvNo+'" value="'+value.rvNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16"><path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/></svg></button>';
	                	}
	                	if(irrGoodString[pointer] == 0 && irrBadString[pointer] == 0){
	                		//데이터만 존재하고 둘다 0(사실상 밑과 동일)
	                		rstContentTag += '<button type="button" class="goodBtn" name="goodButton'+value.rvNo+'" value="'+value.rvNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="green" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16"><path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/></svg></button>';
			                rstContentTag += '<button type="button" class="badBtn" name="badButton'+value.rvNo+'" value="'+value.rvNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16"><path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z"/></svg></button>';
	                	}
	                }else{
	                	//추천/비추천 이력 없음
	                	rstContentTag += '<button type="button" class="goodBtn" name="goodButton'+value.rvNo+'" value="'+value.rvNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="green" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16"><path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/></svg></button>';
	                	rstContentTag += '<button type="button" class="badBtn" name="badButton'+value.rvNo+'" value="'+value.rvNo+'"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16"><path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z"/></svg></button>';
	                }
	                rstContentTag += "</div>";
	                rstContentTag += "</div>";
	                rstContentTag += "</div>";             
	             });
				rstContentTag += "</div>";
				
				$("#reviewResultList").html(rstContentTag); //메인 컨텐츠 적용
				
				//페이징
				rstPagingTag += '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
				if(pageInfo.xprev){
					rstPagingTag+="<li class='page-item'><a href='#' class='page-link' aria-label='Previous' onclick='reviewList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +");return false;'><span aria-hidden='true'>&laquo;</span></a></li>";
				}
				for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
					if(i == currPage){
						rstPagingTag += '<li class="page-item"><a class="page-link active" href="#">'+i+'</a></li>';
					}else{
						rstPagingTag += '<li class="page-item"><a class="page-link" href="#" onclick="reviewList(' + i + ', ' + sortType + ');return false;" >'+i+'</a></li>';
					}	
				}
				if(pageInfo.xnext){
					rstPagingTag+="<li class='page-item'><a href='#' class='page-link' aria-label='Previous' onclick='reviewList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +");return false;'><span aria-hidden='true'>&raquo;</span></a></li>";
					
				}
				rstPagingTag +='</ul></nav>';
				$("#reviewResultPagingNo").html(rstPagingTag); //페이징 적용
			
            }else{
            	// 관련 상품리뷰가 없는 경우
            	var rstContentTag = "<h3>상품리뷰가 없습니다.</h3>";
            	$("#reviewResultList").html(rstContentTag);
            }
			
	     }, //success end
		error : function() {
			alert("error");
		}
	}); // ajax end
}// function end

// 정렬을 결정하는 함수임
function sortList(inputsort){
	sortType = inputsort;
	reviewList(1, sortType);
}

// 정렬 A태그 디자인 관련
$("#sortBtn1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn2").css('font-weight', 'normal');
});
$("#sortBtn2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
});


/*#############
상품문의 관련 
#############*/

// 상품문의는 별도의 정렬X 카테고리X

$(document).ready(quiryList(1));

function quiryList(pageNo) {
	
	$.ajax({
		url : "quiryPageInitInfos",
		type : 'GET',
		data : {
			showPage : pageNo,
			"pdId" : pdId
		},
		success : function(data) {
			var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var qrPageList = data.qrPageList;
            
            if(pageInfo.totalRecordCount!=0){
            
	            var qrContentTag = "<table class='table'><tr><th>작성자</th><th>제목</th><th>작성일</th><th>답변상태</th></tr>";
	            var qrPagingTag = "";
	
				$.each(qrPageList, function(key, value) {
	                qrContentTag += "<tr>";;
	                qrContentTag += "<td>"+value.iqmemId.substring(0,3)+"***"+"</td>";
	                if(value.iqPrivate == 1){
	                	if(currentSession == value.iqmemId){
	                		// 비밀글 + 본인이 작성한 글
	                		if(value.iqState == 1){
	                			qrContentTag += "<td style='color:#9c5b16'><a href='#' onclick='showIqAnswer("+value.iqNo+");return false;'>[비밀]"+value.iqTitle+"</a></td>"; // 비밀글 + 본인이 작성한 글 + 답변달림
	                		}else{
	                			qrContentTag += "<td style='color:#9c5b16'>[비밀]"+value.iqTitle+"</td>"; // 비밀글 + 본인이 작성한 글 + 답변안달림
	                		}
	                	}else{
	                		//비밀글 + 타인이 작성한 글 - 내용보여줄 필요X
	                		qrContentTag += "<td style='color:#B28989'>비밀글입니다.</td>";
	                	}
	                }else{
	                	// 비밀글아님 - 전체공개
	                	if(value.iqState == 1){
	                		qrContentTag += "<td><a href='#' onclick='showIqAnswer("+value.iqNo+");return false;'>"+value.iqTitle+"</a></td>"; // 비밀글아님 - 전체공개 + 답변달림
	                	}else{
	                		qrContentTag += "<td>"+value.iqTitle+"</td>"; // 비밀글아님 - 전체공개 + 답변안달림
	                	}
	                }
	                qrContentTag += "<td>"+value.iqRegiDate.substring(0,10)+"</td>";
	                if(value.iqState == 1){qrContentTag += "<td style='color:#398C02'>답변완료</td>";}else{qrContentTag += "<td>처리대기중</td>";}
	                qrContentTag += "</tr>";
	             });
				qrContentTag += "</table>";
				$("#quiryResultList").html(qrContentTag); //메인 컨텐츠 적용
				
				//페이징
				qrPagingTag += '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
				if(pageInfo.xprev){
					qrPagingTag+="<li class='page-item'><a href='#' class='page-link' aria-label='Previous' onclick='quiryList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'><span aria-hidden='true'>&laquo;</span></a></li>";
				}
				for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
					if(i == currPage){
						qrPagingTag += '<li class="page-item"><a class="page-link active" href="#">'+i+'</a></li>';
					}else{
						qrPagingTag += '<li class="page-item"><a class="page-link" href="#" onclick="quiryList(' + i + ');return false;" >'+i+'</a></li>';
					}
				}
				if(pageInfo.xnext){
					qrPagingTag+="<li class='page-item'><a href='#' class='page-link' aria-label='Previous' onclick='quiryList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'><span aria-hidden='true'>&raquo;</span></a></li>";
				}
				qrPagingTag +='</ul></nav>';
				$("#quiryResultPagingNo").html(qrPagingTag); //페이징 적용
				
            }else{
            	// 관련 상품리뷰가 없는 경우
            	var qrContentTag = "<h3>상품문의가 없습니다.</h3>";
            	$("#quiryResultList").html(qrContentTag);
            }
	     }, //success end
		error : function() {
			alert("error");
		}
	}); // ajax end
}// function end


/////////////////////////
/* 상품문의등록 */
//상품문의버튼 클릭
$("#productInquiryEnterBtn").click(function(){
	if(memSession.length === 0 && selSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	$('#productInquiryForm').modal("show");
});

//모달창에서 로그인 버튼
$("#warn_modal_login").click(function(){
	location.href = "/member/login";
});

//상품문의 모달 등록버튼 클릭
$("#iqModal_register_btn").click(function(){
	if($("#inquiry_title").val().length==0){$("#iqmodal_alert_msg").html("<p style='color:red'>제목과 내용을 입력해주세요.</p>");return false;}
	if($("#inquiry_content").val().length==0){$("#iqmodal_alert_msg").html("<p style='color:red'>제목과 내용을 입력해주세요.</p>");return false;}
	$("#iqmodal_alert_msg").css('display','none');
	let iqmemId; // 작성자 - 세션에서 얻어오기
	if(memSession.length != 0){iqmemId = memSession}else{iqmemId = selSession}
	let iqpdId = pdId; // 상품ID
	let iqTitle = $('#inquiry_title').val(); //제목
	let iqContent = $('#inquiry_content').val(); //내용
	let iqPrivate; //비밀글여부 체크시 1
	if($('#secretCheck').is(':checked')){iqPrivate=1;}else{iqPrivate=0;}
	$.ajax({
		type : "post",
		url : "/goods/quiryRegist",
		data : {
			iqmemId : iqmemId,
			iqpdId : iqpdId,
			iqTitle : iqTitle,
			iqContent : iqContent,
			iqPrivate : iqPrivate
		},
		success : function(result){
			if(result === "success"){
				//성공
				alert("문의가 성공적으로 등록되었습니다.");
				$('#productInquiryForm').modal("hide");  //모달 숨기기
				$("#inquiry_title").val('');  //모달 비우기
				$("#inquiry_content").val('');  //모달 비우기
				$("#secretCheck").prop("checked", false);  //모달 비우기
				quiryList(1); //다시 리스트 불러오기
			}else{
				//실패
				alert("문의등록에 실패하였습니다.");
			}
			
		}// success 종료
	}); // ajax 종료	
});

//문의 제목누르면 답글이랑 내용띄워줌
function showIqAnswer(iqNo){
	$.ajax({
		type : "post",
		url : "/goods/quiryAnswerShow",
		data : {
			iqNo : iqNo
		},
		success : function(result){
			let answer = result.answer;
			let quiry = result.quiry;
			$("#inquiryAnswer_content").text(answer.iaContents);
			$("#inquiryAnsInq_content").text(quiry.iqContent);
			$("#productInquiryAnswerForm").modal("show");
		}// success 종료
	}); // ajax 종료	
}


</script>
</html>