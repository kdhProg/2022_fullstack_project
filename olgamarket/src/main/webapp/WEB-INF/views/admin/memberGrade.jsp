<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<!-- 회원 등급 관리 -->	
	<h1>회원 등급</h1>
	<p>전월 기준</p>
	<p>500,000원 이상 VVIP</p> <p>500,000원 미만 200,000원 이상 VIP</p> <p>200,000원 미만 일반</p>

	<div id="memDiv" style="display : block;">
		<a href="#" onclick="sortList(1);return false;" id="sortBtn1">20만원 미만</a>
		<a href="#" onclick="sortList(2);return false;" id="sortBtn2">20~50만원</a>
		<a href="#" onclick="sortList(3);return false;" id="sortBtn3">50만원 이상</a>
		<div id="memResultList"></div>
		<div id="memResultPagingNo"></div>
		
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
            
            var memContentTag = "<table><tr><th>No</th><th>회원 아이디</th><th>총 금액</th></tr>";
            var memPagingTag = "";
            
			$.each(memPageList, function(key, value) {
				memContentTag += "<tr>";
				memContentTag += "<td>"+value.plNo+"</td>";
				memContentTag += "<td><a href='/admin/memOne?memId="+value.plmemId+"'>"+value.plmemId+"</a></td>";
				memContentTag += "<td>"+value.plTotalPrice+"</td>";
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