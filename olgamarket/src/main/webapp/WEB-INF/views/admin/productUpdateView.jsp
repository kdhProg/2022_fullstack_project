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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script type="text/javascript">
		$(document).ready(function(){
			
			$("#cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/productList";
			})
		})
	
</script>
<style>
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
		<form name="updateForm" role="form" method="post" action="/admin/productUpdate">
			<input hidden="hidden" name="pdId" value="${update.pdId}" readonly="readonly" />
			<table class="table">
				<tbody>
					<tr>
						<td>상품 번호 : ${update.pdId} </td>
					</tr>
					<tr>
						<td>브랜드 이름 : ${update.pdstlBrandName} </td>
					</tr>
					<tr>
						<td>
							<label for="pdThumbImg">썸네일</label>
							<input type="text" id="pdThumbImg" name="pdThumbImg" value="${update.pdThumbImg}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdName">상품 이름</label>
							<input type="text" id="pdName" name="pdName" value="${update.pdName}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdStorageType">보관 방법 : </label>
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
							<label for="pdUnit">구성 단위 : </label>
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
							<input type="text" id="pdWeight" name="pdWeight" value="${update.pdWeight}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdCountry">원산지</label>
							<input type="text" id="pdCountry" name="pdCountry" value="${update.pdCountry}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdBBE">유통기한</label>
							<input type="text" id="pdBBE" name="pdBBE" value="${update.pdBBE}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdDesInfoImg">상품 정보 이미지</label>
							<input type="text" id="pdDesInfoImg" name="pdDesInfoImg" value="${update.pdDesInfoImg}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdPrice">상품 가격</label>
							<input type="text" id="pdPrice" name="pdPrice" value="${update.pdPrice}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdSale">할인</label>
							<input type="text" id="pdSale" name="pdSale" value="${update.pdSale}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="pdStock">재고</label>
							<input type="text" id="pdStock" name="pdStock" value="${update.pdStock}" class="form-control"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="submit" id="update_btn" class="btn btn-outline-danger">저장</button>
				<button type="submit" id="cancel_btn" class="btn btn-outline-danger">취소</button>
			</div>
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
</body>
<script>
$("#update_btn").click(function(){
	if($('#pdThumbImg').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>썸네일 이미지</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdName').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>상품명</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdWeight').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>단위무게</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdCountry').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>원산지</strong>를 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdBBE').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>유통기한</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdDesInfoImg').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>상세정보이미지</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdPrice').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>가격</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdSale').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>할인율</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#pdStock').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>재고량</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}

});
</script>
</html>