<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
a:hover{
	color:#fc5603;
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
			<a class="navbar-brand" href="/admin/storeList">스토어 관리</a>
			<a class="navbar-brand" href="/admin/seller">셀러 관리</a>
			<a class="navbar-brand" href="/admin/product">상품 관리</a>
			<a class="navbar-brand" href="/admin/clientList">고객센터 관리</a>
			<a class="navbar-brand" href="/admin/memberGrade">회원 등급 관리</a>
			<a class="navbar-brand" href="/admin/adminStats">통계</a>
			<a class="navbar-brand" href="/admin/enterAdminMain"><svg class="nav_homeBtn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg></a>
		</div>
	</nav>
	<section id="container">
		<br />
			<div class="row">
				<div class="col text-center"> 
					<h1>상품 관리</h1>
				</div>
			</div>
		<br />	
		<form role="form" method="post" action="/admin/productInsert">
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label for="pdThumbImg">썸네일 이미지</label>
							<input type="text" id="pdThumbImg" name="pdThumbImg" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdName">상품 이름</label>
							<input type="text" id="pdName" name="pdName" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdMainCategory">메인카테고리</label>
							<select name="pdMainCategory" required="required" class="form-control">
								<option value="" disabled="disabled">선택하세요.</option>
								<option value="과일">과일</option>
								<option value="채소">채소</option>
								<option value="쌀/잡곡">쌀/잡곡</option>
								<option value="수산물">수산물</option>
								<option value="축산/계란">축산/계란</option>
								<option value="냉동/냉장/간편식">냉동/냉장/간편식</option>
							</select> 
						</td>
					</tr>	
					<tr>
						<td>
							<label for="pdSubCategory">서브카테고리</label>
							<select name="pdSubCategory" required="required" class="form-control">
								<option value="" disabled="disabled">선택하세요</option>
							</select>
						</td>		
					</tr>
					<tr>
						<td>
							<label for="pdstlBrandName">브랜드 이름</label>
							<input type="text" id="pdstlBrandName" name="pdstlBrandName" class="form-control" disabled="disabled" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td>
							<button type="button" id="selectBrandBtn" class="btn btn-outline-primary"><strong>브랜드 선택하기</strong></button>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdStorageType">보관 방법</label>
							<select name="pdStorageType" required="required" class="form-control">
								<option value="" disabled="disabled">선택하세요.</option>
								<option value="냉동">냉동</option>
								<option value="냉장">냉장</option>
								<option value="상온">상온</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdUnit">구성 단위</label>
							<select name="pdUnit" required="required" class="form-control">
								<option value="" disabled="disabled">1개 기준</option>
								<option value="박스">박스</option>
								<option value="팩">팩</option>
								<option value="봉지">봉지</option>
								<option value="낱개">낱개</option>
								<option value="세트">세트</option>
							</select> 
						</td>
					</tr>		
					<tr>
						<td>
							<label for="pdWeight">단위 무게</label>
							<input type="text" id="pdWeight" name="pdWeight" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdCountry">원산지</label>
							<input type="text" id="pdCountry" name="pdCountry" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdBBE">유통기한</label>
							<input type="text" id="pdBBE" name="pdBBE" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdDesInfoImg">상품 정보 이미지</label>
							<input type="text" id="pdDesInfoImg" name="pdDesInfoImg" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdSeason">계절</label>
							<select name="pdSeason" required="required" class="form-control">
								<option value="no">no</option>
								<option value="spring">spring</option>
								<option value="summer">summer</option>
								<option value="autumn">autumn</option>
								<option value="winter">winter</option>
							</select> 
						</td>
					</tr>	
					<tr>
						<td>
							<label for="pdPrice">가격</label>
							<input type="text" id="pdPrice" name="pdPrice" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdSale">할인</label>
							<input type="text" id="pdSale" name="pdSale" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdStock">재고</label>
							<input type="text" id="pdStock" name="pdStock" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" id="rgstBtn" class="btn btn-outline-danger">상품 등록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>	
	</section>
</div>	
<!-- 모달창-경고문구 -->
<div id="modal_warn_msg" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
		<div id="warn_msg_content"></div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>	

<!-- 모달창-브랜드 선택 -->
<div id="modal_select_brand" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      	<p><strong style="font-size:1.3em">브랜드 선택</strong></p>
      </div>
      <div class="modal-body">
		<div id="storeListRst"></div>
		<div id="storeListRstPaging"></div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>	
</body>
<script>
	$(function() {
		$("select[name=pdMainCategory]").change(function() {
			var temp = $("select[name=pdSubCategory]");
			var pdMainCategory = $(this).val();

			temp.children().remove();
			temp.append('<option value="">선택하세요</option>');

			if (pdMainCategory == '과일') {
				temp.append('<option value="사과/배">사과/배</option>');
				temp.append('<option value="귤/한라봉/오렌지">귤/한라봉/오렌지</option>');
				temp.append('<option value="감/홍시/곶감">감/홍시/곶감</option>');
				temp.append('<option value="수박/메론/참외">수박/메론/참외</option>');
				temp.append('<option value="포도">포도</option>');
				temp.append('<option value="토마토/자두/복숭아">토마토/자두/복숭아</option>');
				temp.append('<option value="자몽/레몬/석류">자몽/레몬/석류</option>');
				temp.append('<option value="열대과일">열대과일</option>');
			}
			if (pdMainCategory == '채소') {
				temp.append('<option value="열매채소">열매채소</option>');
				temp.append('<option value="양파/마늘/파">양파/마늘/파</option>');
				temp.append('<option value="버섯">버섯</option>');
				temp.append('<option value="쌈채소">쌈채소</option>');
				temp.append('<option value="구황작물">구황작물</option>');
				temp.append('<option value="뿌리채소">뿌리채소</option>');
				temp.append('<option value="배추/무">배추/무</option>');
			}
			if (pdMainCategory == '쌀/잡곡') {
				temp.append('<option value="백미">백미</option>');
				temp.append('<option value="현미/흑미">현미/흑미</option>');
				temp.append('<option value="잡곡가루">잡곡가루</option>');
				temp.append('<option value="콩/팥">콩/팥</option>');
				temp.append('<option value="조/수수/깨/보리">조/수수/깨/보리</option>');
			}
			if (pdMainCategory == '수산물') {
				temp.append('<option value="생선">생선</option>');
				temp.append('<option value="갑각류">갑각류</option>');
				temp.append('<option value="조개류">조개류</option>');
				temp.append('<option value="해조류">해조류</option>');
				temp.append('<option value="건어물">건어물</option>');
				temp.append('<option value="생선알">생선알</option>');
			}
			if (pdMainCategory == '축산/계란') {
				temp.append('<option value="소고기">소고기</option>');
				temp.append('<option value="돼지고기">돼지고기</option>');
				temp.append('<option value="닭/오리고기">닭/오리고기</option>');
				temp.append('<option value="말/양고기">말/양고기</option>');
				temp.append('<option value="계란/알류">계란/알류</option>');
			}
			if (pdMainCategory == '냉동/냉장/간편식') {
				temp.append('<option value="밀키트">밀키트</option>');
				temp.append('<option value="즉석밥">즉석밥</option>');
				temp.append('<option value="고기/해물">고기/해물</option>');
				temp.append('<option value="분식류">분식류</option>');
				temp.append('<option value="면류">면류</option>');
				temp.append('<option value="떡류">떡류</option>');
				temp.append('<option value="피자/치킨">피자/치킨</option>');
				temp.append('<option value="과자/빵/젤리/간식">과자/빵/젤리/간식</option>');
			}
		});
	});


$("#rgstBtn").click(function(){
	if($('#pdThumbImg').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>썸네일 이미지</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdName').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>상품명</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdstlBrandName').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>브랜드명</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdWeight').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>단위무게</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdCountry').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>원산지</strong>를 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdBBE').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>유통기한</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdDesInfoImg').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>상세정보이미지</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdPrice').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>가격</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdSale').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>할인율</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdStock').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>재고량</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}

});

