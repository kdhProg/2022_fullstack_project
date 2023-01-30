<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>고객센터</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>

<body>
<div class="container">
	<ul class="nav nav-pills">
	  <li class="nav-item">
	    <a href="#" onclick="noticeList(1);return false;" aria-current="page" id="noticeBt" class="nav-link" href="#">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a href="#" onclick="faqList(1);return false;" id="faqBt" class="nav-link">FAQ</a>
	  </li>
	  <li class="nav-item">
		<a href="#" onclick="otList(1);return false;" id="onetooneBt" class="nav-link">1 : 1 문의</a>
	  </li>
	</ul>
	<section id="container">
		<form role="form" method="post" action="/board/otqInsert">
			<table class="table">
				<tr>
					<td>
						<label for="otqMainCategory">메인카테고리 : </label>
						<select name="otqMainCategory" required="required" class="form-control">
							<option value="">선택하세요.</option>
							<option value="주문/결제">주문/결제</option>
							<option value="이벤트/적립금/할인 문의">이벤트/적립금/할인 문의</option>
							<option value="상품문의">상품문의</option>
							<option value="배송문의">배송문의</option>
						</select> 
					</td>
				</tr>		
				<tr>
					<td>
						<label for="otqSubCategory">서브카테고리 : </label>
						<select name="otqSubCategory" required="required" class="form-control">
							<option value="">선택하세요</option>
						</select>
					</td>		
				</tr>
				<tr>
					<td>
						<label for="otqTitle">제목 : </label>
						<input type="text" id="otqTitle" name="otqTitle" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="otqContent">내용 : </label>
						<textarea id="otqContent" name="otqContent" class="form-control"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="otqmemId">작성자 : </label>
						<input type="text" id="otqmemId" name="otqmemId"
							value="${member.getMemId()}" readonly="readonly" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-outline-danger">등록</button>
					</td>
				</tr>
			</table>	
		</form>	
	</section>
</div>
</body>
<script>
	$(function() {
		$("select[name=otqMainCategory]").change(function() {
			var temp = $("select[name=otqSubCategory]");
			var otqMainCategory = $(this).val();

			temp.children().remove();
			temp.append('<option value="">선택하세요</option>');

			if (otqMainCategory == '주문/결제') {
				temp.append('<option value="주문취소">주문취소</option>');
				temp.append('<option value="주문/결제방법">주문/결제방법</option>');
				temp.append('<option value="기타">기타</option>');
			}
			if (otqMainCategory == '이벤트/적립금/할인 문의') {
				temp.append('<option value="이벤트">이벤트</option>');
				temp.append('<option value="적립금">적립금</option>');
				temp.append('<option value="할인">할인</option>');
				temp.append('<option value="기타">기타</option>');
			}
			if (otqMainCategory == '상품문의') {
				temp.append('<option value="상품 환불">상품 환불</option>');
				temp.append('<option value="상품 교환">상품 교환</option>');
				temp.append('<option value="상품">상품</option>');
				temp.append('<option value="기타">기타</option>');
			}
			if (otqMainCategory == '배송문의') {
				temp.append('<option value="배송비">배송비</option>');
				temp.append('<option value="배송정보 변경">배송정보 변경</option>');
				temp.append('<option value="기타">기타</option>');
			}
		});
	});
</script>
</html>