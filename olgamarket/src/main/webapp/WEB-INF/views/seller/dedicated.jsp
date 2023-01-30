<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Seller</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
#selListBt, #sqListBt{
	text-decoration: none;
}
.sessionSelId, .sessionBrandName, .sessionpdSelId{
	display: none;
}
a {
	text-decoration: none;
}


</style>

<body>
<div class="container">
	<nav class="nav nav-pills nav-fill">
		<div class="nav nav-pills flex-column flex-sm-row">
			<a href="#" onclick="npqList(1, 1, '${seller.getSelId()}');return false;" id="npqListBt" class="btn btn-primary">신상품 등록 문의</a>
			<a href="#" onclick="pdList(1, '${seller.getSelstlBrandName()}', '${seller.getSelId()}');return false;" id="pdListBt" class="btn btn-primary">등록된 상품 목록</a>
		</div>
	</nav>	

	<hr />

<!-- 신상품 등록 문의 -->
<form name="insertForm" method="post" action="/seller/newPdQuiryInsertView?selId=${seller.getSelId()}">
	<span class="sessionSelId">${seller.getSelId()}</span>
	<div id="npqDiv" style="display : none;">
		<a href="#" onclick="sortList1(1);return false;" id="sortBtn1" class="btn btn-light">답변 대기</a>
		<a href="#" onclick="sortList1(2);return false;" id="sortBtn2" class="btn btn-light">답변 완료</a>
		<div id="newPdQuiryResultList"></div>
		<div id="newPdQuiryResultPagingNo"></div>
		<div>
			<button type="submit" class="btn btn-outline-danger">등록 문의하기</button>
		</div>
	</div>
</form>	

<!-- 등록된 상품 목록 -->	
	<div id="pdDiv" style="display : none;">
	<span class="sessionBrandName">${seller.getSelstlBrandName()}</span>
	<span class="sessionpdSelId">${seller.getSelId()}</span>
		<div id="pdResultList"></div>
		<div id="pdResultPagingNo"></div>
	</div>
</div>	
</body>
<script>
/********************* 신상품 등록 문의 목록 *******************************************************************/
var sortType1 = 1; 
let selIdType = $(".sessionSelId").text();
$(document).ready(npqList(1, 1, selIdType));
function npqList(pageNo, sortNo, npqselId) {
	
	$.ajax({
        url : "/seller/newPdQuiryList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo,
        	npqselId : npqselId
        }, 
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var npqPageList = data.npqList; // model 처럼
        	
            var npqContentTag = "<table class='table'><tr><th>No</th><th>판매자 Id</th><th>제목</th><th>내용</th><th>이미지</th><th>답변 상태</th><th>등록일</th></tr>";
            var npqPagingTag = "";
			
			$.each(npqPageList, function(key, value) {
				npqContentTag += "<tr>";
				npqContentTag += "<td><a href='/seller/newPdQuiryOne?npqNo="+value.npqNo+"'class='btn btn-danger'>"+value.npqNo+"</a></td>";
				npqContentTag += "<td>"+value.npqselId+"</td>";
				npqContentTag += "<td>"+value.npqTitle+"</td>";
				npqContentTag += "<td>"+value.npqContent+"</td>";
				npqContentTag += "<td>"+value.npqImg+"</td>";
				npqContentTag += "<td>"+value.npqState+"</td>";
				npqContentTag += "<td>"+value.npqRegiDate+"</td>";
				npqContentTag += "</tr>";                
             });
			npqContentTag += "</table>";
			$("#newPdQuiryResultList").html(npqContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				npqPagingTag+="<a href='#' onclick='npqList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType1 +" , \""+ selIdType +"\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					npqPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					npqPagingTag+="<a href='#' onclick='npqList(" + i + ", " + sortType1 +" , \""+ selIdType +"\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				npqPagingTag+="<a href='#' onclick='npqList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType1 +" , \""+ selIdType +"\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#newPdQuiryResultPagingNo").html(npqPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - npqList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList1(inputsort){
	sortType1 = inputsort;
	npqList(1, sortType1, selIdType);
}
/********************* 판매자 등록 상품 문의 *******************************************************************/ 
let brandNameType = $(".sessionBrandName").text();
let selIdType2 = $(".sessionpdSelId").text();
$(document).ready(pdList(1, brandNameType, selIdType2));
function pdList(pageNo, selstlBrandName, selId) {
	$.ajax({
        url : "/seller/productList",
        type : "get",
        data : {
        	showPage : pageNo,
        	brandName : selstlBrandName,
        	selId : selId
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var pdPageList = data.pdList;
            var selId = data.selId;// model 처럼
        	
            var pdContentTag = "<table class='table'><tr><th>Id</th><th>썸네일 이미지</th><th>상품 이름</th><th>카테고리</th><th>브랜드</th><th>가격</th><th>할인</th><th>재고</th><th>판매량</th><th>등록일</th></tr>";
            var pdPagingTag = "";

			$.each(pdPageList, function(key, value) {
				pdContentTag += "<tr>";
				pdContentTag += "<td><a href='/seller/productOne?pdId="+value.pdId+"&pdstlBrandName="+value.pdstlBrandName+"&selId="+selId+"'class='btn btn-danger'>"+value.pdId+"</a></td>";
				pdContentTag += "<td>"+value.pdThumbImg+"</td>";
				pdContentTag += "<td>"+value.pdName+"</td>";
				pdContentTag += "<td>"+value.pdMainCategory+"</td>";
				pdContentTag += "<td>"+value.pdstlBrandName+"</td>";
				pdContentTag += "<td>"+value.pdPrice+"</td>";
				pdContentTag += "<td>"+value.pdSale+"</td>";
				pdContentTag += "<td>"+value.pdStock+"</td>";
				pdContentTag += "<td>"+value.pdSalesVolume+"</td>";
				pdContentTag += "<td>"+value.pdUpdDate+"</td>";
				pdContentTag += "</tr>";                
             });
			pdContentTag += "</table>";
			$("#pdResultList").html(pdContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				pdPagingTag+="<a href='#' onclick='pdList("+(pageInfo.firstPageNoOnPageList-1)+ ", \"" + brandNameType + "\", \"" + selIdType2 + "\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					pdPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					pdPagingTag+="<a href='#' onclick='pdList(" + i + ", \"" + brandNameType + "\", \"" + selIdType2 + "\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				pdPagingTag+="<a href='#' onclick='pdList("+(pageInfo.lastPageNoOnPageList+1)+ ", \"" + brandNameType + "\", \"" + selIdType2 + "\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#pdResultPagingNo").html(pdPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - pdList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList3(){
	pdList(1, brandNameType, selIdType2);
}

$("#npqListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#npqDiv').css('display', 'block');
	$("#pdListBt").css('font-weight', 'normal');
	$('#pdDiv').css('display', 'none');
});

$("#pdListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#pdDiv').css('display', 'block');
	$("#npqListBt").css('font-weight', 'normal');
	$('#npqDiv').css('display', 'none');
});

//정렬 A태그 디자인 관련
$("#sortBtn1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn2").css('font-weight', 'normal');
});
$("#sortBtn2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
});
</script>
</html>