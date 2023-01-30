<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
#noticeBt,#faqBt,#onetooneBt{
	text-decoration: none;
}
a {
	text-decoration: none;
}

</style>
<body>
<div class="container">
	<ul class="nav nav-pills">
	  <li class="nav-item">
	    <a href="#" onclick="noticeList(1);return false;" id="noticeBt" aria-current="page" class="nav-link"  href="#">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a href="#" onclick="faqList(1);return false;" id="faqBt" class="nav-link">FAQ</a>
	  </li>
	  <li class="nav-item">
		<a href="#" onclick="otList(1);return false;" id="onetooneBt" class="nav-link">1 : 1 문의</a>
	  </li>
	</ul>
	
	<!-- 공지사항 -->	
		<div id="noticeDiv" style="display : show;">
			<div id="noticeResultList"></div>
			<div id="noticeResultPagingNo"></div>
		</div>
	
	<!-- faq -->	
		<div id="faqDiv" style="display : none;">
		<a href="#" onclick="sortFaqList('defaultCate');return false;" id="categoryBt1" class="btn btn-light">전체</a>
		<a href="#" onclick="sortFaqList('주문/결제');return false;" id="categoryBt2" class="btn btn-light">주문/결제</a>
		<a href="#" onclick="sortFaqList('취소/교환/환불');return false;" id="categoryBt3" class="btn btn-light">취소/교환/환불</a>
		<a href="#" onclick="sortFaqList('포장');return false;" id="categoryBt4" class="btn btn-light">포장</a>
		<a href="#" onclick="sortFaqList('회원');return false;" id="categoryBt5" class="btn btn-light">회원</a>
			<div id="faqResultList"></div>
			<div id="faqResultPagingNo"></div>
		</div>
		
	<!-- 1대1 문의 -->	
	<form name="insertForm" method="post" action="/board/otqInsertView">	
		<div id="otoDiv" style="display : none;">
		<a href="#" onclick="sortList(1);return false;" id="sortBtn1" class="btn btn-light">답변 대기</a>
		<a href="#" onclick="sortList(2);return false;" id="sortBtn2" class="btn btn-light">답변 완료</a>
			<div id="otoResultList"></div>
			<div id="otoResultPagingNo"></div>
			<div>
				<button type="submit" class="btn btn-outline-danger">1:1 문의 등록</button>
			</div>
		</div>
	</form>
</div>			
</body>
<script>
/********************* 공지사항 *******************************************************************/
$(document).ready(noticeList(1));
function noticeList(pageNo) {
	$.ajax({
        url : "/board/noticeList",
        type : "get",
        data : {
        	showPage : pageNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var noticePageList = data.noticeList; // model 처럼
        	
            var noticeContentTag = "<table class='table'><tr><th>No</th><th>제목</th><th>작성자</th><th>등록일</th></tr>";
            var noticePagingTag = "";

			$.each(noticePageList, function(key, value) {
				noticeContentTag += "<tr>";
				noticeContentTag += "<td><a href='/board/noticeOne?ntNo="+value.ntNo+"'class='btn btn-danger'>"+value.ntNo+"</a></td>";
				noticeContentTag += "<td>"+value.ntTitle+"</td>";
				noticeContentTag += "<td>"+value.ntadmId+"</td>";
				noticeContentTag += "<td>"+value.ntUpdDate+"</td>";
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
var sortFaqType=1;
$(document).ready(faqList(1,1));
function faqList(pageNo, category) {
	$.ajax({
        url : "/board/faqList",
        type : "get",
        data : {
        	showPage : pageNo,
        	category : category
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var faqPageList = data.faqList; // model 처럼
        	
            var faqContentTag = "<table class='table'><tr><th>No</th><th>카테고리</th><th>제목</th><th>작성자</th><th>등록일</th></tr>";
            var faqPagingTag = "";

			$.each(faqPageList, function(key, value) {
				faqContentTag += "<tr>";
				faqContentTag += "<td><a href='/board/faqOne?faqNo="+value.faqNo+"'class='btn btn-danger'>"+value.faqNo+"</a></td>";
				faqContentTag += "<td>"+value.faqCategory+"</td>";
				faqContentTag += "<td>"+value.faqTitle+"</td>";
				faqContentTag += "<td>"+value.faqadmId+"</td>";
				faqContentTag += "<td>"+value.faqUpdDate+"</td>";
				faqContentTag += "</tr>";                
             });
			faqContentTag += "</table>";
			$("#faqResultList").html(faqContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				faqPagingTag+="<a href='#' onclick='faqList("+(pageInfo.firstPageNoOnPageList-1)+ ", \"" + category + "\");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					faqPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					faqPagingTag+="<a href='#' onclick='faqList(" + i + ", \"" + category + "\");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				faqPagingTag+="<a href='#' onclick='faqList("+(pageInfo.lastPageNoOnPageList+1)+ ", \"" + category + "\");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#faqResultPagingNo").html(faqPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - faqList');
        }//error
    });//ajax
}// function end

//정렬을 결정하는 함수임
function sortFaqList(inputsort){
	sortFaqType = inputsort;
	faqList(1, sortFaqType);
}

/********************* 1대1 문의 *******************************************************************/ 
var sortType = 1;
$(document).ready(otList(1), 1);
function otList(pageNo, sortNo) {
	$.ajax({
        url : "/board/boardQnList",
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
				otContentTag += "<td><a href='/board/boardQnOne?otqNo="+value.otqNo+"'class='btn btn-danger'>"+value.otqNo+"</a></td>";
				otContentTag += "<td>"+value.otqMainCategory +"</td>";
				otContentTag += "<td>"+value.otqSubCategory  +"</td>";
				otContentTag += "<td>"+value.otqTitle+"</td>";
				otContentTag += "<td>"+value.otqmemId+"</td>";
				otContentTag += "<td>"+value.otqState+"</td>";
				otContentTag += "<td>"+value.otqRegiDate+"</td>";
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

// faq 카테고리
$("#categoryBt1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt2").css('font-weight', 'normal');
	$("#categoryBt3").css('font-weight', 'normal');
	$("#categoryBt4").css('font-weight', 'normal');
	$("#categoryBt5").css('font-weight', 'normal');
});
$("#categoryBt2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt3").css('font-weight', 'normal');
	$("#categoryBt4").css('font-weight', 'normal');
	$("#categoryBt5").css('font-weight', 'normal');
	$("#categoryBt1").css('font-weight', 'normal');
});
$("#categoryBt3").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt4").css('font-weight', 'normal');
	$("#categoryBt5").css('font-weight', 'normal');
	$("#categoryBt1").css('font-weight', 'normal');
	$("#categoryBt2").css('font-weight', 'normal');
});
$("#categoryBt4").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt5").css('font-weight', 'normal');
	$("#categoryBt1").css('font-weight', 'normal');
	$("#categoryBt2").css('font-weight', 'normal');
	$("#categoryBt3").css('font-weight', 'normal');
});
$("#categoryBt5").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#categoryBt1").css('font-weight', 'normal');
	$("#categoryBt2").css('font-weight', 'normal');
	$("#categoryBt3").css('font-weight', 'normal');
	$("#categoryBt4").css('font-weight', 'normal');
});


</script>

</html>