<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="container">
	<form role="form" method="post" action="/admin/productInsert">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="pdThumbImg">썸네일 이미지 : </label>
						<input type="text" id="pdThumbImg" name="pdThumbImg" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdName">상품 이름 : </label>
						<input type="text" id="pdName" name="pdName" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdMainCategory">메인 카테고리 : </label>
						<input type="text" id="pdMainCategory" name="pdMainCategory" />
					</td>
				</tr>	
				<tr>
					<td>
						<label for="pdSubCategory">서브 카테고리 : </label>
						<input type="text" id="pdSubCategory" name="pdSubCategory" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdstlBrandName">브랜드 이름 : </label>
						<input type="text" id="pdstlBrandName" name="pdstlBrandName" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdStorageType">보관 방법 : </label>
						<input type="text" id="pdStorageType" name="pdStorageType" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdUnit">구성 단위 : </label>
						<input type="text" id="pdUnit" name="pdUnit" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdWeight">단위 무게 : </label>
						<input type="text" id="pdWeight" name="pdWeight" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdCountry">원산지 : </label>
						<input type="text" id="pdCountry" name="pdCountry" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdBBE">유통기한 : </label>
						<input type="text" id="pdBBE" name="pdBBE" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdDesInfoImg">상품 정보 이미지 : </label>
						<input type="text" id="pdDesInfoImg" name="pdDesInfoImg" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdSeason">계절 : </label>
						<input type="text" id="pdSeason" name="pdSeason" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdHits">조회수 : </label>
						<input type="text" id="pdHits" name="pdHits" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdSalesVolume">판매량 : </label>
						<input type="text" id="pdSalesVolume" name="pdSalesVolume" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdPrice">가격 : </label>
						<input type="text" id="pdPrice" name="pdPrice" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdSale">할인 : </label>
						<input type="text" id="pdSale" name="pdSale" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="pdStock">재고 : </label>
						<input type="text" id="pdStock" name="pdStock" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="stlPhone">등록날짜 : </label>
						<fmt:parseDate value="${productOne.pdUpdDate}" var="pdUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${pdUpdDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">상품 등록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
</section>
</body>
</html>