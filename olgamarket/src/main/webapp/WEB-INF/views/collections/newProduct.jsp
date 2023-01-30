<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Olga-신상품페이지</title>
</head>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
/* 정보전달용 */
#currMemSession,#currSelSession{
	display:none;
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
/* 볼드체 만들기 */
.font_bold{
	font-weight: bold;
}
.font_bigger{
	font-size: 1.2em;
}
/* 아코디언 기능 패딩 줄이기 */
.accordion-body,.accordion-button{
	padding : 5px;
}
/* padding없애기 */
.delete_padding{
	padding: 0;
}
/* hr태그 마진 조정*/
hr{
	margin-top: 6px;
	margin-bottom : 6px;
}
/* 필터 */
.filterMenu {
  position: sticky;
  top: 100px;
}
/* 가격필터 폰트 */
.priceListFont{
	font-size: small;
}
/* 버튼 장식 제거 */
.btnCateList,.btnBrandList,.btnPriceList,#filter_reload,#modal_cartQuantityPlus,#modal_cartQuantityMinus{
	background: white;
	border-style: none;
}
/* 필터 p태그 조정 */
.filter_margin_font{
	margin-bottom: 5px;
	font-weight: bold;
}
/* 정렬버튼 */
#sortBtn1,#sortBtn2,#sortBtn3,#sortBtn4{
	text-decoration: none;
}
#sortBtn1{
	font-weight: bold;
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
/* 상품리스트 규격 */
.pdList{
	width:100%;
}
/* 할인율 */
.pdSale_sale{
	font-weight:bold;
	color:#fc5603;
}
/* 할인시 할인율 적용가 */
.pdSale_totalPrice{
	font-weight:bold;
}
/* 할인시 정가에 취소선 */
.pdSale_originPrice{
	font-weight:bold;
	color:grey;
	text-decoration: line-through;
}
/* No할인상품 정가 */
.pdPrice{
	font-weight: bold;
}
/* a태그 장식제거 */
a{
	text-decoration: none;
	color:black;
}

.col{
/* 	border: 1px solid red; */
}

</style>
<body>
<!-- 현재 세션 아이디 넘기기-->
<span id="currMemSession">${member.getMemId()}</span><span id="currSelSession">${seller.getSelId()}</span>


	<div class="container text-center">
		<div class="row">
			<div class="col col-lg-4"></div>
			<div class="col">
				<h3><strong>신상품</strong></h3>
			</div>
			<div class="col col-lg-4"></div>
		</div>
		<br />
		<div class="row">
			<div class="col col-lg-7"></div>
			<div class="col">
				<a href="#" onclick="sortList(1);return false;" id="sortBtn1">등록순</a>&nbsp;<span>|</span>
				<a href="#" onclick="sortList(2);return false;" id="sortBtn2">판매량순</a>&nbsp;<span>|</span>
				<a href="#" onclick="sortList(3);return false;" id="sortBtn3">낮은가격순</a>&nbsp;<span>|</span>
				<a href="#" onclick="sortList(4);return false;" id="sortBtn4">높은가격순</a>
			</div>
			<div class="col col-lg-1"></div>
		</div>
	</div>
	<br />
	<!-- 필터 + 메인페이지 -->
	<div class="container">
		<div class="row">
			<div class="col col-lg-3">
				<div class="filterMenu">
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col col-lg-3">
									<span class="filter_margin_font">필터</span>
								</div>
								<div class="col col-lg-6"></div>
								<div class="col col-lg-3 delete_padding">
									<button id="filter_reload" onclick="filter_reload()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/><path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/></svg><strong>초기화</strong></button>
								</div>
							</div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col">
							<div class="accordion　bg-white">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingOne">
							      <button id="accor_cate" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							        <p class="filter_margin_font">카테고리</p>&nbsp;&nbsp;<svg id="filter_collapse_btn_cate" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-up" viewBox="0 0 16 16"><path d="M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"/></svg>
							      </button>
							    </h2>
							    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
									<div id="newPdCateList"></div>
							      </div>
							    </div>
							  </div>
							</div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col">
							<div class="accordion　bg-white">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingTwo">
							      <button id="accor_brand" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
							        <p class="filter_margin_font">브랜드</p>&nbsp;&nbsp;&nbsp;&nbsp;<svg id="filter_collapse_btn_brd" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-up" viewBox="0 0 16 16"><path d="M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"/></svg>
							      </button>
							    </h2>
							    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
									<div id="newPdBrandList"></div>
							      </div>
							    </div>
							  </div>
							</div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col">
							<div class="accordion　bg-white">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingThree">
							      <button id="accor_price" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
							        <p class="filter_margin_font">가격</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<svg id="filter_collapse_btn_prc" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-up" viewBox="0 0 16 16"><path d="M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"/></svg>
							      </button>
							    </h2>
							    <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
									<div id="newPdPriceList"></div>
							      </div>
							    </div>
							  </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 메인페이지 -->
			<div class="col col-lg-9">
				<div id="newPdResultList" class="pdList container"></div>
				<div id="newPdResultPagingNo" class="container"></div>
			</div>
		</div>
	</div>
	
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

