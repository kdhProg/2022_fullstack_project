<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
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
		<form role="form" method="post" action="/admin/storeInsert">
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label for="stlBrandName">브랜드 이름</label>
							<input type="text" id="stlBrandName" name="stlBrandName" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlInfo">정보</label>
							<textarea id="stlInfo" name="stlInfo" class="form-control"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlPhone">전화번호</label>
							<input type="text" id="stlPhone" name="stlPhone" class="form-control"/>
						</td>
					</tr>	
					<tr>
						<td>
							<label for="stlEmail">이메일</label>
							<input type="text" id="stlEmail" name="stlEmail" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlMarketUniqueNo">고유번호</label>
							<input type="text" id="stlMarketUniqueNo" name="stlMarketUniqueNo" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="stlSelRegiNo">사업자등록번호</label>
							<input type="text" id="stlSelRegiNo" name="stlSelRegiNo" class="form-control"/>
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
					<tr>
						<td>
							<button type="submit" class="btn btn-outline-danger">등록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>	
	</section>
</div>	
</body>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                
                // 원래주소 + 참고주소
                addr += extraAddr;
            } else {
            	addr += extraAddr;
            }
			
            
            if(addr != ""){
            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postcode").value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }else{
            	// 우편 폼만 열고 X 누른경우임 ( 문자열이 0 )
            }
            
        }
    }).open();
    
}
</script>
</html>