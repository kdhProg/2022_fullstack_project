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
	<h1>신상품 페이지임</h1>
	<a href="#" onclick="sortList(1);return false;" id="sortBtn1">등록순</a>
	<a href="#" onclick="sortList(2);return false;" id="sortBtn2">판매량순</a>
	<a href="#" onclick="sortList(3);return false;" id="sortBtn3">가격-오름차순</a>
	<a href="#" onclick="sortList(4);return false;" id="sortBtn4">가격-내림차순</a>
	<hr />
	<div id="newPdResultList"></div>
	<div id="newPdResultPagingNo"></div>
	<div id="newPdCateList"></div>
</body>
<script>
var cateLength;
var finalCateList=[];  // 컨트롤러로 전달되는 최종배열
var sortType=1;  //기본값
var cateBtnList = {}; // 카테고리 동적변수가 담기는 배열

$(document).ready(newPdList(1,1,finalCateList));
//초기 브랜드 리스트
$(document).ready(function(){
	$.ajax({
        url : "/collections/newProductCate",
        type : "get",
        success : function(data){
        	
        	var cateList = data.cateList;
			var newPdcateList = "";
			cateLength = cateList.length;
			$.each(cateList, function(key, value) {
				newPdcateList += "<input type='button' id='CateButton' name='CateButton"+key+"' value='"+value+"' class='btnCateList'/>";
             });
			$("#newPdCateList").html(newPdcateList); //메인 컨텐츠 적용
			
			// 버튼 동적변수 생성
			for (var i = 0; i < cateLength; i++){ 
				cateBtnList[`btnToggle`+i] = true;
			}
			
			//
			for(let i =0 ; i< cateLength ;i++){
				// 동적 함수 생성
				$(function(){
					cateBtnList[`btnToggle`+i] = true;
				    $("input:button[name=CateButton"+i+"]").on('click',function(){
				    	if(cateBtnList[`btnToggle`+i]){
				    		cateBtnList[`btnToggle`+i]=false;
				    		$(this).css('background-color','rgb(234, 44, 0)');
				    		$(this).css('color','white');
				    		var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
				    		finalCateList.push(kind);
				    		newPdList(1,sortType,finalCateList);
				    	}else{
				    		cateBtnList[`btnToggle`+i]=true;
				    		$(this).css('background-color','white');
				    		$(this).css('color','black');
				    		var kind = $(this).val();
				    		for(let j = 0; j < finalCateList.length; j++) {
				    			  if(finalCateList[j] === kind)  {
				    				  finalCateList.splice(j, 1);
				    			    j--;
				    			  }
				    		}
				    		newPdList(1,sortType,finalCateList);
							
				    	}
				    });//button click
				    
				}); 
			}// for문 종료
        },//success 종료
        error : function(){
             alert('error - getcateList');
        }//error 종료
    });//ajax	종료
	
});




function newPdList(pageNo,sortNo,finalCateList) {
	$.ajax({
        url : "/collections/newProductCate",
        type : "get",
        data : {
        	showPage : pageNo,
			sort : sortNo,
            "finalCateList":finalCateList
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var newPdPageList = data.ProdList;
            var activeCateList = data.activeCateList; //가변브랜드명을 컨트롤러에서 받음(배열이 아니라 json객체임)
            var activeCateListUsable;  // json객체를 배열로 바꿔 담을 객체 선언 
            var cateString = ""; //최종적으로 문자열로 배열만들어 적용할꺼임
            if(activeCateList !== null){
            	// json이 null(즉 아무것도 없으면) Object.values 함수가 작동하지않으므로 if문으로 null여부 검사
            	activeCateListUsable = Object.values(activeCateList);
            	cateString += '[';
                for(let k=0;k<activeCateListUsable.length;k++){
                	cateString += '"';
                	cateString += activeCateListUsable[k];
                	cateString += '"';
                	if(k != (activeCateListUsable.length-1)){
                		cateString += ',';
                	}
                }
                cateString += ']';
            }
        	
            var newPdContentTag = "<table><tr><th>ID</th><th>이름</th><th>메인카테고리</th><th>판매량</th><th>가격</th><th>등록일</th></tr>";
            var newPdPagingTag = "";

			$.each(newPdPageList, function(key, value) {
				newPdContentTag += "<tr>";
				newPdContentTag += "<td>"+value.pdId+"</td>";
				newPdContentTag += "<td><a href='/goods/detailView?pdId="+value.pdId+"'>"+value.pdName+"</a></td>";
				newPdContentTag += "<td>"+value.pdMainCategory+"</td>";
				newPdContentTag += "<td>"+value.pdSalesVolume+"</td>";
				newPdContentTag += "<td>"+value.pdPrice+"</td>";
				newPdContentTag += "<td>"+value.pdRegiDate+"</td>";
				newPdContentTag += "</tr>";                
             });
			newPdContentTag += "</table>";
			$("#newPdResultList").html(newPdContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				newPdPagingTag+="<a href='#' onclick='newPdList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +", "+ cateString +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					newPdPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					newPdPagingTag+="<a href='#' onclick='newPdList(" + i + ", " + sortType +", "+ cateString +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				newPdPagingTag+="<a href='#' onclick='newPdList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +", "+ cateString +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#newPdResultPagingNo").html(newPdPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - newPdList');
        }//error
    });//ajax
}// function end

// 정렬함수
function sortList(inputsort){
	sortType = inputsort;
	newPdList(1,sortType,finalCateList);
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