var sortType=1;  //정렬 기본값

var cateLength; // 카테고리 - 배열길이 전역변수
var finalCateList=[];  // 카테고리 - 컨트롤러로 전달되는 최종배열
var cateBtnList = {}; // 카테고리 - 동적변수가 담기는 배열

var brandLength; // 브랜드 - 배열길이 전역변수
var finalBrandList=[];  // 브랜드 - 컨트롤러로 전달되는 최종배열
var brandBtnList = {}; // 브랜드 - 동적변수가 담기는 배열

var priceLength; // 가격 - 배열길이 전역변수
var finalpriceList=[];  // 가격 - 컨트롤러로 전달되는 최종배열
var priceBtnList = {}; // 가격 - 동적변수가 담기는 배열

/* 세션관련변수 */
let memSession = $('#currMemSession').text();
let selSession = $('#currSelSession').text();
let currentSession; // 현재세션값
if(memSession.length != 0){currentSession = memSession}else{currentSession = selSession}

$(document).ready(newPdList(1,1,finalCateList,finalBrandList,finalpriceList));
//초기 브랜드 리스트
$(document).ready(function(){
	$.ajax({
        url : "/collections/newProductCate",
        type : "get",
        success : function(data){
        	/* =========== 카테고리 만들기 시작 ===========*/
        	var cateList = data.cateList;  //카테고리 리스트
			var newPdcateList = "";  //태그에 적용할 문자열 만들기
			cateLength = cateList.length;
			$.each(cateList, function(key, value) {
				newPdcateList += '<button type="button" id="CateButton'+key+'" name="CateButton'+key+'" value="'+value+'" class="btnCateList"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg></button>';
				newPdcateList += '<label for="CateButton'+key+'">'+value+'</label>';
				newPdcateList += '</br>';
			});
			$("#newPdCateList").html(newPdcateList); //메인 컨텐츠 적용
			
			// 카테고리 버튼 동적변수 생성
			for (var i = 0; i < cateLength; i++){ 
				cateBtnList[`btnToggle`+i] = true;
			}
			
			//
			for(let i =0 ; i< cateLength ;i++){
				// 동적 함수 생성
				$(function(){
					cateBtnList[`btnToggle`+i] = true;
				    $("button[name=CateButton"+i+"]").on('click',function(){
				    	if(cateBtnList[`btnToggle`+i]){
				    		cateBtnList[`btnToggle`+i]=false;
							$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle-fill" viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/></svg>');
				    		var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
				    		finalCateList.push(kind);
				    		newPdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
				    	}else{
				    		cateBtnList[`btnToggle`+i]=true;
							$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg>');
				    		var kind = $(this).val();
				    		for(let j = 0; j < finalCateList.length; j++) {
				    			  if(finalCateList[j] === kind)  {
				    				  finalCateList.splice(j, 1);
				    			    j--;
				    			  }
				    		}
				    		newPdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
							
				    	}
				    });//button click
				    
				}); 
			}// for문 종료
			/* =========== 카테고리 끝 ===========*/
			/* =========== 브랜드 시작 ===========*/
			var brandList = data.brandList;  //카테고리 리스트
			var newPdBrandList = "";  //태그에 적용할 문자열 만들기
			brandLength = brandList.length;
			$.each(brandList, function(key, value) {
				newPdBrandList += '<button type="button" id="BrandButton'+key+'" name="BrandButton'+key+'" value="'+value+'" class="btnBrandList"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg></button>';
				newPdBrandList += '<label for="BrandButton'+key+'">'+value+'</label>';
				newPdBrandList += '</br>';
             });
			$("#newPdBrandList").html(newPdBrandList); //메인 컨텐츠 적용
			
			// 카테고리 버튼 동적변수 생성
			for (var i = 0; i < brandLength; i++){ 
				brandBtnList[`brBtnToggle`+i] = true;
			}
			
			//
			for(let i =0 ; i< brandLength ;i++){
				// 동적 함수 생성
				$(function(){
					brandBtnList[`brBtnToggle`+i] = true;
				    $("button[name=BrandButton"+i+"]").on('click',function(){
				    	if(brandBtnList[`brBtnToggle`+i]){
				    		brandBtnList[`brBtnToggle`+i]=false;
				    		$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle-fill" viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/></svg>');
				    		var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
				    		finalBrandList.push(kind);
				    		newPdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
				    	}else{
				    		brandBtnList[`brBtnToggle`+i]=true;
				    		$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg>');
				    		var kind = $(this).val();
				    		for(let j = 0; j < finalBrandList.length; j++) {
				    			  if(finalBrandList[j] === kind)  {
				    				  finalBrandList.splice(j, 1);
				    			    j--;
				    			  }
				    		}
				    		newPdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
							
				    	}
				    });//button click
				    
				}); 
			}// for문 종료
			/* =========== 브랜드 끝 ===========*/
			/* =========== 가격 만들기 시작 ===========*/
			priceLength = 3; // 가격 구간이 3개이므로 3고정
 			var newPdpriceList = "";  //태그에 적용할 문자열 만들기
 			//10000이하
 			newPdpriceList += '<button type="button" id="PriceButton0" name="PriceButton0" value="1" class="btnPriceList"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg></button>';
 			newPdpriceList += '<label for="PriceButton0" class="priceListFont">10,000원 이하</label>';
 			newPdpriceList += '</br>';
 			//10000초과~30000이하
 			newPdpriceList += '<button type="button" id="PriceButton1" name="PriceButton1" value="2" class="btnPriceList"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg></button>';
 			newPdpriceList += '<label for="PriceButton1" class="priceListFont">10,000원 초과 ~ 30,000원 이하</label>';
 			newPdpriceList += '</br>';
 			//30000이상
 			newPdpriceList += '<button type="button" id="PriceButton2" name="PriceButton2" value="3" class="btnPriceList"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg></button>';
 			newPdpriceList += '<label for="PriceButton2" class="priceListFont">30,000원 초과</label>';
 			newPdpriceList += '</br>';
		
 			$("#newPdPriceList").html(newPdpriceList); //메인 컨텐츠 적용
			
			// 카테고리 버튼 동적변수 생성
			for (var i = 0; i < priceLength; i++){ 
				priceBtnList[`pricebtnToggle`+i] = true;
			}
			
			//
			for(let i =0 ; i< priceLength ;i++){
				// 동적 함수 생성
				$(function(){
					priceBtnList[`pricebtnToggle`+i] = true;
				    $("button[name=PriceButton"+i+"]").on('click',function(){
				    	if(priceBtnList[`pricebtnToggle`+i]){
				    		priceBtnList[`pricebtnToggle`+i]=false;
				    		$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle-fill" viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/></svg>');
				    		var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
				    		finalpriceList.push(kind);
				    		newPdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
				    	}else{
				    		priceBtnList[`pricebtnToggle`+i]=true;
				    		$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fc5603" class="bi bi-check-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></svg>');
				    		var kind = $(this).val();
				    		for(let j = 0; j < finalpriceList.length; j++) {
				    			  if(finalpriceList[j] === kind)  {
				    				  finalpriceList.splice(j, 1);
				    			    j--;
				    			  }
				    		}
				    		newPdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
							
				    	}
				    });//button click
				    
				}); 
			}// for문 종료
			/* =========== 가격 끝 ===========*/
        },//success 종료
        error : function(){
             alert('error - getcateList');
        }//error 종료
    });//ajax	종료
	
});




