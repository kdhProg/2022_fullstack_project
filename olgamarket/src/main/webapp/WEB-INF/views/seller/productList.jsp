<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Seller</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
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
.nav_homeBtn{
	border: none;
	background: transparent;
}

</style>
<body>
<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/seller/newPdQuiry">신상품 등록</a>
			<a class="navbar-brand" href="/seller/product">내 상품 문의</a>
			<a class="navbar-brand" href="">통계</a>
			<a class="navbar-brand" href="/seller/sellerMain"><svg class="nav_homeBtn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg></a>
		</div>
	</nav>

	<hr />
<!-- 등록된 상품 목록 -->	
	<div id="pdDiv" style="display : show;">
	<span class="sessionBrandName">${seller.getSelstlBrandName()}</span>
	<span class="sessionpdSelId">${seller.getSelId()}</span>
		<div id="pdResultList"></div>
		<div id="pdResultPagingNo"></div>
	</div>
</div>
</body>
<script>
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
        console.log(pdPageList); 	
        console.log(pageInfo); 	
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
				pdContentTag += "<td>"+value.pdUpdDate.substring(0,10)+"</td>";
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
</script>
</html>