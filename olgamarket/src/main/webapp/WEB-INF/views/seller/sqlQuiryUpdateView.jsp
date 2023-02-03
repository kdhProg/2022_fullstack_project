<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<body>
<div class="container">
	<section id="container">
		<form role="form" method="post"  action="/seller/sqlQuiryUpdate">
			<input type="hidden" value="${selQuiryUp.sqNo}" id="sqNo" name="sqNo" />
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label for="sqTitle">제목 : </label>
							<input type="text" id="sqTitle" name="sqTitle" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="sqContent">내용 : </label>
							<textarea id="sqContent" name="sqContent" class="form-control"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" id="rgstBtn" class="btn btn-outline-danger">저장</button>
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
</body>
<script>
$("#rgstBtn").click(function(){
	if($('#sqTitle').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>제목</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
	if($('#sqContent').val().length === 0){$("#warn_msg_content").html("<p><strong style='color:red'>내용</strong>을 입력하세요</p>");$("#modal_warn_msg").modal("show");return false;}
});
</script>
</html>