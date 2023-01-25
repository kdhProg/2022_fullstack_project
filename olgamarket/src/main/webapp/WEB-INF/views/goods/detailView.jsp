<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
/* 데이터만을위한 태그 시야에서 제거 */
#justForPdId,#currMemSession,#currSelSession,#favorList{
	display:none;
}
/* a태그 장식제거 */
a{
	text-decoration: none;
}
/* 정렬버튼 */
#sortBtn1{
	font-weight: bold;
}
/* 볼드체 */
.font-custom{
	font-weight: bold;
}
.font_iqModal_header{
	font-weight: bold;
	color:#ff6b61;
}


/* 상품문의 모달창 textarea 크기 제어 */
/* 부모태그 */
#inquiry_content_div{
	width:550px;
}
#inquiry_content{
	resize:none;
	width:100%;
	height:250px; 
}

/* 상품문의답변 모달창 크기제어 */
#inquiryAnswer_content, #inquiryAnsInq_content{
	resize:none;
	width:100%;
	height:250px;
}

/* 찜하기 커서 설정 */
#favor_heart_btn{
	cursor : pointer;
}

/* 테스트 */
.col{
/*   	border:1px solid red; */
}
</style>
</head>
<body>
<!-- 현재 세션 아이디 넘기기-->
<span id="currMemSession">${member.getMemId()}</span><span id="currSelSession">${seller.getSelId()}</span>
<!-- 현재PdId값 JS로 넘기는 용도 -->
<p id="justForPdId">${productDetail.getPdId()}</p>
<!-- 찜목록 -->
<span id="favorList">${favor}</span>

<h1>상품디테일뷰</h1>
<p>상품ID:${productDetail.getPdId()}</p>
<p>상품명:${productDetail.getPdName()}</p>
<p>상품메인카테고리:${productDetail.getPdMainCategory()}</p>
<p>상품가격:${productDetail.getPdPrice()}</p>
<p>상품등록일:${productDetail.getPdRegiDate()}</p>
<div id="favor_form">
	<div id="favor_heart_btn">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart" viewBox="0 0 16 16">
		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
		</svg>
	</div>
</div>
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
<button id="productInquiryEnterBtn">문의하기</button>
<hr />
<img src="https://dummyimage.com/600x400/000/fff" alt="" />

<!-- 모달창-상품문의 -->
<div id="login_warn_modal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
		<p>로그인시 이용할 수 있는 서비스 입니다.</p>
      </div>
      <div class="modal-footer">
     	<button type="button" id="warn_modal_login" class="btn btn-primary" data-bs-dismiss="modal">로그인</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달창-상품문의 -->
<div id="productInquiryForm" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      <span>
      	<span class="font_iqModal_header">${productDetail.getPdName()}</span><span class="font-custom">에 대한 상품문의 작성하기</span>
      </span>
      </div>
      <div class="modal-body container">
      <form action="">
		<input type="hidden" value="${productDetail.getPdId()}" name="pdId"/>
		<!-- =======작성자======= -->
		<div class="row">
			<div class="col col-lg-3">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiry_memId">작성자</label>
			    	</div>
		    	</div>
		    </div>
		    <div class="col col-lg-5">
		    	<input type="text" id="inquiry_memId" class="form-control" name="memId" value="${member.getMemId()}${seller.getSelId()}" readonly="readonly">
		    </div>
		</div>
		<!-- =======제목======= --> <br />
		<div class="row">
			<div class="col col-lg-3">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiry_title">제목</label>
			    	</div>
		    	</div>
		    </div>
		    <div class="col col-lg-5">
		    	<input type="text" id="inquiry_title" class="form-control" name="iqTitle">
		    </div>
		</div>
		<!-- =======내용======= --> <br />
		<div class="row">
			<div class="col col-lg-3">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiry_content">내용</label>
			    	</div>
		    	</div>
		    </div>
		    <div id="inquiry_content_div" class="col col-lg-5">
		    	<textarea id="inquiry_content" class="form-control" name="iqContent"></textarea>
		    </div>
		</div>
		<!-- 경고 -->
		<div class="row justify-content-center">
			<div class="col col-lg-5"></div>
	    	<div class="col">
	    		<div id="iqmodal_alert_msg"></div>
	    	</div>
	    	<div class="col col-lg-2"></div>
	    </div>
		<!-- =======비밀글여부======= --> <br />
		<div class="row justify-content-center">
			<div class="col col-lg-5"></div>
	    	<div class="col">
	    		<input class="form-check-input" id="secretCheck" type="checkbox" name="iqSecretState" value=1>
	    		<label for="secretCheck" class="form-check-label font-custom">비밀글입니다.</label>
	    	</div>
	    	<div class="col col-lg-2"></div>
		</div>
      </form>
      </div>
      <div class="modal-footer">
      	<button type="button" id="iqModal_register_btn" class="btn btn-primary">문의등록</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<!-- 모달창-상품문의답글 -->
