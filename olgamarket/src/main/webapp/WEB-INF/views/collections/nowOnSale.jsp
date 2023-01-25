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
#CateButton,#BrandButton,#PriceButton{
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
	<h1>할인/특가</h1>
	<p>할인하는 모든 상품</p>
	<a href="#" onclick="sortList(1);return false;" id="sortBtn1">등록순</a>
	<a href="#" onclick="sortList(2);return false;" id="sortBtn2">판매량순</a>
	<a href="#" onclick="sortList(3);return false;" id="sortBtn3">가격-오름차순</a>
	<a href="#" onclick="sortList(4);return false;" id="sortBtn4">가격-내림차순</a>
	<hr />
	<div id="onSalePdResultList"></div>
	<div id="onSalePdResultPagingNo"></div>
	<div id="onSalePdCateList"></div>
	<div id="onSalePdBrandList"></div>
	<div id="onSalePdPriceList"></div>
		
		
</body>
<script>
var sortType=1;  //정렬 기본값

var cateLength; // 카테고리 - 배열길이 전역변수
var finalCateList=[];  // 카테고리 - 컨트롤러로 전달되는 최종배열
var cateBtnList = {}; // 카테고리 - 동적변수가 담기는 배열

var brandLength; // 브랜드 - 배열길이 전역변수
var finalBrandList=[];  // 브랜드 - 컨트롤러로 전달되는 최종배열
var brandBtnList = {}; // 브랜드 - 동적변수가 담기는 배열

var priceLength; // 가격 - 배열길이 전역변수
var finalpriceList=[];  // 가격 - 컨트롤러로 전달되는 최종배열
var priceBtnList = {}; // 가격 - 동적변수가 담기는 배열


