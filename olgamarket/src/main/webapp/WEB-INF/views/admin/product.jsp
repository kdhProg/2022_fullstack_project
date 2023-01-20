<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
#pdListBt, #pdQnListBt{
	text-decoration: none;
}

</style>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='insertForm']");
			
			// 상품 등록
			$(".pdInsert_btn").on("click", function(){
				formObj.attr("action", "/admin/productInsertView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
		});
</script>
<body>
	<h1>상품 / 문의 관리</h1>
	<a href="#" onclick="pdList(1);return false;" id="pdListBt">상품 목록</a>
	<a href="#" onclick="pdQnList(1);return false;" id="pdQnListBt">상품 문의</a>
	
	<hr />

<!-- 상품 목록 -->	
<form name="insertForm" method="post" action="/admin/productInsertView">
	<div id="pdDiv" style="display : none;">
		<div id="pdResultList"></div>
		<div id="pdResultPagingNo"></div>
		<div>
			<button type="submit" class="pdInsert_btn">상품 등록</button>
		</div>
	</div>
</form>	
<!-- 상품 문의 -->	

	<div id="pdQnDiv" style="display : none;">
		<a href="#" onclick="sortList(1);return false;" id="sortBtn1">답변 대기</a>
		<a href="#" onclick="sortList(2);return false;" id="sortBtn2">답변 완료</a>
		<div id="pdQuiryResultList"></div>
		<div id="pdQuiryResultPagingNo"></div>
		
	</div>
		

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
        	
            var pdContentTag = "<table><tr><th>Id</th><th>썸네일 이미지</th><th>상품 이름</th><th>카테고리</th><th>브랜드</th><th>가격</th><th>할인</th><th>재고</th><th>판매량</th><th>등록일</th></tr>";
            var pdPagingTag = "";

			$.each(pdPageList, function(key, value) {
				pdContentTag += "<tr>";
				pdContentTag += "<td><a href='/admin/productOne?pdId="+value.pdId+"'>"+value.pdId+"</a></td>";
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
            
            var pdQuiryContentTag = "<table><tr><th>No</th><th>상품 아이디</th><th>제목</th><th>내용</th><th>답변 상태</th><th>작성자</th><th>등록일</th></tr>";
            var pdQuiryPagingTag = "";
            
			$.each(pdQnPageList, function(key, value) {
				pdQuiryContentTag += "<tr>";
				pdQuiryContentTag += "<td><a href='/admin/adminQuiryOne?iqNo="+value.iqNo+"'>"+value.iqNo+"</a></td>";
				pdQuiryContentTag += "<td>"+value.iqpdId+"</td>";
				pdQuiryContentTag += "<td>"+value.iqTitle+"</td>";
				pdQuiryContentTag += "<td>"+value.iqContent+"</td>";
				pdQuiryContentTag += "<td>"+value.iqState+"</td>";
				pdQuiryContentTag += "<td>"+value.iqmemId+"</td>";
				pdQuiryContentTag += "<td>"+value.iqRegiDate+"</td>";
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