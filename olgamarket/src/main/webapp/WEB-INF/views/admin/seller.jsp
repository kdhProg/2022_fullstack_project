<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<style>
#selListBt, #sqListBt, #npqListBt{
	text-decoration: none;
}
a {
	text-decoration: none;
}


</style>

<body>
<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/storeList">판매점</a>
			<a class="navbar-brand" href="/admin/seller">판매자</a>
			<a class="navbar-brand" href="/admin/product">상품</a>
			<a class="navbar-brand" href="/admin/clientList">고객센터</a>
			<a class="navbar-brand" href="/admin/memberGrade">회원</a>
			<a class="navbar-brand" href="/admin/adminStats">통계</a>	
		</div>
	</nav>
	
	<br />
	<a href="#" onclick="selList(1);return false;" id="selListBt" class="btn btn-primary">판매자 목록</a>
	<a href="#" onclick="npqList(1);return false;" id="npqListBt" class="btn btn-primary">신상품 등록 문의</a>
	<a href="#" onclick="sqList(1);return false;" id="sqListBt" class="btn btn-primary">판매자 문의</a>
	
	<hr />

<!-- 판매자 목록 -->	
	<div id="selDiv" style="display : none;">
		<a href="#" onclick="sortList1(1);return false;" id="sortBtn1" class="btn btn-light">판매자</a>
		<a href="#" onclick="sortList1(2);return false;" id="sortBtn2" class="btn btn-light">권한 회수된 판매자</a>
		<div id="selResultList"></div>
		<div id="selResultPagingNo"></div>
	</div>

<!-- 신상품 등록 문의 -->	
	<div id="npqDiv" style="display : none;">
		<a href="#" onclick="sortList2(1);return false;" id="sortBtn1" class="btn btn-light">답변 대기</a>
		<a href="#" onclick="sortList2(2);return false;" id="sortBtn2" class="btn btn-light">답변 완료</a>
		<div id="newPdQuiryResultList"></div>
		<div id="newPdQuiryResultPagingNo"></div>
	</div>

<!-- 판매자 문의 -->	
	<div id="sqDiv" style="display : none;">
		<a href="#" onclick="sortList3(1);return false;" id="sortBtn1" class="btn btn-light">답변 대기</a>
		<a href="#" onclick="sortList3(2);return false;" id="sortBtn2" class="btn btn-light">답변 완료</a>
		<div id="sqResultList"></div>
		<div id="sqResultPagingNo"></div>
	</div>
		
