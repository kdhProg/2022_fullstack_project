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

<body>
	<section id="container">
		<form role="form" method="post" action="/board/otqInsert">
			<table>
				<tr>
					<td>
						<label for="otqMainCategory">메인카테고리 : </label>
						<select name="otqMainCategory" required="required">
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
						<select name="otqSubCategory" required="required">
							<option value="">선택하세요</option>
						</select>
					</td>		
				</tr>
				<tr>
					<td>
						<label for="otqTitle">제목 : </label>
						<input type="text" id="otqTitle" name="otqTitle" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="otqContent">내용 : </label>
						<textarea id="otqContent" name="otqContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="otqmemId">작성자 : </label>
						<input type="text" id="otqmemId" name="otqmemId"
							value="${member.getMemId()}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">등록</button>
					</td>
				</tr>
		</table>	
	</form>	
</section>
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