function newPdList(pageNo,sortNo,finalCateList,finalBrandList,finalpriceList) {
	$.ajax({
        url : "/collections/newProductCate",
        type : "get",
        data : {
        	showPage : pageNo,
			sort : sortNo,
            "finalCateList":finalCateList,
            "finalBrandList":finalBrandList,
            "finalpriceList":finalpriceList
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var newPdPageList = data.ProdList;
            
            /*  ========== 카테고리 시작 ========== */
            var activeCateList = data.activeCateList; // 카테고리 - 가변카테고리명을 컨트롤러에서 받음(배열이 아니라 json객체임)
            var activeCateListUsable;  // 카테고리 - json객체를 배열로 바꿔 담을 객체 선언 
            var cateString = ""; // 카테고리 - 최종적으로 문자열로 배열만들어 적용할꺼임
            if(activeCateList !== null){
            	// json이 null(즉 아무것도 없으면) Object.values 함수가 작동하지않으므로 if문으로 null여부 검사
            	activeCateListUsable = Object.values(activeCateList);
            	cateString += '[';
                for(let k=0;k<activeCateListUsable.length;k++){
                	cateString += '"';
                	cateString += activeCateListUsable[k];
                	cateString += '"';
                	if(k != (activeCateListUsable.length-1)){
                		cateString += ',';
                	}
                }
                cateString += ']';
            }else{
            	// 비어있으면 그냥 배열
            	cateString='[]';
            }
            /*  ========== 카테고리 끝 ========== */
            /*  ========== 브랜드 시작 ========== */
            var activeBrandList = data.activeBrandList; // 브랜드 - 가변카테고리명을 컨트롤러에서 받음(배열이 아니라 json객체임)
            var activeBrandListUsable;  // 브랜드 - json객체를 배열로 바꿔 담을 객체 선언 
            var brandString = ""; // 브랜드 - 최종적으로 문자열로 배열만들어 적용할꺼임
            if(activeBrandList !== null){
            	// json이 null(즉 아무것도 없으면) Object.values 함수가 작동하지않으므로 if문으로 null여부 검사
            	activeBrandListUsable = Object.values(activeBrandList);
            	brandString += '[';
                for(let z=0;z<activeBrandListUsable.length;z++){
                	brandString += '"';
                	brandString += activeBrandListUsable[z];
                	brandString += '"';
                	if(z != (activeBrandListUsable.length-1)){
                		brandString += ',';
                	}
                }
                brandString += ']';
            }else{
            	// 비어있으면 그냥 배열
            	brandString='[]';
            }
            /*  ========== 브랜드 끝 ========== */
            /*  ========== 가격 시작 ========== */
            var activePriceList = data.activePriceList; // 가격 - 가변카테고리명을 컨트롤러에서 받음(배열이 아니라 json객체임)
            var activePriceListUsable;  // 가격 - json객체를 배열로 바꿔 담을 객체 선언 
            var priceString = ""; // 가격 - 최종적으로 문자열로 배열만들어 적용할꺼임
            if(activePriceList !== null){
            	// json이 null(즉 아무것도 없으면) Object.values 함수가 작동하지않으므로 if문으로 null여부 검사
            	activePriceListUsable = Object.values(activePriceList);
            	priceString += '[';
                for(let z=0;z<activePriceListUsable.length;z++){
                	priceString += '"';
                	priceString += activePriceListUsable[z];
                	priceString += '"';
                	if(z != (activePriceListUsable.length-1)){
                		priceString += ',';
                	}
                }
                priceString += ']';
            }else{
            	// 비어있으면 그냥 배열
            	priceString='[]';
            }
            /*  ========== 가격 끝 ========== */
        	
            var newPdContentTag = '<div class="container">';
            var newPdPagingTag = "";

			$.each(newPdPageList, function(key, value) {
				if((key % 4) === 0){newPdContentTag +='<div class="row">';}  //4열이므로
					newPdContentTag += '<div class="col"><div class="card mb-3 img_hover_paraentDiv">';
						// 상품이미지 => 임의로 넣은값, 상품레코드의 값 쓰고싶다면 수정하기
						newPdContentTag += '<a href="/goods/detailView?pdId='+value.pdId+'"><img src="/resources/pdimages/pd_default.jpg" class="card-img-top pdImg" alt="기본이미지"></a>';
						newPdContentTag += '<div class="img_absolute"><button class="img_absolute_cartBtn" value="'+value.pdId+'"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="white" class="bi bi-cart2" viewBox="0 0 16 16"><path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/></svg></button></div>';
						/* 단순 전달용 태그 - 시작 */
						newPdContentTag+= '<input type="hidden" name="pdPrice'+value.pdId+'" value="'+value.pdPrice+'">'; //증감기능에 상품가격 전달용도
						newPdContentTag+= '<input type="hidden" name="pdSale'+value.pdId+'" value="'+value.pdSale+'">'; //증감기능에 상품할인가 전달용도
						newPdContentTag+= '<input type="hidden" name="pdName'+value.pdId+'" value="'+value.pdName+'">'; //증감기능에 상품명 전달용도
						newPdContentTag+= '<input type="hidden" name="pdstlBrandName'+value.pdId+'" value="'+value.pdstlBrandName+'">'; //증감기능에 상품브랜드명 전달용도
						/* 단순 전달용 태그 - 끝 */
						newPdContentTag += '<div class="card-body">';
						newPdContentTag += '<h5 class="card-title">['+value.pdstlBrandName+']</h5>';
							newPdContentTag += "<span><a href='/goods/detailView?pdId="+value.pdId+"'>"+value.pdName+"</a></span></br>";
							if(value.pdSale>0){
								//할인하는상품=>정가/할인율/할인가 모두 표시
								newPdContentTag += "<span class='pdSale_sale'>"+value.pdSale+"%</span>&nbsp;";
								newPdContentTag += "<span class='pdSale_totalPrice'>"+((value.pdPrice)*(100-value.pdSale)/100).toLocaleString('ko-KR')+"원</span></br>";
								newPdContentTag += "<span class='pdSale_originPrice'>"+value.pdPrice.toLocaleString('ko-KR')+"원</span>";
							}else{
								//NO할인
								newPdContentTag += "<p class='pdPrice' >"+value.pdPrice.toLocaleString('ko-KR')+"원</p>";
							}
						newPdContentTag += '</div>';
					newPdContentTag += '</div></div>';  // col끝
					
					if((newPdPageList.length % 4) !== 0){  // 한 행이4개보다 적을 경우가 생긴다면 마지막에 빈 개수만큼 채워줘야함
						if(key === newPdPageList.length-1){ //마지막줄에만 적용해야하므로 ( 메인태그 다 만들고 부족한 개수만큼 추가)
							for(let k=0;k<(4-(newPdPageList.length % 4));k++){
								newPdContentTag += '<div class="col"><div>';
								newPdContentTag += '<div>';
								newPdContentTag += '</div>';
							newPdContentTag += '</div></div>';
							}
						}
					}
					
				if((key % 4) === 3){newPdContentTag +='</div>';}  //row끝           
             });
			newPdContentTag += '</div>';
			
			// 페이지 결과리스트가 비어있는가 검사 => 필터여러개 적용시 결과리스트에 상품이 하나도 없을 수 있으므로
			if(newPdPageList.length === 0){
				// 필터에 해당하는 결과가 없음
				let noResultFound = '';
				noResultFound += '</br></br></br></br>';
				noResultFound += '<div class="container text-center"><div class="row">';
				noResultFound += '<div class="col col-lg-3"></div>';
				noResultFound += '<div class="col">';
				noResultFound += '<p style="color:red">선택하신 필터에 해당하는 상품이 없습니다.</p>';
				noResultFound += '<button id="filter_reload" class="btn" onclick="filter_reload()"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/><path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/></svg><strong>초기화</strong></button>';
				noResultFound += '</div>';
				noResultFound += '<div class="col col-lg-3"></div>';
				noResultFound += '</div></div>';
				$("#newPdResultList").html(noResultFound); //메인 컨텐츠 적용
			}else{
				// 결과가 1개이상
				$("#newPdResultList").html(newPdContentTag); //메인 컨텐츠 적용
			}

			//페이징
			newPdPagingTag += '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
			if(pageInfo.xprev){
				newPdPagingTag+="<li class='page-item'><a href='#' class='page-link' aria-label='Previous' onclick='newPdList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +", "+ cateString +", "+ brandString +", "+ priceString +");return false;'><span aria-hidden='true'>&laquo;</span></a></li>";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					newPdPagingTag += "<li class='page-item'><a class='page-link active' href='#'>"+i+"</a></li>";
				}else{
					newPdPagingTag += "<li class='page-item'><a class='page-link' href='#' onclick='newPdList(" + i + ", " + sortType +", "+ cateString +", "+ brandString +", "+ priceString +");return false;' >"+i+"</a></li>";
				}
				
			}
			if(pageInfo.xnext){
				newPdPagingTag+="<li class='page-item'><a href='#' class='page-link' aria-label='Previous' onclick='newPdList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +", "+ cateString +", "+ brandString +", "+ priceString +");return false;'><span aria-hidden='true'>&raquo;</span></a></li>";
			}
			
			newPdPagingTag +='</ul></nav>';
			$("#newPdResultPagingNo").html(newPdPagingTag); //페이징 적용
			window.scrollTo(0,0); // 스크롤 맨 위로 이동
        },
        error : function(){
             alert('error - newPdList');
        }//error
    });//ajax
}// function end

