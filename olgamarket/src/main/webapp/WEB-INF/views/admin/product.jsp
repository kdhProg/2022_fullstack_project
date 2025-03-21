<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<style>
#pdListBt, #pdQnListBt{
	text-decoration: none;
}
a {
	text-decoration: none;
}
.nav_homeBtn{
	border: none;
	background: transparent;
}
</style>
<body>
<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/storeList">스토어 관리</a>
			<a class="navbar-brand" href="/admin/seller">셀러 관리</a>
			<a class="navbar-brand" href="/admin/product">상품 관리</a>
			<a class="navbar-brand" href="/admin/clientList">고객센터 관리</a>
			<a class="navbar-brand" href="/admin/memberGrade">회원 등급 관리</a>
			<a class="navbar-brand" href="/admin/adminStats">통계</a>
			<a class="navbar-brand" href="/admin/enterAdminMain"><svg class="nav_homeBtn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg></a>
		</div>
	</nav>
	<br />
		<div class="row">
			<div class="col text-center"> 
				<h1>상품 관리</h1>
			</div>
		</div>
	<br />
	<br />
	<a href="#" onclick="pdList(1);return false;" id="pdListBt" class="btn btn-primary">상품 목록</a>
	<a href="#" onclick="pdQnList(1);return false;" id="pdQnListBt" class="btn btn-primary">상품 문의</a>
	
	<hr />

<!-- 상품 목록 -->	
<form name="insertForm" method="post" action="/admin/productInsertView">
	<div id="pdDiv" style="display : show;">
		<div class="row">
			<div class="col text-end">
				<button type="submit" class="btn btn-outline-danger">상품 등록</button>
			</div>
		</div>
		<div id="pdResultList"></div>
		<div id="pdResultPagingNo"></div>
	</div>
</form>	

<!-- 상품 문의 -->	
	<div id="pdQnDiv" style="display : none;">
		<a href="#" onclick="sortList(1);return false;" id="sortBtn1" class="btn btn-light">답변 대기</a>
		<a href="#" onclick="sortList(2);return false;" id="sortBtn2" class="btn btn-light">답변 완료</a>
		<div id="pdQuiryResultList"></div>
		<div id="pdQuiryResultPagingNo"></div>
		
	</div>
</div>
<br />
<br />
<br />
</body>
<script>
/********************* 상품 목록 *******************************************************************/
$(document).ready(pdList(1));
function pdList(pageNo) {
	$.ajax({
        url : "/admin/productList",
        type : "get",
        data : {
        	showPage : pageNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var pdPageList = data.pdList; // model 처럼
        	
            var pdContentTag = "<table class='table'><tr><th>Id</th><th>상품 이름</th><th>카테고리</th><th>브랜드</th><th>가격</th><th>할인</th><th>재고</th><th>판매량</th><th>등록일</th></tr>";
            var pdPagingTag = "";

			$.each(pdPageList, function(key, value) {
				pdContentTag += "<tr>";
				pdContentTag += "<td><a href='/admin/productOne?pdId="+value.pdId+"'class='btn btn-danger'>"+value.pdId+"</a></td>";
				pdContentTag += "<td>"+value.pdName+"</td>";
				pdContentTag += "<td>"+value.pdMainCategory+"</td>";
				pdContentTag += "<td>"+value.pdstlBrandName+"</td>";
				pdContentTag += "<td>"+value.pdPrice+"</td>";
				pdContentTag += "<td>"+value.pdSale+"</td>";
				pdContentTag += "<td>"+value.pdStock+"</td>";
				pdContentTag += "<td>"+value.pdSalesVolume+"</td>";
				pdContentTag += "<td>"+value.pdUpdDate.substring(0,10)+"</td>";
				pdContentTag += "</tr>";                
             });
			pdContentTag += "</table>";
			$("#pdResultList").html(pdContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				pdPagingTag+="<a href='#' onclick='pdList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					pdPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					pdPagingTag+="<a href='#' onclick='pdList(" + i + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				pdPagingTag+="<a href='#' onclick='pdList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#pdResultPagingNo").html(pdPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - pdList');
        }//error
    });//ajax
}// function end

/********************* 상품 문의 *******************************************************************/ 
let sortType = 1;
$(document).ready(pdQnList(1), 1);
function pdQnList(pageNo, sortNo) {
	$.ajax({
        url : "/admin/quiryAdmin",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var pdQnPageList = data.pdQuiryList; // model 처럼
            
            var pdQuiryContentTag = "<table class='table'><tr><th>No</th><th>상품 아이디</th><th>제목</th><th>내용</th><th>답변 상태</th><th>작성자</th><th>등록일</th></tr>";
            var pdQuiryPagingTag = "";
            
			$.each(pdQnPageList, function(key, value) {
				pdQuiryContentTag += "<tr>";
				pdQuiryContentTag += "<td><a href='/admin/adminQuiryOne?iqNo="+value.iqNo+"'class='btn btn-danger'>"+value.iqNo+"</a></td>";
				pdQuiryContentTag += "<td>"+value.iqpdId+"</td>";
				pdQuiryContentTag += "<td>"+value.iqTitle+"</td>";
				pdQuiryContentTag += "<td>"+value.iqContent+"</td>";
				if(value.iqState === 1){pdQuiryContentTag += "<td><p style='color:green;'><strong>답변완료</strong><p></td>";}else{pdQuiryContentTag += "<td><p><strong>처리대기중</strong><p></td>";}
				pdQuiryContentTag += "<td>"+value.iqmemId+"</td>";
				pdQuiryContentTag += "<td>"+value.iqRegiDate.substring(0,10)+"</td>";
				pdQuiryContentTag += "</tr>";                
             });
			pdQuiryContentTag += "</table>";
			$("#pdQuiryResultList").html(pdQuiryContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				pdQuiryPagingTag+="<a href='#' onclick='pdQnList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					pdQuiryPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					pdQuiryPagingTag+="<a href='#' onclick='pdQnList(" + i + ", " + sortType +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				pdQuiryPagingTag+="<a href='#' onclick='pdQnList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#pdQuiryResultPagingNo").html(pdQuiryPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - pdQnList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList(inputsort){
	sortType = inputsort;
	pdQnList(1,sortType);
}

$("#pdListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#pdDiv').css('display', 'block');
	$("#pdQnListBt").css('font-weight', 'normal');
	$('#pdQnDiv').css('display', 'none');
});

$("#pdQnListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#pdQnDiv').css('display', 'block');
	$("#pdListBt").css('font-weight', 'normal');
	$('#pdDiv').css('display', 'none');
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