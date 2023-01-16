<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.justForPdId{
	display:none;
}
a{
	text-decoration: none;
}
#sortBtn1{
	font-weight: bold;
}
</style>
</head>
<body>
<!-- 현재PdId값 JS로 넘기는 용도 -->
<p class="justForPdId">${productDetail.getPdId()}</p>

<h1>상품디테일뷰</h1>
<p>상품ID:${productDetail.getPdId()}</p>
<p>상품명:${productDetail.getPdName()}</p>
<p>상품메인카테고리:${productDetail.getPdMainCategory()}</p>
<p>상품가격:${productDetail.getPdPrice()}</p>
<p>상품등록일:${productDetail.getPdRegiDate()}</p>
<img src="https://dummyimage.com/600x400/000/fff" alt="" />
<hr />
<h1>상품후기</h1>
<a href="#" onclick="sortList(1);return false;" id="sortBtn1">등록순</a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="sortList(2);return false;" id="sortBtn2">추천순</a>
<div id="reviewResultList"></div>
<div id="reviewResultPagingNo"></div>
<button>상품후기작성</button>
<hr />
<img src="https://dummyimage.com/600x400/000/fff" alt="" />
<hr />
<h1>상품문의</h1>
<div id="quiryResultList"></div>
<div id="quiryResultPagingNo"></div>
<button>문의하기</button>
<hr />
<img src="https://dummyimage.com/600x400/000/fff" alt="" />
</body>
<script>
// 현재PdId값 JS에서 받는 용도
let pdId = $(".justForPdId").text();

/*#############
 상품후기 관련 
 #############*/
 
//20230115 미구현: 상품후기작성 / 추천+신고 기능

//초기값은 1
var sortType=1;

$(document).ready(reviewList(1,1));

function reviewList(pageNo, sortNo) {
	
	$.ajax({
		url : "reviewPageInitInfos",
		type : 'GET',
		data : {
			showPage : pageNo,
			sort : sortNo,
			"pdId" : pdId
		},
		success : function(data) {
			var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var rvPageList = data.rvPageList;
            
            if(pageInfo.totalRecordCount!=0){
            
	            var rstContentTag = "<table><tr><th>rvNo</th><th>작성자</th><th>내용</th><th>작성일</th><th>추천수</th><th>신고수</th><th>추천하기</th><th>신고하기</th></tr>";
	            var rstPagingTag = "";
	
				$.each(rvPageList, function(key, value) {
	// 				console.log(key+1);
	                rstContentTag += "<tr>";
	                rstContentTag += "<td>"+value.rvNo+"</td>";
	                rstContentTag += "<td>"+value.rvmemId+"</td>";
	                rstContentTag += "<td>"+value.rvContent+"</td>";
	                rstContentTag += "<td>"+value.rvRegiDate+"</td>";
	                rstContentTag += "<td>"+value.rvNice+"</td>";
	                rstContentTag += "<td>"+value.rvReport+"</td>";
	                rstContentTag += "<td><button>추천하기</button></td>";
	                rstContentTag += "<td><button>신고하기</button></td>";
	                rstContentTag += "</tr>";                
	             });
				rstContentTag += "</table>";
				$("#reviewResultList").html(rstContentTag); //메인 컨텐츠 적용
				
				if(pageInfo.xprev){
					rstPagingTag+="<a href='#' onclick='reviewList("+(pageInfo.firstPageNoOnPageList-1)+ ", " + sortType +");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
				}
				for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
					if(i == currPage){
						rstPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
					}else{
						rstPagingTag+="<a href='#' onclick='reviewList(" + i + ", " + sortType + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
					}
					
				}
				if(pageInfo.xnext){
					rstPagingTag+="<a href='#' onclick='reviewList("+(pageInfo.lastPageNoOnPageList+1)+ ", " + sortType +");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
				}
				
				$("#reviewResultPagingNo").html(rstPagingTag); //페이징 적용
			
            }else{
            	// 관련 상품리뷰가 없는 경우
            	var rstContentTag = "<h1>상품리뷰가 없습니다.</h1>";
            	$("#reviewResultList").html(rstContentTag);
            }
			
	     }, //success end
		error : function() {
			alert("error");
		}
	}); // ajax end
}// function end

// 정렬을 결정하는 함수임
function sortList(inputsort){
	sortType = inputsort;
	reviewList(1, sortType);
}

// 정렬 A태그 디자인 관련
$("#sortBtn1").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn2").css('font-weight', 'normal');
});
$("#sortBtn2").on("click", function() {
	$(this).css('font-weight', 'bold');
	$("#sortBtn1").css('font-weight', 'normal');
});


/*#############
상품문의 관련 
#############*/

// 상품문의는 별도의 정렬X 카테고리X
// 20230115 미구현: 로그인 세션에따른 비밀글 표시여부

$(document).ready(quiryList(1));

function quiryList(pageNo) {
	
	$.ajax({
		url : "quiryPageInitInfos",
		type : 'GET',
		data : {
			showPage : pageNo,
			"pdId" : pdId
		},
		success : function(data) {
			var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var qrPageList = data.qrPageList;
            
            if(pageInfo.totalRecordCount!=0){
            
	            var qrContentTag = "<table><tr><th>iqNo</th><th>작성자</th><th>제목</th><th>내용</th><th>작성일</th><th>답변상태</th><th>비밀글여부</th></tr>";
	            var qrPagingTag = "";
	
				$.each(qrPageList, function(key, value) {
	                qrContentTag += "<tr>";
	                qrContentTag += "<td>"+value.iqNo+"</td>";
	                qrContentTag += "<td>"+value.iqmemId+"</td>";
	                qrContentTag += "<td>"+value.iqTitle+"</td>";
	                qrContentTag += "<td>"+value.iqContent+"</td>";
	                qrContentTag += "<td>"+value.iqRegiDate+"</td>";
	                if(value.iqState == 1){qrContentTag += "<td>답변완료</td>";}else{qrContentTag += "<td>처리대기중</td>";}
	                qrContentTag += "<td>"+value.iqPrivate+"</td>";
	                qrContentTag += "</tr>";                
	             });
				qrContentTag += "</table>";
				$("#quiryResultList").html(qrContentTag); //메인 컨텐츠 적용
				
				if(pageInfo.xprev){
					qrPagingTag+="<a href='#' onclick='quiryList("+(pageInfo.firstPageNoOnPageList-1)+ ",);return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
				}
				for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
					if(i == currPage){
						qrPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
					}else{
						qrPagingTag+="<a href='#' onclick='quiryList(" + i + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
					}
					
				}
				if(pageInfo.xnext){
					qrPagingTag+="<a href='#' onclick='quiryList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
				}
				
				$("#quiryResultPagingNo").html(qrPagingTag); //페이징 적용
			
            }else{
            	// 관련 상품리뷰가 없는 경우
            	var qrContentTag = "<h1>상품문의가 없습니다.</h1>";
            	$("#quiryResultList").html(qrContentTag);
            }
	     }, //success end
		error : function() {
			alert("error");
		}
	}); // ajax end
}// function end


</script>
</html>