</div>
</body>
<script>
/********************* 판매자 목록 *******************************************************************/
var sortType1 = 1; 
$(document).ready(selList(1), 1);
function selList(pageNo, sortNo) {
	$.ajax({
        url : "/admin/sellerList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var selPageList = data.selList; // model 처럼
        	
            var selContentTag = "<table class='table'><tr><th>Id</th><th>판매자 이름</th><th>상호명</th><th>이메일</th><th>전화 번호</th><th>마켓 고유 번호</th><th>사업자 등록 번호</th><th>판매자 권한</th><th>등록일</th></tr>";
            var selPagingTag = "";
			
			$.each(selPageList, function(key, value) {
				selContentTag += "<tr>";
				selContentTag += "<td><a href='/admin/sellerOne?selId="+value.selId+"&selstlBrandName="+value.selstlBrandName+"'class='btn btn-danger'>"+value.selId+"</a></td>";
				selContentTag += "<td>"+value.selName+"</td>";
				selContentTag += "<td>"+value.selstlBrandName+"</td>";
				selContentTag += "<td>"+value.selEmail+"</td>";
				selContentTag += "<td>"+value.selPhone+"</td>";
				selContentTag += "<td>"+value.selMarketUniqueNo+"</td>";
				selContentTag += "<td>"+value.selSelRegiNo+"</td>";
				selContentTag += "<td>"+value.selTypeGrade+"</td>";
				selContentTag += "<td>"+value.selUpdDate+"</td>";
				selContentTag += "</tr>";                
             });
			selContentTag += "</table>";
			$("#selResultList").html(selContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				selPagingTag+="<a href='#' onclick='selList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType1 +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					selPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					selPagingTag+="<a href='#' onclick='selList(" + i + ", " + sortType1 +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				selPagingTag+="<a href='#' onclick='selList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType1 +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#selResultPagingNo").html(selPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - selList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList1(inputsort){
	sortType1 = inputsort;
	selList(1,sortType1);
}
/********************* 신상품 등록 문의 목록 *******************************************************************/
var sortType2 = 1; 
$(document).ready(npqList(1), 1);
function npqList(pageNo, sortNo) {
	$.ajax({
        url : "/admin/newPdQuiryList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var npqPageList = data.npqList; // model 처럼
        	
            var npqContentTag = "<table class='table'><tr><th>No</th><th>판매자 Id</th><th>제목</th><th>내용</th><th>이미지</th><th>답변 상태</th><th>등록일</th></tr>";
            var npqPagingTag = "";
			
			$.each(npqPageList, function(key, value) {
				npqContentTag += "<tr>";
				npqContentTag += "<td><a href='/admin/newPdQuiryOne?npqNo="+value.npqNo+"'class='btn btn-danger'>"+value.npqNo+"</a></td>";
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
				npqPagingTag+="<a href='#' onclick='npqList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType2 +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					npqPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					npqPagingTag+="<a href='#' onclick='npqList(" + i + ", " + sortType2 +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				npqPagingTag+="<a href='#' onclick='npqList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType2 +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#newPdQuiryResultPagingNo").html(npqPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - npqList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList2(inputsort){
	sortType2 = inputsort;
	npqList(1,sortType2);
}
/********************* 판매자 문의 *******************************************************************/ 
var sortType3 = 1;
$(document).ready(sqList(1), 1);
function sqList(pageNo, sortNo) {
	$.ajax({
        url : "/admin/selQuiryList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var selQuiryPageList = data.sqList; // model 처럼
            
            var selQuiryContentTag = "<table class='table'><tr><th>No</th><th>상품 아이디</th><th>제목</th><th>내용</th><th>답변 상태</th><th>작성자</th><th>등록일</th></tr>";
            var selQuiryPagingTag = "";
            
			$.each(selQuiryPageList, function(key, value) {
				selQuiryContentTag += "<tr>";
				selQuiryContentTag += "<td><a href='/admin/selQuiryOne?sqNo="+value.sqNo+"'class='btn btn-danger'>"+value.sqNo+"</a></td>";
				selQuiryContentTag += "<td>"+value.sqpdId+"</td>";
				selQuiryContentTag += "<td>"+value.sqTitle+"</td>";
				selQuiryContentTag += "<td>"+value.sqContent+"</td>";
				selQuiryContentTag += "<td>"+value.sqState+"</td>";
				selQuiryContentTag += "<td>"+value.sqselId+"</td>";
				selQuiryContentTag += "<td>"+value.sqRegiDate+"</td>";
				selQuiryContentTag += "</tr>";                
             });
			selQuiryContentTag += "</table>";
			$("#sqResultList").html(selQuiryContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				selQuiryPagingTag+="<a href='#' onclick='sqList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType3 +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					selQuiryPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					selQuiryPagingTag+="<a href='#' onclick='sqList(" + i + ", " + sortType3 +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				selQuiryPagingTag+="<a href='#' onclick='sqList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType3 +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#sqResultPagingNo").html(selQuiryPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - sqList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList3(inputsort){
	sortType3 = inputsort;
	sqList(1,sortType3);
}

$("#selListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#selDiv').css('display', 'block');
	$("#npqListBt").css('font-weight', 'normal');
	$('#npqDiv').css('display', 'none');
	$("#sqListBt").css('font-weight', 'normal');
	$('#sqDiv').css('display', 'none');
});

$("#npqListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#npqDiv').css('display', 'block');
	$("#sqListBt").css('font-weight', 'normal');
	$('#sqDiv').css('display', 'none');
	$("#selListBt").css('font-weight', 'normal');
	$('#selDiv').css('display', 'none');
});

$("#sqListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#sqDiv').css('display', 'block');
	$("#selListBt").css('font-weight', 'normal');
	$('#selDiv').css('display', 'none');
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