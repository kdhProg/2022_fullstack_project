<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
		$(document).ready(function(){
			
			$("#cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/clientList";
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
		<br />
			<div class="row">
				<div class="col text-center"> 
					<h1>고객센터 관리</h1>
				</div>
			</div>
		<br />	
		<form name="updateForm" role="form" method="post" action="/admin/faqUpdate">
			<input type="hidden" name="faqNo" value="${update.faqNo}" readonly="readonly" />
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label for="faqNo">No</label>
							<input type="text" id="faqNo" name="faqNo" value="${update.faqNo}" class="form-control" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="faqCategory">카테고리</label>
							<select name="faqCategory" required="required" class="form-control">
								<option value="" disabled="disabled">선택하세요.</option>
								<option value="주문/결제">주문/결제</option>
								<option value="취소/교환/환불">취소/교환/환불</option>
								<option value="회원">회원</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>
							<label for="faqTitle">제목</label>
							<input type="text" id="faqTitle" name="faqTitle" value="${update.faqTitle}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="faqContent">내용</label>
							<textarea id="faqContent" name="faqContent" class="form-control">${update.faqContent}</textarea>
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
	if($('#faqTitle').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>제목</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#faqContent').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>내용</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
});
</script>
</html>