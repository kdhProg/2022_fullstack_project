<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script type="text/javascript">
		$(document).ready(function(){
			
			$("#cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/storeList";
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
		<form name="updateForm" role="form" method="post" action="/admin/storeUpdate">
			<input type="hidden" name="stlNo" value="${update.stlNo}" readonly="readonly" />
			<table class="table">
				<tbody>
					<tr>
						<td>브랜드 이름 : ${update.stlBrandName}</td>
					</tr>
					<tr>
						<td>
							<label for="stlInfo">정보</label>
							<textarea id="stlInfo" name="stlInfo" class="form-control">${update.stlInfo}</textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlPhone">번호</label>
							<input type="text" id="stlPhone" name="stlPhone" value="${update.stlPhone}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlEmail">이메일</label>
							<input type="text" id="stlEmail" name="stlEmail" value="${update.stlEmail}" class="form-control"/>
						</td>
					</tr>
			<!-- 추후 테이블 추가하고 사용  
					<tr>
						<td>
							<label for="stlAddress">판매점 주소</label>
							<input type="text" name="postcode" id="postcode" placeholder="우편번호" class="form-control">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary"><br>
							<input type="text" name="address" id="address" placeholder="주소" class="form-control"><br>
							<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" class="form-control"><br />
							<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" class="form-control"><br />
						</td>
					</tr>
			-->				
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
      	<button type="button" id="rgstBtn" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
$("#update_btn").click(function(){
	if($('#stlInfo').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>판매사정보</strong>를 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#stlPhone').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>연락처</strong>를 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#stlEmail').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>이메일</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
});
</script>
</html>