<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
#selListBt, #sqListBt{
	text-decoration: none;
}

</style>

<body>
	<h1>판매자 / 문의 관리</h1>
	<a href="#" onclick="npqList(1);return false;" id="npqListBt">신상품 등록 문의</a>
	<a href="#" onclick="sqList(1);return false;" id="sqListBt">등록된 상품 문의</a>
	
	<hr />

<!-- 신상품 등록 문의 -->
<form name="insertForm" method="post" action="/seller/newPdQuiryInsertView?selId=${sessionScope.htsession.selId}">
	
	<div id="npqDiv" style="display : none;">
		<a href="#" onclick="sortList1(1);return false;" id="sortBtn1">답변 대기</a>
		<a href="#" onclick="sortList1(2);return false;" id="sortBtn2">답변 완료</a>
		<div id="newPdQuiryResultList"></div>
		<div id="newPdQuiryResultPagingNo"></div>
		<div>
			<button type="submit" class="npqInsert_btn">등록 문의하기</button>
		</div>
	</div>
</form>	

<!-- 등록된 상품 문의 -->	
<form name="insertForm" method="post" action="/seller/selQuiryInsertView ">
	<div id="sqDiv" style="display : none;">
		<a href="#" onclick="sortList(1);return false;" id="sortBtn1">답변 대기</a>
		<a href="#" onclick="sortList(2);return false;" id="sortBtn2">답변 완료</a>
		<div id="sqResultList"></div>
		<div id="sqResultPagingNo"></div>
		<div>
			<button type="submit" class="sqInsert_btn">등록 문의하기</button>
		</div>
	</div>
</form>		
</body>
<script>
/********************* 신상품 등록 문의 목록 *******************************************************************/
var sortType1 = 1; 
$(document).ready(npqList(1), 1);
function npqList(pageNo, sortNo) {
	$.ajax({
        url : "/seller/newPdQuiryList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var npqPageList = data.npqList; // model 처럼
        	
            var npqContentTag = "<table><tr><th>No</th><th>판매자 Id</th><th>제목</th><th>내용</th><th>이미지</th><th>답변 상태</th><th>등록일</th></tr>";
            var npqPagingTag = "";
			
			$.each(npqPageList, function(key, value) {
				npqContentTag += "<tr>";
				npqContentTag += "<td><a href='/seller/newPdQuiryOne?npqNo="+value.npqNo+"'>"+value.npqNo+"</a></td>";
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
				npqPagingTag+="<a href='#' onclick='npqList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType1 +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					npqPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					npqPagingTag+="<a href='#' onclick='npqList(" + i + ", " + sortType1 +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				npqPagingTag+="<a href='#' onclick='npqList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType1 +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
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
	npqList(1,sortType1);
}
/********************* 판매자 문의 *******************************************************************/ 
var sortType2 = 1;
$(document).ready(sqList(1), 1);
function sqList(pageNo, sortNo) {
	$.ajax({
        url : "/seller/selQuiryList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var selQuiryPageList = data.sqList; // model 처럼
            
            var selQuiryContentTag = "<table><tr><th>No</th><th>상품 아이디</th><th>제목</th><th>내용</th><th>답변 상태</th><th>작성자</th><th>등록일</th></tr>";
            var selQuiryPagingTag = "";
            
			$.each(selQuiryPageList, function(key, value) {
				selQuiryContentTag += "<tr>";
				selQuiryContentTag += "<td><a href='/seller/selQuiryOne?sqNo="+value.sqNo+"'>"+value.sqNo+"</a></td>";
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
				selQuiryPagingTag+="<a href='#' onclick='sqList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType2 +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					selQuiryPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					selQuiryPagingTag+="<a href='#' onclick='sqList(" + i + ", " + sortType2 +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				selQuiryPagingTag+="<a href='#' onclick='sqList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType2 +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#sqResultPagingNo").html(selQuiryPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - sqList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList(inputsort){
	sortType2 = inputsort;
	sqList(1,sortType2);
}

$("#npqListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#npqDiv').css('display', 'block');
	$("#sqListBt").css('font-weight', 'normal');
	$('#sqDiv').css('display', 'none');
});

$("#sqListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#sqDiv').css('display', 'block');
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