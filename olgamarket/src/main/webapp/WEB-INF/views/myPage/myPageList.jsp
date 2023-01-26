<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
#plListBt, #slListBt, #favListBt, #memUpdateBt{
	text-decoration: none;
}

.sessionMemIdOrder, .sessionMemIdShip, .sessionpdSelId{
	display: none;
}
</style>
<body>
	<h1>마이페이지</h1>
	
	
	<a href="#" onclick="purchaseList(1, '${member.getMemId()}');return false;" id="plListBt">주문 내역</a>
	<a href="#" onclick="slList(1, '${member.getMemId()});return false;" id="slListBt">배송지</a>
	<a href="#" onclick="favList(1);return false;" id="favListBt">찜</a>
	<a href="/myPage/memInfoUpdateView" id="memUpdateBt">회원 정보 수정</a>
	
	<hr />
	
<!-- 주문 내역-->	
	<div id="plDiv" style="display : none;">
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
			<button type="submit" class="pdInsert_btn">배송지 등록</button>
		</div>
	</div>
</form>	
	
<!-- 찜 -->	
	<div id="favDiv" style="display : none;">
		<div id="favResultList"></div>
		<div id="favResultPagingNo"></div>
	</div>
			

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
        	
            var purchaseContentTag = "<table><tr><th>No</th><th>주문 번호</th><th>상품 아이디</th><th>수량</th><th>가격</th><th>적립금</th><th>결제방식</th><th>배송지</th><th>주문 상태</th><th>주문 날짜</th></tr>";
            var purchasePagingTag = "";

			$.each(purchasePageList, function(key, value) {
				purchaseContentTag += "<tr>";
				purchaseContentTag += "<td>"+value.plNo+"</td>";
				purchaseContentTag += "<td>"+value.plOrderNo+"</td>";
				purchaseContentTag += "<td>"+value.plpdId+"</td>";
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
        	
            var shipContentTag = "<table><tr><th>No</th><th>주소</th></tr>";
            var shipPagingTag = "";

			$.each(shipPageList, function(key, value) {
				shipContentTag += "<tr>";
				shipContentTag += "<td>"+value.slNo+"</td>";
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

$("#plListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#plDiv').css('display', 'block');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
});
$("#slListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#slDiv').css('display', 'block');
	$("#favListBt").css('font-weight', 'normal');
	$('#favDiv').css('display', 'none');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
});
$("#favListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#favDiv').css('display', 'block');
	$("#plListBt").css('font-weight', 'normal');
	$('#plDiv').css('display', 'none');
	$("#slListBt").css('font-weight', 'normal');
	$('#slDiv').css('display', 'none');
});
</script>	
</html>