<div id="productInquiryAnswerForm" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body container">
      <!-- =======문의내용======= -->
		<div class="row">
			<div class="col col-lg-2">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiryAnsInq_content">문의내용</label>
			    	</div>
		    	</div>
		    </div>
		    <div id="inquiry_content_div" class="col col-lg-10">
		    	<textarea id="inquiryAnsInq_content" class="form-control" readonly="readonly"></textarea>
		    </div>
		</div>
		<!-- =======답글내용======= -->
		<div class="row">
			<div class="col col-lg-2">
		    	<div class="row justify-content-start">
		    		<div class="col-2"></div>
			    	<div class="col-10">
			    		<label class="font-custom" for="inquiryAnswer_content">문의답글</label>
			    	</div>
		    	</div>
		    </div>
		    <div id="inquiry_content_div" class="col col-lg-10">
		    	<textarea id="inquiryAnswer_content" class="form-control" readonly="readonly"></textarea>
		    </div>
		</div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
// 현재 세션값 - 각각 일반회원/판매자회원
let memSession = $('#currMemSession').text();
let selSession = $('#currSelSession').text();

let currentSession; // 현재세션값
if(memSession.length != 0){currentSession = memSession}else{currentSession = selSession}
// 현재PdId값 JS에서 받는 용도
let pdId = $("#justForPdId").text();

let favorList = $("#favorList").text().split("/"); // 구분자로 나누어 배열로 pdId를 저장
let favorDetected = false; //찜목록에 없다면 false

/* 찜하기 구현 */
// 리스트 반복문 돌려서 pdId 감지

if(favorList.includes(pdId)){
	$("#favor_heart_btn").html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>');
	favorDetected = true;
}



