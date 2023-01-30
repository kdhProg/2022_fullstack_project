<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>마이페이지</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더, 풋터 CSS 링크 -->
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
<link rel="stylesheet" href="/resources/css/mainheader.css" />
</head>
<style>
#plListBt, #slListBt, #favListBt, #memUpdateBt, #quListBt, #rvListBt{
	text-decoration: none;
}

.sessionMemIdOrder, .sessionMemIdShip, .sessionMemIdFavor, .sessionMemIdReview, .sessionMemIdQuiry{
	display: none;
}
a {
	text-decoration: none;
}
</style>
<body>
<div class="container">
	<ul class="nav nav-pills">
		<li class="nav-item">
			<a href="#" onclick="purchaseList(1, '${member.getMemId()}');return false;" id="plListBt" class="nav-link">주문 내역</a>
	 	</li>
		<li class="nav-item">
	    	<a href="#" onclick="myShipList(1, '${member.getMemId()}');return false;" id="slListBt" class="nav-link">배송지</a>
		</li>
		<li class="nav-item">
			<a href="#" onclick="myFavorList(1, '${member.getMemId()}');return false;" id="favListBt" class="nav-link">찜</a>
		</li>
		<li class="nav-item">
			<a href="#" onclick="myReviewList(1, '${member.getMemId()}');return false;" id="rvListBt" class="nav-link">상품 후기</a>
		</li>
		<li class="nav-item">
			<a href="#" onclick="myQuiryList(1, '${member.getMemId()}');return false;" id="quListBt" class="nav-link">상품 문의</a>
		</li>
		<li class="nav-item">
			<a href="/myPage/memInfoUpdateView?memId=${member.getMemId()}" id="memUpdateBt" class="nav-link">내 정보 수정</a>
		</li>
	</ul>
	
<!-- 주문 내역-->	
	<div id="plDiv" style="display : show;">
		<span class="sessionMemIdOrder">${member.getMemId()}</span>
		<div id="plResultList"></div>
		<div id="plResultPagingNo"></div>
	</div>
	
<!-- 배송지 -->	
<form name="insertForm" method="post" action="/myPage/shipInsertView">
	<div id="slDiv" style="display : none;">
		<span class="sessionMemIdShip">${member.getMemId()}</span>
		<div id="slResultList"></div>
		<div id="slResultPagingNo"></div>
		<div>
			<button type="submit" class="btn btn-outline-danger">배송지 등록</button>
		</div>
	</div>
</form>	
	
<!-- 찜 -->	
	<div id="favDiv" style="display : none;">
		<span class="sessionMemIdFavor">${member.getMemId()}</span>
		<div id="favResultList"></div>
		<div id="favResultPagingNo"></div>
	</div>
	
<!-- 상품후기 -->	
	<div id="rvDiv" style="display : none;">
		<span class="sessionMemIdReview">${member.getMemId()}</span>
		<div id="rvResultList"></div>
		<div id="rvResultPagingNo"></div>
	</div>	
	
