<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
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
<body>
<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/storeList">판매점</a>
			<a class="navbar-brand" href="/admin/seller">판매자</a>
			<a class="navbar-brand" href="/admin/product">상품</a>
			<a class="navbar-brand" href="/admin/clientList">고객센터</a>
			<a class="navbar-brand" href="/admin/memberGrade">회원</a>
			<a class="navbar-brand" href="/admin/storeList">통계</a>
		</div>
	</nav>
	<section id="container">
		<form name="updateForm" role="form" method="post" action="/admin/noticeUpdate">
			<input type="hidden" name="ntNo" value="${update.ntNo}" readonly="readonly" />
			<table class="table">
				<tbody>
					<tr>
						<td>No : ${update.ntNo}</td>
					</tr>
					<tr>
						<td>
							<label for="ntCategory">카테고리 : </label>
							<select name="ntCategory" required="required">
								<option value="">선택하세요.</option>
								<option value="안내">안내</option>
								<option value="이벤트">이벤트</option>
								<option value="가격인상">가격인상</option>
								<option value="가격인하">가격인하</option>
								<option value="배송">배송</option>
								<option value="결제">결제</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>
							<label for="ntTitle">제목</label>
							<input type="text" id="ntTitle" name="ntTitle" value="${update.ntTitle}" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="ntContent">내용</label>
							<textarea id="ntContent" name="ntContent" class="form-control">${update.ntContent}</textarea>
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
</body>
</html>