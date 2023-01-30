<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/resources/pdimages/favicon.ico"
	type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더, 풋터 CSS 링크 -->
<link rel="stylesheet" href="/resources/css/mainfooter.css" />
<link rel="stylesheet" href="/resources/css/mainheader.css" />
</head>
<body>
	<div class="container">
	
		
		<c:forEach items="${datePd30}" var="datePd" varStatus="vS">
			<c:if test=${(vS.index % 5) eq 0}><div class="row"></c:if>
			<div class="col">
				<div class="card mb-3 img_hover_paraentDiv">
					
					
						<a href="/goods/detailView?pdId=${datePd.pdId}"><img src="/resources/pdimages/pd_default.jpg"
							class="card-img-top pdImg" alt="기본이미지"></a>
						<div class="img_absolute">
							<button class="img_absolute_cartBtn" value="${datePd.pdId}"> <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="white" class="bi bi-cart2" viewBox="0 0 16 16">   <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" /></svg> </button>
						</div>
							<input type="hidden" name="pdPrice${datePd.pdId}" value="${datePd.pdPrice}"> 
							<input type="hidden" name="pdSale${datePd.pdId}" value="${datePd.pdSale}">
							<input type="hidden" name="pdName${datePd.pdId}" value="${datePd.pdName}">
							<input type="hidden" name="pdstlBrandName${datePd.pdId}" value="${datePd.pdstlBrandName}">
						<div class="card-body">
						
							<h5 class="card-title"></h5>
							
							<span><a href="/goods/detailView?pdId=${datePd.pdId}"></a></span>
							<c:if test="${datePd.pdSale gt 0}">
								<span class="pdSale_sale">%</span>&nbsp; 
								<span class="pdSale_totalPrice">원</span>
								<span class="pdSale_originPrice">원</span>
							</c:if>
							<c:if test="${datePd.pdSale eq 0}">
								<p class='pdPrice'>원</p>
							</c:if>
						</div>
					</div>
				</div>
				<c:if test=${(vS.index % 5) eq 0}></div></c:if>
				</c:forEach>
			
			<div class="col">
				<div>
					<div></div>
				</div>
			</div>
		</div>
	</div>

	<br />
	<br />
	<!-- =======================푸터 시작======================= -->
	<footer class="footer">
		<div class="footer-limit">
			<div class="footer-content">
				<div class="footer-column">
					<h2 class="footer-contact_title">고객행복센터</h2>
					<div class="footer-contact_desc">
						1644-1107<span class="footer-contact_time"> 월~토요일 오전 7시 -
							오후 6시</span>
					</div>
					<ul class="footer-section">
						<li class="footer-section_item"><a href="/board/client"><button
									class="footer-section_button">고객센터</button></a>
							<p class="footer-section_desc">
								월~금요일 | 오전 9시 - 오후 6시<br>점심시간 | 낮 12시 - 오후 1시
							</p></li>
					</ul>
					<div class="footer-nonmembers" onclick="window.open('');">
						비회원 문의 : help@olgacorp.com <br>비회원 대량주문 문의 :
						olgagift@kurlycorp.com
					</div>
				</div>
				<div class="footer-column">
					<ul class="footer-policy">
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">소개</a></li>
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">소개영상</a></li>
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">인재채용</a></li>
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">이용약관</a></li>
						<li class="footer-policy_item"><a
							class="footer-policy__link footer-policy__link--strong" href="">개인정보처리방침</a>
						</li>
						<li class="footer-policy_item"><a class="footer-policy_link"
							href="">이용안내</a></li>
					</ul>
					<div class="footer-address">
						법인명 (상호) : 주식회사 olga | 사업자등록번호 : 222-222-222<a
							class="footer-address_link" href=""> 사업자정보 확인</a><br> 통신판매업
						: 제 2018-서울강남-01646호 | 개인정보보호책임자 : 홍길동<br> 주소 : 경기도 분당구 미금역 |
						대표이사 : 홍길동<br> 입점문의 :<a class="footer-address_link" href="">
							입점문의하기</a> | 제휴문의 :<a class="footer-address_link" href="">
							business@kulycorp.com</a><br> 채용문의 :<a
							class="footer-address_link" href=""> recruit@kurlycorp.com</a><br>
						팩스 : 000 - 0000 - 0000
					</div>
					<ul class="footer-sns">
						<li class="footer-sns_item"><a class="footer-sns_link"
							href=""><img class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt=""></a>
							<a class="footer-sns_link" href=""><img
								class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt=""></a>
							<a class="footer-sns_link" href=""><img
								class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt=""></a>
							<a class="footer-sns_link" href=""><img
								class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt=""></a>
							<a class="footer-sns_link" href=""><img
								class="footer-sns_icon"
								src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt=""></a>
						</li>
					</ul>
				</div>
			</div>
			<ul class="footer-certification">
				<li class="footer-certification_item" onclick="window.open('');">
					<img class="footer-certification_logo"
					src="https://res.kurly.com/pc/ico/2208/logo_isms.svg">
					<p class="footer-certification_desc">
						[인증범위 쇼핑몰 서비스 개발·운영<br> (심사받지 않은 물리적 인프라 제외)<br> [유효기간]
						2022.01.19 - 2025.01.18
					</p>
				</li>
				<li class="footer-certification_item" onclick="window.open('');">
					<img class="footer-certification_logo"
					src="https://res.kurly.com/pc/ico/2208/logo_privacy.svg">
					<p class="footer-certification_desc">
						개인정보보호 우수 웬사이트 ·<br> 개인정보처리시스템 인증(ePRIVACY PLUS)
					</p>
				</li>
				<li class="footer-certification_item" onclick="window.open('');">
					<img
					class="footer-certification__logo footer-certification__logo--long"
					src="https://res.kurly.com/pc/ico/2208/logo_tosspayments.svg">
					<p class="footer-certification_desc">
						토스페이먼츠 구매안전(에스크로)<br> 서비스를 이용하실 수 있습니다.
					</p>
				</li>
				<li class="footer-certification_item" onclick="window.open('');">
					<img class="footer-certification_logo"
					src="https://res.kurly.com/pc/ico/2208/logo_wooriBank.svg">
					<p class="footer-certification_desc">
						고객님이 현금으로 결제한 금액에 대해 우리은행과<br> 채무지급보증 계약을 체결하여 안전거래를 보장하고<br>
						있습니다.
					</p>
				</li>
			</ul>
		</div>
		<div class="footer-full">
			<span class="footer-copyright">© OLGA CORP . ALL RIGHTS
				RESERVED</span>
		</div>
	</footer>


	<!-- =======================푸터 끝======================= -->
</body>
<script>
	var bestPdContentTag = '<div class="container">';
	var bestPdPagingTag = "";

	$.each(
					bestPdPageList,
					function(key, value) {
						if ((key % 5) === 0) {
							bestPdContentTag += '<div class="row">';
						} //4열이므로
						bestPdContentTag += '<div class="col"><div class="card mb-3 img_hover_paraentDiv">';
						// 상품이미지 => 임의로 넣은값, 상품레코드의 값 쓰고싶다면 수정하기
						bestPdContentTag += '<a href="/goods/detailView?pdId='
								+ value.pdId
								+ '"><img src="/resources/pdimages/pd_default.jpg" class="card-img-top pdImg" alt="기본이미지"></a>';
						bestPdContentTag += '<div class="img_absolute"><button class="img_absolute_cartBtn" value="'+value.pdId+'"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="white" class="bi bi-cart2" viewBox="0 0 16 16"><path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/></svg></button></div>';
						/* 단순 전달용 태그 - 시작 */
						bestPdContentTag += '<input type="hidden" name="pdPrice'+value.pdId+'" value="'+value.pdPrice+'">'; //증감기능에 상품가격 전달용도
						bestPdContentTag += '<input type="hidden" name="pdSale'+value.pdId+'" value="'+value.pdSale+'">'; //증감기능에 상품할인가 전달용도
						bestPdContentTag += '<input type="hidden" name="pdName'+value.pdId+'" value="'+value.pdName+'">'; //증감기능에 상품명 전달용도
						bestPdContentTag += '<input type="hidden" name="pdstlBrandName'+value.pdId+'" value="'+value.pdstlBrandName+'">'; //증감기능에 상품브랜드명 전달용도
						/* 단순 전달용 태그 - 끝 */
						bestPdContentTag += '<div class="card-body">';
						bestPdContentTag += '<h5 class="card-title">['
								+ value.pdstlBrandName + ']</h5>';
						bestPdContentTag += "<span><a href='/goods/detailView?pdId="
								+ value.pdId
								+ "'>"
								+ value.pdName
								+ "</a></span></br>";
						if (value.pdSale > 0) {
							//할인하는상품=>정가/할인율/할인가 모두 표시
							bestPdContentTag += "<span class='pdSale_sale'>"
									+ value.pdSale + "%</span>&nbsp;";
							bestPdContentTag += "<span class='pdSale_totalPrice'>"
									+ ((value.pdPrice) * (100 - value.pdSale) / 100)
											.toLocaleString('ko-KR')
									+ "원</span></br>";
							bestPdContentTag += "<span class='pdSale_originPrice'>"
									+ value.pdPrice.toLocaleString('ko-KR')
									+ "원</span>";
						} else {
							//NO할인
							bestPdContentTag += "<p class='pdPrice' >"
									+ value.pdPrice.toLocaleString('ko-KR')
									+ "원</p>";
						}
						bestPdContentTag += '</div>';
						bestPdContentTag += '</div></div>'; // col끝

						if ((bestPdPageList.length % 5) !== 0) { // 한 행이4개보다 적을 경우가 생긴다면 마지막에 빈 개수만큼 채워줘야함
							if (key === bestPdPageList.length - 1) { //마지막줄에만 적용해야하므로 ( 메인태그 다 만들고 부족한 개수만큼 추가)
								for (let k = 0; k < (4 - (bestPdPageList.length % 4)); k++) {
									bestPdContentTag += '<div class="col"><div>';
									bestPdContentTag += '<div>';
									bestPdContentTag += '</div>';
									bestPdContentTag += '</div></div>';
								}
							}
						}

						if ((key % 4) === 3) {
							bestPdContentTag += '</div>';
						} //row끝    
					});

	bestPdContentTag += '</div>';

	// 페이지 결과리스트가 비어있는가 검사 => 필터여러개 적용시 결과리스트에 상품이 하나도 없을 수 있으므로
	if (bestPdPageList.length === 0) {
		// 필터에 해당하는 결과가 없음
		let noResultFound = '';
		noResultFound += '</br></br></br></br>';
		noResultFound += '<div class="container text-center"><div class="row">';
		noResultFound += '<div class="col col-lg-3"></div>';
		noResultFound += '<div class="col">';
		noResultFound += '<p style="color:red">선택하신 필터에 해당하는 상품이 없습니다.</p>';
		noResultFound += '<button id="filter_reload" class="btn" onclick="filter_reload()"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/><path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/></svg><strong>초기화</strong></button>';
		noResultFound += '</div>';
		noResultFound += '<div class="col col-lg-3"></div>';
		noResultFound += '</div></div>';
		$("#bestPdResultList").html(noResultFound); //메인 컨텐츠 적용
	} else {
		// 결과가 1개이상
		$("#bestPdResultList").html(bestPdContentTag); //메인 컨텐츠 적용
	}
</script>
</html>