$(document).ready(onSalePdList(1,1,finalCateList,finalBrandList,finalpriceList));
//초기 브랜드 리스트
$(document).ready(function(){
	$.ajax({
        url : "/collections/nowOnSaleProductList",
        type : "get",
        success : function(data){
        	/* =========== 카테고리 만들기 시작 ===========*/
        	var cateList = data.cateList;  //카테고리 리스트
			var onSalePdcateList = "";  //태그에 적용할 문자열 만들기
			cateLength = cateList.length;
			$.each(cateList, function(key, value) {
				onSalePdcateList += "<input type='button' id='CateButton' name='CateButton"+key+"' value='"+value+"' class='btnCateList'/>";
             });
			$("#onSalePdCateList").html(onSalePdcateList); //메인 컨텐츠 적용
			
			// 카테고리 버튼 동적변수 생성
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
				    		onSalePdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
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
				    		onSalePdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
							
				    	}
				    });//button click
				    
				}); 
			}// for문 종료
			/* =========== 카테고리 끝 ===========*/
			/* =========== 브랜드 시작 ===========*/
			var brandList = data.brandList;  //카테고리 리스트
			var onSaleBrandList = "";  //태그에 적용할 문자열 만들기
			brandLength = brandList.length;
			$.each(brandList, function(key, value) {
				onSaleBrandList += "<input type='button' id='BrandButton' name='BrandButton"+key+"' value='"+value+"' class='btnBrandList'/>";
             });
			$("#onSalePdBrandList").html(onSaleBrandList); //메인 컨텐츠 적용
			
			// 카테고리 버튼 동적변수 생성
			for (var i = 0; i < brandLength; i++){ 
				brandBtnList[`brBtnToggle`+i] = true;
			}
			
			//
			for(let i =0 ; i< brandLength ;i++){
				// 동적 함수 생성
				$(function(){
					brandBtnList[`brBtnToggle`+i] = true;
				    $("input:button[name=BrandButton"+i+"]").on('click',function(){
				    	if(brandBtnList[`brBtnToggle`+i]){
				    		brandBtnList[`brBtnToggle`+i]=false;
				    		$(this).css('background-color','rgb(234, 44, 0)');
				    		$(this).css('color','white');
				    		var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
				    		finalBrandList.push(kind);
				    		onSalePdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
				    	}else{
				    		brandBtnList[`brBtnToggle`+i]=true;
				    		$(this).css('background-color','white');
				    		$(this).css('color','black');
				    		var kind = $(this).val();
				    		for(let j = 0; j < finalBrandList.length; j++) {
				    			  if(finalBrandList[j] === kind)  {
				    				  finalBrandList.splice(j, 1);
				    			    j--;
				    			  }
				    		}
				    		onSalePdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
							
				    	}
				    });//button click
				    
				}); 
			}// for문 종료
			/* =========== 브랜드 끝 ===========*/
			/* =========== 가격 만들기 시작 ===========*/
			priceLength = 3; // 가격 구간이 3개이므로 3고정
 			var onSalePdpriceList = "";  //태그에 적용할 문자열 만들기
 			onSalePdpriceList += "<input type='button' id='PriceButton' name='PriceButton0' value='1' class='btnCateList'/>"; //10000이하
 			onSalePdpriceList += "<input type='button' id='PriceButton' name='PriceButton1' value='2' class='btnCateList'/>"; //10000초과~30000이하
 			onSalePdpriceList += "<input type='button' id='PriceButton' name='PriceButton2' value='3' class='btnCateList'/>"; //30000이상
			$("#onSalePdPriceList").html(onSalePdpriceList); //메인 컨텐츠 적용
			
			// 카테고리 버튼 동적변수 생성
			for (var i = 0; i < priceLength; i++){ 
				priceBtnList[`pricebtnToggle`+i] = true;
			}
			
			//
			for(let i =0 ; i< priceLength ;i++){
				// 동적 함수 생성
				$(function(){
					priceBtnList[`pricebtnToggle`+i] = true;
				    $("input:button[name=PriceButton"+i+"]").on('click',function(){
				    	if(priceBtnList[`pricebtnToggle`+i]){
				    		priceBtnList[`pricebtnToggle`+i]=false;
				    		$(this).css('background-color','rgb(234, 44, 0)');
				    		$(this).css('color','white');
				    		var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
				    		finalpriceList.push(kind);
				    		onSalePdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
				    	}else{
				    		priceBtnList[`pricebtnToggle`+i]=true;
				    		$(this).css('background-color','white');
				    		$(this).css('color','black');
				    		var kind = $(this).val();
				    		for(let j = 0; j < finalpriceList.length; j++) {
				    			  if(finalpriceList[j] === kind)  {
				    				  finalpriceList.splice(j, 1);
				    			    j--;
				    			  }
				    		}
				    		onSalePdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
							
				    	}
				    });//button click
				    
				}); 
			}// for문 종료
			/* =========== 가격 끝 ===========*/
        },//success 종료
        error : function(){
             alert('error - getcateList');
        }//error 종료
    });//ajax	종료
	
});




