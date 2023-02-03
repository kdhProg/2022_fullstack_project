<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
#noticeBt,#faqBt,#onetooneBt{
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
					<h1>고객센터 관리</h1>
				</div>
			</div>
		<br />
	<br />
	<a href="#" onclick="noticeList(1);return false;" id="noticeBt" class="btn btn-primary">공지사항</a>
	<a href="#" onclick="faqList(1);return false;" id="faqBt" class="btn btn-primary">FAQ</a>
	<a href="#" onclick="otList(1);return false;" id="onetooneBt" class="btn btn-primary">1 : 1 문의</a>
	
	<hr />
<!-- 공지사항 -->	
<form name="insertForm" method="post" action="/admin/noticeInsertView">
	<div id="noticeDiv" style="display : show;">
		<div class="row">
			<div class="col text-end">
				<button type="submit" class="btn btn-outline-danger">공지사항 등록</button>
			</div>
		</div>	
		<div id="noticeResultList"></div>
		<div id="noticeResultPagingNo"></div>
		
	</div>
</form>	
<!-- faq -->	
<form name="insertForm" method="post" action="/admin/faqInsertView">
	<div id="faqDiv" style="display : none;">
		<div class="row">
			<div class="col text-end">
				<button type="submit" class="btn btn-outline-danger">FAQ 등록</button>
			</div>
		</div>
		<div id="faqResultList"></div>
		<div id="faqResultPagingNo"></div>
	</div>
</form>	
<!-- 1대1 문의 -->	
	
	<div id="otoDiv" style="display : none;">
	<a href="#" onclick="sortList(1);return false;" id="sortBtn1" class="btn btn-light">답변 대기</a>
	<a href="#" onclick="sortList(2);return false;" id="sortBtn2" class="btn btn-light">답변 완료</a>
		<div id="otoResultList"></div>
		<div id="otoResultPagingNo"></div>
		
	</div>

</div>		
</body>
<script>
/********************* 공지사항 *******************************************************************/
$(document).ready(noticeList(1));
function noticeList(pageNo) {
	$.ajax({
        url : "/admin/noticeList",
        type : "get",
        data : {
        	showPage : pageNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var noticePageList = data.noticeList; // model 처럼
        	
            var noticeContentTag = "<table class='table'><tr><th>No</th><th>카테고리</th><th>제목</th><th>작성자</th><th>등록일</th></tr>";
            var noticePagingTag = "";

			$.each(noticePageList, function(key, value) {
				noticeContentTag += "<tr>";
				noticeContentTag += "<td><a href='/admin/noticeOne?ntNo="+value.ntNo+"'class='btn btn-danger'>"+value.ntNo+"</a></td>";
				noticeContentTag += "<td>"+value.ntCategory+"</td>";
				noticeContentTag += "<td>"+value.ntTitle+"</td>";
				noticeContentTag += "<td>"+value.ntadmId+"</td>";
				noticeContentTag += "<td>"+value.ntUpdDate.substring(0,10)+"</td>";
				noticeContentTag += "</tr>";                
             });
			noticePagingTag += "</table>";
			$("#noticeResultList").html(noticeContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				noticePagingTag+="<a href='#' onclick='noticeList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					noticePagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					noticePagingTag+="<a href='#' onclick='noticeList(" + i + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				noticePagingTag+="<a href='#' onclick='noticeList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#noticeResultPagingNo").html(noticePagingTag); //페이징 적용
        },
        error : function(){
             alert('error - noticeList');
        }//error
    });//ajax
}// function end

/********************* faq *******************************************************************/
$(document).ready(faqList(1));
function faqList(pageNo) {
	$.ajax({
        url : "/admin/faqList",
        type : "get",
        data : {
        	showPage : pageNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var faqPageList = data.faqList; // model 처럼
        	
            var faqContentTag = "<table class='table'><tr><th>No</th><th>카테고리</th><th>제목</th><th>작성자</th><th>등록일</th></tr>";
            var faqPagingTag = "";

			$.each(faqPageList, function(key, value) {
				faqContentTag += "<tr>";
				faqContentTag += "<td><a href='/admin/faqOne?faqNo="+value.faqNo+"'class='btn btn-danger'>"+value.faqNo+"</a></td>";
				faqContentTag += "<td>"+value.faqCategory+"</td>";
				faqContentTag += "<td>"+value.faqTitle+"</td>";
				faqContentTag += "<td>"+value.faqadmId+"</td>";
				faqContentTag += "<td>"+value.faqUpdDate.substring(0,10)+"</td>";
				faqContentTag += "</tr>";                
             });
			faqContentTag += "</table>";
			$("#faqResultList").html(faqContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				faqPagingTag+="<a href='#' onclick='faqList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					faqPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					faqPagingTag+="<a href='#' onclick='faqList(" + i + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				faqPagingTag+="<a href='#' onclick='faqList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#faqResultPagingNo").html(faqPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - faqList');
        }//error
    });//ajax
}// function end

/********************* 1대1 문의 *******************************************************************/
let sortType = 1;
$(document).ready(otList(1,1 ));
function otList(pageNo, sortNo) {
	$.ajax({
        url : "/admin/adminQnList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var otPageList = data.otoList; // model 처럼
        	
            var otContentTag = "<table class='table'><tr><th>No</th><th>메인 카테고리</th><th>서브 카테고리</th><th>제목</th><th>작성자</th><th>답변 상태</th><th>등록일</th></tr>";
            var otPagingTag = "";

			$.each(otPageList, function(key, value) {
				otContentTag += "<tr>";
				otContentTag += "<td><a href='/admin/adminQnOne?otqNo="+value.otqNo+"'class='btn btn-danger'>"+value.otqNo+"</a></td>";
				otContentTag += "<td>"+value.otqMainCategory +"</td>";
				otContentTag += "<td>"+value.otqSubCategory  +"</td>";
				otContentTag += "<td>"+value.otqTitle+"</td>";
				otContentTag += "<td>"+value.otqmemId+"</td>";
				if(value.otqState === 1){otContentTag += "<td><p style='color:green;'><strong>답변완료</strong><p></td>";}else{otContentTag += "<td><p><strong>처리대기중</strong><p></td>";}
				otContentTag += "<td>"+value.otqRegiDate.substring(0,10)+"</td>";
				otContentTag += "</tr>";                
             });
			otContentTag += "</table>";
			$("#otoResultList").html(otContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				otPagingTag+="<a href='#' onclick='otList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					otPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					otPagingTag+="<a href='#' onclick='otList(" + i + ", " + sortType +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				otPagingTag+="<a href='#' onclick='otList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#otoResultPagingNo").html(otPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - otList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList(inputsort){
	sortType = inputsort;
	otList(1,sortType);
}

$("#noticeBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#noticeDiv').css('display', 'block');
	$("#faqBt").css('font-weight', 'normal');
	$("#onetooneBt").css('font-weight', 'normal');
	$('#faqDiv').css('display', 'none');
	$('#otoDiv').css('display', 'none');
});
$("#faqBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#faqDiv').css('display', 'block');
	$("#noticeBt").css('font-weight', 'normal');
	$("#onetooneBt").css('font-weight', 'normal');
	$('#noticeDiv').css('display', 'none');
	$('#otoDiv').css('display', 'none');
});
$("#onetooneBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#otoDiv').css('display', 'block');
	$("#noticeBt").css('font-weight', 'normal');
	$("#faqBt").css('font-weight', 'normal');
	$('#faqDiv').css('display', 'none');
	$('#noticeDiv').css('display', 'none');
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