$("#favor_heart_btn").click(function(){
	//로그인 안했을시 모달창 띄우기
	if(currentSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	if(favorDetected){
		//찜목록에 있는경우에 클릭했을경우 -> delete + 하트바꾸기
		$.ajax({
			type : "post",
			url : "/goods/deleteFavors",
			data : {
				currentSession : currentSession,
				pdId : pdId
			},
			success : function(){
				$("#favor_heart_btn").html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart" viewBox="0 0 16 16"><path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg>');
				favorDetected = false;
			}// success 종료
		}); // ajax 종료
	}else{
		//찜목록에 없는경우에 클릭했을경우 -> insert + 하트바꾸기
		$.ajax({
			type : "post",
			url : "/goods/addFavors",
			data : {
				currentSession : currentSession,
				pdId : pdId
			},
			success : function(){
				$("#favor_heart_btn").html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>');
				favorDetected = true;
			}// success 종료
		}); // ajax 종료	
	}
});

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
	                rstContentTag += "<td>"+value.rvmemId.substring(0,3)+"******"+"</td>";
	                rstContentTag += "<td>"+value.rvContent+"</td>";
	                rstContentTag += "<td>"+value.rvRegiDate.substring(0,10)+"</td>";
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
            
	            var qrContentTag = "<table><tr><th>iqNo</th><th>작성자</th><th>제목</th><th>작성일</th><th>답변상태</th></tr>";
	            var qrPagingTag = "";
	
				$.each(qrPageList, function(key, value) {
	                qrContentTag += "<tr>";
	                qrContentTag += "<td>"+value.iqNo+"</td>";
	                qrContentTag += "<td>"+value.iqmemId.substring(0,3)+"******"+"</td>";
	                if(value.iqPrivate == 1){
	                	if(currentSession == value.iqmemId){
	                		// 비밀글 + 본인이 작성한 글
	                		if(value.iqState == 1){
	                			qrContentTag += "<td style='color:#9c5b16'><a href='#' onclick='showIqAnswer("+value.iqNo+");return false;'>[비밀]"+value.iqTitle+"</a></td>"; // 비밀글 + 본인이 작성한 글 + 답변달림
	                		}else{
	                			qrContentTag += "<td style='color:#9c5b16'>[비밀]"+value.iqTitle+"</td>"; // 비밀글 + 본인이 작성한 글 + 답변안달림
	                		}
	                	}else{
	                		//비밀글 + 타인이 작성한 글 - 내용보여줄 필요X
	                		qrContentTag += "<td style='color:#B28989'>비밀글입니다.</td>";
	                	}
	                }else{
	                	// 비밀글아님 - 전체공개
	                	if(value.iqState == 1){
	                		qrContentTag += "<td><a href='#' onclick='showIqAnswer("+value.iqNo+");return false;'>"+value.iqTitle+"</a></td>"; // 비밀글아님 - 전체공개 + 답변달림
	                	}else{
	                		qrContentTag += "<td>"+value.iqTitle+"</td>"; // 비밀글아님 - 전체공개 + 답변안달림
	                	}
	                }
	                qrContentTag += "<td>"+value.iqRegiDate.substring(0,10)+"</td>";
	                if(value.iqState == 1){qrContentTag += "<td style='color:#398C02'>답변완료</td>";}else{qrContentTag += "<td>처리대기중</td>";}
	                qrContentTag += "</tr>";
	             });
				qrContentTag += "</table>";
				$("#quiryResultList").html(qrContentTag); //메인 컨텐츠 적용
				
				if(pageInfo.xprev){
					qrPagingTag+="<a href='#' onclick='quiryList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
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


/////////////////////////
/* 상품후기등록 */
//상품후기버튼 클릭
$("#productInquiryEnterBtn").click(function(){
	if(memSession.length === 0 && selSession.length === 0){$("#login_warn_modal").modal("show");return false;}
	$('#productInquiryForm').modal("show");
});

//모달창에서 로그인 버튼
$("#warn_modal_login").click(function(){
	location.href = "/member/login";
});

//상품후기 모달 등록버튼 클릭
$("#iqModal_register_btn").click(function(){
	if($("#inquiry_title").val().length==0){$("#iqmodal_alert_msg").html("<p style='color:red'>제목과 내용을 입력해주세요.</p>");return false;}
	if($("#inquiry_content").val().length==0){$("#iqmodal_alert_msg").html("<p style='color:red'>제목과 내용을 입력해주세요.</p>");return false;}
	$("#iqmodal_alert_msg").css('display','none');
	let iqmemId; // 작성자 - 세션에서 얻어오기
	if(memSession.length != 0){iqmemId = memSession}else{iqmemId = selSession}
	let iqpdId = pdId; // 상품ID
	let iqTitle = $('#inquiry_title').val(); //제목
	let iqContent = $('#inquiry_content').val(); //내용
	let iqPrivate; //비밀글여부 체크시 1
	if($('#secretCheck').is(':checked')){iqPrivate=1;}else{iqPrivate=0;}
	$.ajax({
		type : "post",
		url : "/goods/quiryRegist",
		data : {
			iqmemId : iqmemId,
			iqpdId : iqpdId,
			iqTitle : iqTitle,
			iqContent : iqContent,
			iqPrivate : iqPrivate
		},
		success : function(result){
			if(result === "success"){
				//성공
				alert("문의가 성공적으로 등록되었습니다.");
				$('#productInquiryForm').modal("hide");  //모달 숨기기
				$("#inquiry_title").val('');  //모달 비우기
				$("#inquiry_content").val('');  //모달 비우기
				$("#secretCheck").prop("checked", false);  //모달 비우기
				quiryList(1); //다시 리스트 불러오기
			}else{
				//실패
				alert("문의등록에 실패하였습니다.");
			}
			
		}// success 종료
	}); // ajax 종료	
});

//문의 제목누르면 답글이랑 내용띄워줌
function showIqAnswer(iqNo){
	$.ajax({
		type : "post",
		url : "/goods/quiryAnswerShow",
		data : {
			iqNo : iqNo
		},
		success : function(result){
			let answer = result.answer;
			let quiry = result.quiry;
			$("#inquiryAnswer_content").text(answer.iaContents);
			$("#inquiryAnsInq_content").text(quiry.iqContent);
			$("#productInquiryAnswerForm").modal("show");
		}// success 종료
	}); // ajax 종료	
}


</script>
</html>