<!-- 상품문의 -->	
	<div id="quDiv" style="display : none;">
		<span class="sessionMemIdQuiry">${member.getMemId()}</span>
		<div id="quResultList"></div>
		<div id="quResultPagingNo"></div>
	</div>		
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
</body>
<script>
/********************* 주문내역 *******************************************************************/
let memIdType1 = $(".sessionMemIdOrder").text();
$(document).ready(purchaseList(1, memIdType1));
function purchaseList(pageNo, plmemId) {
	$.ajax({
        url : "/myPage/purchase",
        type : "get",
        data : {
        	showPage : pageNo,
        	plmemId : plmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var purchasePageList = data.purchaseList; // model 처럼
        	
            var purchaseContentTag = "<table class='table'><tr><th>No</th><th>주문 번호</th><th>상품 아이디</th><th>수량</th><th>가격</th><th>적립금</th><th>결제방식</th><th>배송지</th><th>주문 상태</th><th>주문 날짜</th></tr>";
            var purchasePagingTag = "";

			$.each(purchasePageList, function(key, value) {
				purchaseContentTag += "<tr>";
				purchaseContentTag += "<td>"+value.plNo+"</td>";
				purchaseContentTag += "<td>"+value.plOrderNo+"</td>";
				purchaseContentTag += "<td><a href='/goods/detailView?pdId="+value.plpdId+"'class='btn btn-danger'>"+value.plpdId+"</td>";
				purchaseContentTag += "<td>"+value.plPdQuantity+"</td>";
				purchaseContentTag += "<td>"+value.plTotalPrice+"</td>";
				purchaseContentTag += "<td>"+value.plSavedMoney+"</td>";
				purchaseContentTag += "<td>"+value.plPayWay+"</td>";
				purchaseContentTag += "<td>"+value.plShipAddInfo+"</td>";
				purchaseContentTag += "<td>"+value.plOrderState+"</td>";
				purchaseContentTag += "<td>"+value.plDate+"</td>";
             });
			purchaseContentTag += "</table>";
			$("#plResultList").html(purchaseContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				purchasePagingTag+="<a href='#' onclick='purchaseList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType1 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					purchasePagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					purchasePagingTag+="<a href='#' onclick='purchaseList(" + i + ", \""+ memIdType1 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				purchasePagingTag+="<a href='#' onclick='purchaseList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType1 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#plResultPagingNo").html(purchasePagingTag); //페이징 적용
        },
        error : function(){
             alert('error - purchaseList');
        }//error
    });//ajax
}// function end

/********************* 배송지 *******************************************************************/
let memIdType2 = $(".sessionMemIdShip").text();
$(document).ready(myShipList(1, memIdType2));
function myShipList(pageNo, slmemId) {
	$.ajax({
        url : "/myPage/shipList",
        type : "get",
        data : {
        	showPage : pageNo,
        	slmemId : slmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var shipPageList = data.myShipList; // model 처럼
        	
            var shipContentTag = "<table class='table'><tr><th>No</th><th>주소</th></tr>";
            var shipPagingTag = "";

			$.each(shipPageList, function(key, value) {
				shipContentTag += "<tr>";
				shipContentTag += "<td><a href='/myPage/shipOne?slNo="+value.slNo+"'class='btn btn-danger'>"+value.slNo+"</a></td>";
				shipContentTag += "<td>"+value.slAddress+"</td>";
             });
			shipContentTag += "</table>";
			$("#slResultList").html(shipContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				shipPagingTag+="<a href='#' onclick='myShipList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType2 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					shipPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					shipPagingTag+="<a href='#' onclick='myShipList(" + i + ", \""+ memIdType2 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				shipPagingTag+="<a href='#' onclick='myShipList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType2 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#slResultPagingNo").html(shipPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - myShipList');
        }//error
    });//ajax
}// function end

/********************* 찜목록 *******************************************************************/
let memIdType3 = $(".sessionMemIdFavor").text();
$(document).ready(myFavorList(1, memIdType3));
function myFavorList(pageNo, fvmemId) {
	$.ajax({
        url : "/myPage/favorList",
        type : "get",
        data : {
        	showPage : pageNo,
        	fvmemId : fvmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var favorPageList = data.myFavorList; // model 처럼
        	
            var favorContentTag = "<table class='table'><tr><th>No</th><th>아이디</th><th>상품 아이디</th></tr>";
            var favorPagingTag = "";

			$.each(favorPageList, function(key, value) {
				favorContentTag += "<tr>";
				favorContentTag += "<td>"+value.fvNo+"</td>";
				favorContentTag += "<td>"+value.fvmemId+"</td>";
				favorContentTag += "<td><a href='/goods/detailView?pdId="+value.fvpdId+"'class='btn btn-danger'>"+value.fvpdId+"</a></td>";
             });
			favorContentTag += "</table>";
			$("#favResultList").html(favorContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				favorPagingTag+="<a href='#' onclick='myFavorList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType3 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					favorPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					favorPagingTag+="<a href='#' onclick='myFavorList(" + i + ", \""+ memIdType3 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				favorPagingTag+="<a href='#' onclick='myFavorList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType3 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#favResultPagingNo").html(favorPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - myFavorList');
        }//error
    });//ajax
}// function end

/********************* 상품 후기 *******************************************************************/
let memIdType4 = $(".sessionMemIdReview").text();
$(document).ready(myReviewList(1, memIdType4));
function myReviewList(pageNo, rvmemId) {
	$.ajax({
        url : "/myPage/reviewList",
        type : "get",
        data : {
        	showPage : pageNo,
        	rvmemId : rvmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var reviewPageList = data.myReviewList; // model 처럼
        	
            var reviewContentTag = "<table class='table'><tr><th>No</th><th>상품 아이디</th><th>내용</th><th>이미지</th><th>추천수</th><th>신고수</th><th>등록일</th></tr>";
            var reviewPagingTag = "";

			$.each(reviewPageList, function(key, value) {
				reviewContentTag += "<tr>";
				reviewContentTag += "<td><a href='/myPage/reviewOne?rvNo="+value.rvNo+"'class='btn btn-danger'>"+value.rvNo+"</a></td>";
				reviewContentTag += "<td><a href='/goods/detailView?pdId="+value.rvpdId+"'class='btn btn-danger'>"+value.rvpdId+"</a></td>";
				reviewContentTag += "<td>"+value.rvContent+"</td>";
				reviewContentTag += "<td>"+value.rvImg+"</td>";
				reviewContentTag += "<td>"+value.rvNice+"</td>";
				reviewContentTag += "<td>"+value.rvReport+"</td>";
				reviewContentTag += "<td>"+value.rvUpdDate+"</td>";
             });
			reviewContentTag += "</table>";
			$("#rvResultList").html(reviewContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				reviewPagingTag+="<a href='#' onclick='myReviewList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType4 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					reviewPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					reviewPagingTag+="<a href='#' onclick='myReviewList(" + i + ", \""+ memIdType4 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				reviewPagingTag+="<a href='#' onclick='myReviewList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType4 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#rvResultPagingNo").html(reviewPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - myReviewList');
        }//error
    });//ajax
}// function end

/********************* 상품 문의 *******************************************************************/
let memIdType5 = $(".sessionMemIdQuiry").text();
$(document).ready(myQuiryList(1, memIdType5));
function myQuiryList(pageNo, iqmemId) {
	$.ajax({
        url : "/myPage/quiryList",
        type : "get",
        data : {
        	showPage : pageNo,
        	iqmemId : iqmemId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var quiryPageList = data.myQuiryList; // model 처럼
        	
            var quiryContentTag = "<table class='table'><tr><th>No</th><th>상품 아이디</th><th>제목</th><th>답변 상태</th><th>등록일</th></tr>";
            var quiryPagingTag = "";

			$.each(quiryPageList, function(key, value) {
				quiryContentTag += "<tr>";
				quiryContentTag += "<td><a href='/myPage/quiryOne?iqNo="+value.iqNo+"'class='btn btn-danger'>"+value.iqNo+"</a></td>";
				quiryContentTag += "<td><a href='/goods/detailView?pdId="+value.iqpdId+"'class='btn btn-danger'>"+value.iqpdId+"</a></td>";
				quiryContentTag += "<td>"+value.iqTitle+"</td>";
				quiryContentTag += "<td>"+value.iqState+"</td>";
				quiryContentTag += "<td>"+value.iqRegiDate+"</td>";
             });
			quiryContentTag += "</table>";
			$("#quResultList").html(quiryContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				quiryPagingTag+="<a href='#' onclick='myQuiryList("+(pageInfo.firstPageNoOnPageList-1)+ ", \""+ memIdType5 +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					quiryPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					quiryPagingTag+="<a href='#' onclick='myQuiryList(" + i + ", \""+ memIdType5 +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				quiryPagingTag+="<a href='#' onclick='myQuiryList("+(pageInfo.lastPageNoOnPageList+1)+ ", \""+ memIdType5 +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#quResultPagingNo").html(quiryPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - myQuiryList');
        }//error
    });//ajax
}// function end
$("#plListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#plDiv').css('display', 'block');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
	$("#rvListBt").css('font-weight', 'normal');
	$('#rvDiv').css('display', 'none');
	$("#quListBt").css('font-weight', 'normal');
	$('#quDiv').css('display', 'none');
});
$("#slListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#slDiv').css('display', 'block');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
	$("#rvListBt").css('font-weight', 'normal');
	$('#rvDiv').css('display', 'none');
	$("#quListBt").css('font-weight', 'normal');
	$('#quDiv').css('display', 'none');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
});
$("#favListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#favDiv').css('display', 'block');
	$("#rvListBt").css('font-weight', 'normal');
	$('#rvDiv').css('display', 'none');
	$("#quListBt").css('font-weight', 'normal');
	$('#quDiv').css('display', 'none');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
});
$("#rvListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#rvDiv').css('display', 'block');
	$("#quListBt").css('font-weight', 'normal');
	$('#quDiv').css('display', 'none');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
});
$("#quListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#quDiv').css('display', 'block');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
	$("#rvListBt").css('font-weight', 'normal');
	$('#rvDiv').css('display', 'none');
});
</script>	
</html>