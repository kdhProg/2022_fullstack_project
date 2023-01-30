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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
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
			<a class="navbar-brand" href="/admin/storeList">통계</a>
		</div>
	</nav>
	<br />
<!-- 회원 등급 관리 -->	
	
	<h3>전월 기준</h3>
	<p>VVIP : 500,000원 이상</p> <p>VIP :500,000원 미만 200,000원 이상</p> <p>Friend : 200,000원 미만</p>

	<div id="memDiv" style="display : block;">
		<a href="#" onclick="sortList(1);return false;" id="sortBtn1" class="btn btn-primary">20만원 미만</a>
		<a href="#" onclick="sortList(2);return false;" id="sortBtn2" class="btn btn-primary">20~50만원</a>
		<a href="#" onclick="sortList(3);return false;" id="sortBtn3" class="btn btn-primary">50만원 이상</a>
		<div id="memResultList"></div>
		<div id="memResultPagingNo"></div>
		
	</div>
</div>	
</body>
<script>
let sortType = 1;
$(document).ready(memList(1, 1));
function memList(pageNo, sortNo) {
	$.ajax({
        url : "/admin/memberGradeList",
        type : "get",
        data : {
        	showPage : pageNo,
        	sort : sortNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var memPageList = data.memList; // model 처럼
            
            var memContentTag = "<table class='table'><tr><th>회원 아이디</th><th>회원 등급</th></tr>";
            var memPagingTag = "";
            
			$.each(memPageList, function(key, value) {
				memContentTag += "<tr>";
				memContentTag += "<td><a href='/admin/memOne?memId="+value.memId+"'class='btn btn-danger'>"+value.memId+"</a></td>";
				memContentTag += "<td>"+value.memGrade+"</td>";
				memContentTag += "</tr>";                
             });
			memContentTag += "</table>";
			$("#memResultList").html(memContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				memPagingTag+="<a href='#' onclick='memList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					memPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					memPagingTag+="<a href='#' onclick='memList(" + i + ", " + sortType +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				memPagingTag+="<a href='#' onclick='memList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#memResultPagingNo").html(memPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - memList');
        }//error
    });//ajax
}// function end

//정렬함수
function sortList(inputsort){
	sortType = inputsort;
	memList(1,sortType);
}

//정렬 A태그 디자인 관련
$("#sortBtn1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn2").css('font-weight', 'normal');
	$("#sortBtn3").css('font-weight', 'normal');
});
$("#sortBtn2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn3").css('font-weight', 'normal');
	$("#sortBtn1").css('font-weight', 'normal');
});
$("#sortBtn3").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
	$("#sortBtn2").css('font-weight', 'normal');
});
</script>
</html>