function onSalePdList(pageNo,sortNo,finalCateList,finalBrandList,finalpriceList) {
	$.ajax({
        url : "/collections/nowOnSaleProductList",
        type : "get",
        data : {
        	showPage : pageNo,
			sort : sortNo,
            "finalCateList":finalCateList,
            "finalBrandList":finalBrandList,
            "finalpriceList":finalpriceList
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var onSalePdPageList = data.ProdList;
            
            /*  ========== 카테고리 시작 ========== */
            var activeCateList = data.activeCateList; // 카테고리 - 가변카테고리명을 컨트롤러에서 받음(배열이 아니라 json객체임)
            var activeCateListUsable;  // 카테고리 - json객체를 배열로 바꿔 담을 객체 선언 
            var cateString = ""; // 카테고리 - 최종적으로 문자열로 배열만들어 적용할꺼임
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
            }else{
            	// 비어있으면 그냥 배열
            	cateString='[]';
            }
            /*  ========== 카테고리 끝 ========== */
            /*  ========== 브랜드 시작 ========== */
            var activeBrandList = data.activeBrandList; // 브랜드 - 가변카테고리명을 컨트롤러에서 받음(배열이 아니라 json객체임)
            var activeBrandListUsable;  // 브랜드 - json객체를 배열로 바꿔 담을 객체 선언 
            var brandString = ""; // 브랜드 - 최종적으로 문자열로 배열만들어 적용할꺼임
            if(activeBrandList !== null){
            	// json이 null(즉 아무것도 없으면) Object.values 함수가 작동하지않으므로 if문으로 null여부 검사
            	activeBrandListUsable = Object.values(activeBrandList);
            	brandString += '[';
                for(let z=0;z<activeBrandListUsable.length;z++){
                	brandString += '"';
                	brandString += activeBrandListUsable[z];
                	brandString += '"';
                	if(z != (activeBrandListUsable.length-1)){
                		brandString += ',';
                	}
                }
                brandString += ']';
            }else{
            	// 비어있으면 그냥 배열
            	brandString='[]';
            }
            /*  ========== 브랜드 끝 ========== */
            /*  ========== 가격 시작 ========== */
            var activePriceList = data.activePriceList; // 가격 - 가변카테고리명을 컨트롤러에서 받음(배열이 아니라 json객체임)
            var activePriceListUsable;  // 가격 - json객체를 배열로 바꿔 담을 객체 선언 
            var priceString = ""; // 가격 - 최종적으로 문자열로 배열만들어 적용할꺼임
            if(activePriceList !== null){
            	// json이 null(즉 아무것도 없으면) Object.values 함수가 작동하지않으므로 if문으로 null여부 검사
            	activePriceListUsable = Object.values(activePriceList);
            	priceString += '[';
                for(let z=0;z<activePriceListUsable.length;z++){
                	priceString += '"';
                	priceString += activePriceListUsable[z];
                	priceString += '"';
                	if(z != (activePriceListUsable.length-1)){
                		priceString += ',';
                	}
                }
                priceString += ']';
            }else{
            	// 비어있으면 그냥 배열
            	priceString='[]';
            }
            /*  ========== 가격 끝 ========== */
        	
            var onSalePdContentTag = "<table><tr><th>ID</th><th>이름</th><th>판매점</th><th>메인카테고리</th><th>판매량</th><th>가격</th><th>할인</th><th>등록일</th></tr>";
            var onSalePdPagingTag = "";

			$.each(onSalePdPageList, function(key, value) {
				onSalePdContentTag += "<tr>";
				onSalePdContentTag += "<td>"+value.pdId+"</td>";
				onSalePdContentTag += "<td><a href='/goods/detailView?pdId="+value.pdId+"'>"+value.pdName+"</a></td>";
				onSalePdContentTag += "<td>"+value.pdstlBrandName+"</td>";
				onSalePdContentTag += "<td>"+value.pdMainCategory+"</td>";
				onSalePdContentTag += "<td>"+value.pdSalesVolume+"</td>";
				onSalePdContentTag += "<td>"+value.pdPrice+"</td>";
				onSalePdContentTag += "<td>"+value.pdSale+"</td>";
				onSalePdContentTag += "<td>"+value.pdRegiDate+"</td>";
				onSalePdContentTag += "</tr>";                
             });
			onSalePdContentTag += "</table>";
			$("#onSalePdResultList").html(onSalePdContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				onSalePdPagingTag+="<a href='#' onclick='onSalePdList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +", "+ cateString +", "+ brandString +", "+ priceString +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					onSalePdPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					onSalePdPagingTag+="<a href='#' onclick='onSalePdList(" + i + ", " + sortType +", "+ cateString +", "+ brandString +", "+ priceString +");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				onSalePdPagingTag+="<a href='#' onclick='onSalePdList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +", "+ cateString +", "+ brandString +", "+ priceString +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#onSalePdResultPagingNo").html(onSalePdPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - onSalePdList');
        }//error
    });//ajax
}// function end

// 정렬함수
function sortList(inputsort){
	sortType = inputsort;
	onSalePdList(1,sortType,finalCateList,finalBrandList,finalpriceList);
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