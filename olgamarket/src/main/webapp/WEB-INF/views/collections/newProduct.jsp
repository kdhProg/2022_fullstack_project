<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#CateButton{
	background-color: white;
}
</style>
<body>
	<h1>신상품 페이지임</h1>
	<fieldset>
	<legend>정렬탭</legend>
	<a href="/collections/newProduct?sort=1">등록순</a>
	<a href="/collections/newProduct?sort=2">판매량순</a>
	<a href="/collections/newProduct?sort=3">가격-오름차순</a>
	<a href="/collections/newProduct?sort=4">가격-내림차순</a>
	</fieldset>
	<hr />
	<h1>총 ${pageInfo.totalRecordCount}건</h1>
	<table>
		  <tr>
		     <th>ID</th>
		     <th>이름</th>
		     <th>메인카테고리</th>
		     <th>판매량</th>
		     <th>가격</th>
		     <th>등록일</th>
		  </tr>
		<c:forEach var="list" items="${ProdList}">
		     <tr>
		     	<td>${list.getPdId()}</td>
				<td>${list.getPdName()}</td>
			    <td>${list.getPdMainCategory()}</td>
			    <td>${list.getPdSalesVolume()}</td>
			    <td>${list.getPdPrice()}</td>
			    <td>${list.getPdRegiDate()}</td>
			</tr>
		</c:forEach>
		</table>
		<!-- 페이징 -->
		<c:if test="${pageInfo.xprev}">
			<a href="/collections/newProduct?showPage=${pageInfo.firstPageNoOnPageList-1 }&sort=${sortType}">[prev]</a>
		</c:if>
		<c:forEach var="loopPage" begin="${pageInfo.firstPageNoOnPageList }" end="${pageInfo.lastPageNoOnPageList }" step="1">
				<c:if test="${loopPage eq currPage}">
					<span>[${loopPage}]&nbsp;&nbsp;&nbsp;</span>	
				</c:if>
				<c:if test="${loopPage ne currPage}">
					<span><a href="/collections/newProduct?showPage=${loopPage}&sort=${sortType}">[${loopPage}]</a>&nbsp;&nbsp;&nbsp;</span>	
				</c:if>
		</c:forEach>
		<c:if test="${pageInfo.xnext}">
			<a href="/collections/newProduct?showPage=${pageInfo.lastPageNoOnPageList+1 }&sort=${sortType}">[next]</a>
		</c:if>
		
		<hr />
		<h1>카테고리 리스트(동적으로 늘어남)</h1>
		<c:forEach var="ctList" items="${cateList}" varStatus="vs">
				<input type="button" id="CateButton" name="CateButton${vs.index}" value="${ctList}" class="btnCateList"/>
		</c:forEach>
		<hr />
		<h1>브랜드 리스트(동적으로 늘어남)</h1>
		<c:forEach var="brList" items="${brandList}">
			<input type="button" id="BrandButton" name="BrandButton" value="${brList}" class="btnBrandList"/>
		</c:forEach>
		<hr />
		<h1>가격 리스트(고정값)</h1>
		<input type="button" id="PriceButton" name="PriceButton" value="10000원이하" class="btnPriceList"/>
		<input type="button" id="PriceButton" name="PriceButton" value="10000~20000" class="btnPriceList"/>
		<input type="button" id="PriceButton" name="PriceButton" value="20000이상" class="btnPriceList"/>
		
</body>
<script>
var finalCateList=[];

var cateBtnList = {};
for (var i = 1; i < ${cateList.size()}; i++){ 
	cateBtnList[`btnToggle`+i] = true;
}

for(let i =0 ; i< ${cateList.size()};i++){
	$(function(){

		cateBtnList[`btnToggle`+i] = true;
	    $("input:button[name=CateButton"+i+"]").on('click',function(){
	    	if(cateBtnList[`btnToggle`+i]){
	    		cateBtnList[`btnToggle`+i]=false;
	    		$(this).css('background-color','purple');
	    		$(this).css('color','white');
	    		var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
	    		finalCateList.push(kind);
	            $.ajax({
	                
	                url : "/collections/newProductCate",
	                type : "get",
	                cache : false,
	                data : {
	                    "finalCateList":finalCateList
	                },
	                success : function(data){
// 	                	$('body').html(data);
	                	alert(data.pageInfo);
// 	                 	alert('success');
// 	                 	alert(kind);
	                },
	                error : function(){
// 	                     alert('error');
	                }//error
	            })//ajax
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
				$.ajax({
	                
	                url : "/collections/newProductCate",
	                type : "get",
	                cache : false,
	                data : {
	                    "finalCateList":finalCateList
	                },
	                success : function(data){
	                	$('body').html(data);
// 	                 	alert('success');
// 	                 	alert(kind);
	                },
	                error : function(){
// 	                     alert('error');
	                }//error
	            })//ajax
	    	}
	    });//button click
	    
	}); 
	
}


</script>
</html>