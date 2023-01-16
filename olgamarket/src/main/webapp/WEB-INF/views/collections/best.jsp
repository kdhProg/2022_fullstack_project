<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
#CateButton{
	background-color: white;
}
#sortBtn1,#sortBtn2,#sortBtn3,#sortBtn4{
	text-decoration: none;
}
#sortBtn1{
	font-weight: bold;
}
</style>
<body>
	<h1>베스트 페이지임</h1>
	<p>판매량5000개 이상임</p>
	<a href="#" onclick="sortList(1);return false;" id="sortBtn1">등록순</a>
	<a href="#" onclick="sortList(2);return false;" id="sortBtn2">판매량순</a>
	<a href="#" onclick="sortList(3);return false;" id="sortBtn3">가격-오름차순</a>
	<a href="#" onclick="sortList(4);return false;" id="sortBtn4">가격-내림차순</a>
	<hr />
	<div id="bestPdResultList"></div>
	<div id="bestPdResultPagingNo"></div>
	<div id="bestPdCateList"></div>
		
		
</body>
<script>
var cateLength = 0;
$(document).ready(bestPdList(1,1,finalCateList));
//초기 브랜드 리스트
$(document).ready(function(){
	$.ajax({
        url : "/collections/bestProductList",
        type : "get",
        success : function(data){
        	
        	var cateList = data.cateList;
			var newPdcateList = "";
			cateLength = cateList.length;
			$.each(cateList, function(key, value) {
				newPdcateList += "<input type='button' id='CateButton' name='CateButton"+key+"' value='"+value+"' class='btnCateList'/>";
             });
			$("#bestPdCateList").html(newPdcateList); //메인 컨텐츠 적용
        },
        error : function(){
             alert('error - getcateList');
        }//error
    });//ajax	
});

var finalCateList=[];
var sortType=1;  //기본값

var cateBtnList = {};

for (var i = 0; i < cateLength; i++){ 
	cateBtnList[`btnToggle`+i] = true;
}

for(let i =0 ; i< cateLength ;i++){
	$(function(){

		cateBtnList[`btnToggle`+i] = true;
	    $("input:button[name=CateButton"+i+"]").on('click',function(){
	    	if(cateBtnList[`btnToggle`+i]){
	    		cateBtnList[`btnToggle`+i]=false;
	    		$(this).css('background-color','purple');
	    		$(this).css('color','white');
	    		var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
	    		finalCateList.push(kind);
	    		newPdList(pageNo,sortType,finalCateList);
	    	}else{
	    		cateBtnList[`btnToggle`+i]=true;
	    		$(this).css('background-color','white');
	    		$(this).css('color','black');
	    		var kind = $(this).val();
	    		for(let j = 0; j < finalCateList.length; j++) {
	    			  if(finalCateList[j] === kind)  {
	    				  finalCateList.splice(j, finalCateList[j].length);
	    			    j--;
	    			  }
	    		}
	    		newPdList(pageNo,sortNo,finalCateList);
				
	    	}
	    });//button click
	    
	}); 
	
}


function bestPdList(pageNo,sortNo,finalCateList) {
	$.ajax({
        url : "/collections/bestProductList",
        type : "get",
        data : {
        	showPage : pageNo,
			sort : sortNo,
            "finalCateList":finalCateList
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var bestPdPageList = data.ProdList;
        	
            var bestPdContentTag = "<table><tr><th>ID</th><th>이름</th><th>메인카테고리</th><th>판매량</th><th>가격</th><th>등록일</th></tr>";
            var bestPdPagingTag = "";

			$.each(bestPdPageList, function(key, value) {
				bestPdContentTag += "<tr>";
				bestPdContentTag += "<td>"+value.pdId+"</td>";
				bestPdContentTag += "<td><a href='/goods/detailView?pdId="+value.pdId+"'>"+value.pdName+"</a></td>";
				bestPdContentTag += "<td>"+value.pdMainCategory+"</td>";
				bestPdContentTag += "<td>"+value.pdSalesVolume+"</td>";
				bestPdContentTag += "<td>"+value.pdPrice+"</td>";
				bestPdContentTag += "<td>"+value.pdRegiDate+"</td>";
				bestPdContentTag += "</tr>";                
             });
			bestPdContentTag += "</table>";
			$("#bestPdResultList").html(bestPdContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				bestPdPagingTag+="<a href='#' onclick='bestPdList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +", "+ finalCateList +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					bestPdPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					bestPdPagingTag+="<a href='#' onclick='bestPdList(" + i + ", " + sortType +", "+ finalCateList +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				bestPdPagingTag+="<a href='#' onclick='bestPdList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +", "+ finalCateList +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#bestPdResultPagingNo").html(bestPdPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - bestPdList');
        }//error
    });//ajax
}// function end

// 정렬함수
function sortList(inputsort){
	sortType = inputsort;
	bestPdList(1,sortType,finalCateList);
}

//정렬 A태그 디자인 관련
$("#sortBtn1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn2").css('font-weight', 'normal');
	$("#sortBtn3").css('font-weight', 'normal');
	$("#sortBtn4").css('font-weight', 'normal');
});
$("#sortBtn2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
	$("#sortBtn3").css('font-weight', 'normal');
	$("#sortBtn4").css('font-weight', 'normal');
});
$("#sortBtn3").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
	$("#sortBtn2").css('font-weight', 'normal');
	$("#sortBtn4").css('font-weight', 'normal');
});
$("#sortBtn4").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
	$("#sortBtn2").css('font-weight', 'normal');
	$("#sortBtn3").css('font-weight', 'normal');
});


</script>
</html>