//브랜드 선택 모달
$("#selectBrandBtn").click(()=>{
	$("#modal_select_brand").modal("show");
});


//판매점리스트 띄우기
$(document).ready(storeList(1));
function storeList(pageNo) {
	$.ajax({
        url : "/admin/modalStoreList",
        type : "get",
        data : {
        	showPage : pageNo
        },
        success : function(data){
        	
        	var pageInfo = data.pageInfo;
			var currPage = data.currPage;
            var storeList = data.storeList; // model 처럼
        	
            var stContentTag = "<table class='table'><th>브랜드 No</th><th>브랜드 이름</th><th>연락처</th><th>Email</th><th></th></tr>";
            var stPagingTag = "";

			$.each(storeList, function(key, value) {
				stContentTag += "<tr>";
				stContentTag += "<td><a href='/admin/storeOne?stlNo="+value.stlNo+"'class='btn btn-danger'>"+value.stlNo+"</a></td>";
				stContentTag += "<td>"+value.stlBrandName+"</td>";
				stContentTag += "<td>"+value.stlPhone+"</td>";
				stContentTag += "<td>"+value.stlEmail+"</td>";
				stContentTag += "<td><button class='modal_brd_btn btn btn-outline-secondary' value='"+value.stlBrandName+"'>선택</button></td>";
				stContentTag += "</tr>";                
             });
			stContentTag += "</table>";
			$("#storeListRst").html(stContentTag); //메인 컨텐츠 적용
			
			if(pageInfo.xprev){
				stPagingTag+="<a href='#' onclick='storeList("+(pageInfo.firstPageNoOnPageList-1)+ ");return false;'>[prev]</a>&nbsp;&nbsp;&nbsp;";
			}
			for(var i = pageInfo.firstPageNoOnPageList; i< pageInfo.lastPageNoOnPageList+1;i++){
				if(i == currPage){
					stPagingTag+="<span>["+i+"]&nbsp;&nbsp;&nbsp;</span>";
				}else{
					stPagingTag+="<a href='#' onclick='storeList(" + i + ");return false;'>["+i+"]</a>&nbsp;&nbsp;&nbsp;";
				}
				
			}
			if(pageInfo.xnext){
				stPagingTag+="<a href='#' onclick='storeList("+(pageInfo.lastPageNoOnPageList+1)+ ");return false;'>[next]</a>&nbsp;&nbsp;&nbsp;";
			}
			
			$("#storeListRstPaging").html(stPagingTag); //페이징 적용
        },
        error : function(){
             alert('error - pdList');
        }//error
    });//ajax
}// function end


// 브랜드 선택버튼
$(document).on('click', '.modal_brd_btn', function(){
	let brdName= $(this).val();
	$("#pdstlBrandName").val(brdName);
	$("#pdstlBrandName").prop("disabled",false);
	$("#modal_select_brand").modal("hide");
});

</script>
</html>