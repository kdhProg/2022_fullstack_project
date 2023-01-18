<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
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
	<a href="#" onclick="selList(1);return false;" id="selListBt">판매자 목록</a>
	<a href="#" onclick="sqList(1);return false;" id="sqListBt">판매자 문의</a>
	
	<hr />

<!-- 판매자 목록 -->	
	<div id="selDiv" style="display : none;">
		<div id="selResultList"></div>
		<div id="selResultPagingNo"></div>
	</div>

<!-- 판매자 문의 -->	
	<div id="sqDiv" style="display : none;">
		<div id="sqResultList"></div>
		<div id="sqResultPagingNo"></div>
		
	</div>
		

</body>
<script>
/********************* 판매자 목록 *******************************************************************/
$(document).ready(selList(1));
function selList(pageNo) {
	$.ajax({
        url : "/admin/sellerList",
        type : "get",
        data : {
        	showPage : pageNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var selPageList = data.selList; // model 처럼
        	
            var selContentTag = "<table><tr><th>Id</th><th>판매자 이름</th><th>상호명</th><th>이메일</th><th>전화 번호</th><th>마켓 고유 번호</th><th>사업자 등록 번호</th><th>등록일</th></tr>";
            var selPagingTag = "";
			
			$.each(selPageList, function(key, value) {
				selContentTag += "<tr>";
				selContentTag += "<td><a href='/admin/sellerOne?selId="+value.selId+"&selstlBrandName="+value.selstlBrandName+"'>"+value.selId+"</a></td>";
				selContentTag += "<td>"+value.selName+"</td>";
				selContentTag += "<td>"+value.selstlBrandName+"</td>";
				selContentTag += "<td>"+value.selEmail+"</td>";
				selContentTag += "<td>"+value.selPhone+"</td>";
				selContentTag += "<td>"+value.selMarketUniqueNo+"</td>";
				selContentTag += "<td>"+value.selSelRegiNo+"</td>";
				selContentTag += "<td>"+value.selUpdDate+"</td>";
				selContentTag += "</tr>";                
             });
			selContentTag += "</table>";
			$("#selResultList").html(selContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				selPagingTag+="<a href='#' onclick='selList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					selPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					selPagingTag+="<a href='#' onclick='selList(" + i + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				selPagingTag+="<a href='#' onclick='selList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#selResultPagingNo").html(selPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - selList');
        }//error
    });//ajax
}// function end

/********************* 판매자 문의 *******************************************************************/ 
$(document).ready(sqList(1));
function sqList(pageNo) {
	$.ajax({
        url : "/admin/selQuiryList",
        type : "get",
        data : {
        	showPage : pageNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var selQuiryPageList = data.sqList; // model 처럼
            
            var selQuiryContentTag = "<table><tr><th>No</th><th>상품 아이디</th><th>제목</th><th>내용</th><th>답변 상태</th><th>작성자</th><th>등록일</th></tr>";
            var selQuiryPagingTag = "";
            
			$.each(selQuiryPageList, function(key, value) {
				selQuiryContentTag += "<tr>";
				selQuiryContentTag += "<td><a href='/admin/selQuiryOne?sqNo="+value.sqNo+"'>"+value.sqNo+"</a></td>";
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
				selQuiryPagingTag+="<a href='#' onclick='sqList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					selQuiryPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					selQuiryPagingTag+="<a href='#' onclick='sqList(" + i + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				selQuiryPagingTag+="<a href='#' onclick='sqList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#sqResultPagingNo").html(selQuiryPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - sqList');
        }//error
    });//ajax
}// function end

$("#selListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#selDiv').css('display', 'block');
	$("#sqListBt").css('font-weight', 'normal');
	$('#sqDiv').css('display', 'none');
});

$("#sqListBt").on("click", function() {
	$(this).css('font-weight', 'bold');
	$('#sqDiv').css('display', 'block');
	$("#selListBt").css('font-weight', 'normal');
	$('#selDiv').css('display', 'none');
});

</script>
</html>