// 정렬함수
function sortList(inputsort){
	sortType = inputsort;
	newPdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
}

//정렬 A태그 디자인 관련
$("#sortBtn1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn2").css('font-weight', 'normal');
	$("#sortBtn3").css('font-weight', 'normal');
	$("#sortBtn4").css('font-weight', 'normal');
});
$("#sortBtn2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
	$("#sortBtn3").css('font-weight', 'normal');
	$("#sortBtn4").css('font-weight', 'normal');
});
$("#sortBtn3").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
	$("#sortBtn2").css('font-weight', 'normal');
	$("#sortBtn4").css('font-weight', 'normal');
});
$("#sortBtn4").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
	$("#sortBtn2").css('font-weight', 'normal');
	$("#sortBtn3").css('font-weight', 'normal');
});


// 필터 재설정 => 리다이렉트
function filter_reload(){
	location.href = "/collections/newProduct";
}


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

// 아코디언 버튼 회전 - 카테고리
let accor_cate_toggle = true;
$('#accor_cate').click(()=>{
	if(accor_cate_toggle){
		$('#filter_collapse_btn_cate').css('transition','all ease 0.6s');
		$('#filter_collapse_btn_cate').css('transform','rotate(180deg)');
		accor_cate_toggle = false;
	}else{
		$('#filter_collapse_btn_cate').css('transition','all ease 0.6s');
		$('#filter_collapse_btn_cate').css('transform','rotate(0deg)');
		accor_cate_toggle = true;
	}
});

let accor_btn_toggle = true;
$('#accor_brand').click(()=>{
	if(accor_btn_toggle){
		$('#filter_collapse_btn_brd').css('transition','all ease 0.6s');
		$('#filter_collapse_btn_brd').css('transform','rotate(180deg)');
		accor_btn_toggle = false;
	}else{
		$('#filter_collapse_btn_brd').css('transition','all ease 0.6s');
		$('#filter_collapse_btn_brd').css('transform','rotate(0deg)');
		accor_btn_toggle = true;
	}
});

let accor_prc_toggle = true;
$('#accor_price').click(()=>{
	if(accor_prc_toggle){
		$('#filter_collapse_btn_prc').css('transition','all ease 0.6s');
		$('#filter_collapse_btn_prc').css('transform','rotate(180deg)');
		accor_prc_toggle = false;
	}else{
		$('#filter_collapse_btn_prc').css('transition','all ease 0.6s');
		$('#filter_collapse_btn_prc').css('transform','rotate(0deg)');
		accor_prc_toggle = true;
	}
});

</script>
</html>