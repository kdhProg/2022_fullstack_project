<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.card{
	margin : 40px;
}

/* a태그 기본 디자인 제거 */
a{
	text-decoration: none;
	color:black;
}
/* 빨강 + 볼드 */
.red_font{
	font-weight: bold;
	color: red;
}
.col{
/* 	border: 1px solid red; */
}
</style>
<body>
<div class="container">
	<!-- 오늘의 할일 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h4 class="card-title"><strong>오늘의 할일</strong></h4>
			<div class="container">
				<div class="row">
					<div class="col text-end">
						<b>판매자 신상품 문의</b>
					</div>
					<div class="col col-lg-1 text-start">
						<a href="/admin/seller"><span id="seller_newPd_quiry" class="red_font"></span></a>
					</div>
					<div class="col text-end">
						<b>판매자 상품 문의</b>
					</div>
					<div class="col col-lg-1 text-start">
						<a href="/admin/seller"><span id="seller_Pd_quiry" class="red_font"></span></a>
					</div>
					<div class="col text-end">
						<b>일반회원 상품 문의</b>
					</div>
					<div class="col col-lg-1 text-start">
						<a href="/admin/product"><span id="mem_Pd_quiry" class="red_font"></span></a>
					</div>
					<div class="col text-end">
						<b>일반회원 1:1 문의</b>
					</div>
					<div class="col col-lg-1 text-start">
						<a href="/admin/clientList"><span id="mem_oto_quiry" class="red_font"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 판매점 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">스토어</h5>
			<p class="card-text">스토어 추가 / 스토어 정보 수정</p>
			<a href="/admin/storeList" class="btn btn-primary">스토어 관리하러 가기</a>
		</div>
	</div>
	<!-- 판매자 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">셀러</h5>
			<p class="card-text">셀러 목록 / 신상품 등록 문의 / 셀러 문의</p>
			<a href="/admin/seller" class="btn btn-primary">셀러 관리하러 가기</a>
		</div>
	</div>
	<!-- 상품 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">상품</h5>
			<p class="card-text">상품 등록 / 목록 / 상품 문의</p>
			<a href="/admin/product" class="btn btn-primary">판매점 관리하러 가기</a>
		</div>
	</div>
	<!-- 고객센터 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">고객센터</h5>
			<p class="card-text">공지사항 / FAQ / 1 대 1 문의</p>
			<a href="/admin/clientList" class="btn btn-primary">고객센터 관리하러 가기</a>
		</div>
	</div>
	<!-- 회원 등급 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">회원 관리</h5>
			<p class="card-text">회원 등급 조정</p>
			<a href="/admin/memberGrade" class="btn btn-primary">회원등급 관리하러 가기</a>
		</div>
	</div>
	<!-- 통계 -->
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title">통계</h5>
			<p class="card-text">방문자 / 판매량 / 매출액</p>
			<a href="/admin/adminStats" class="btn btn-primary">통계 보러 가기</a>
		</div>
	</div>
	
	<div class="card" style="width: 75rem;">
		<div class="card-body">
			<h5 class="card-title"></h5>
			<p class="card-text"></p>
			<a href="/adminLogout" class="btn btn-danger">로그아웃</a>
		</div>
	</div>
</div>
</body>
<script>
// 상단 오늘의 할일 세팅
$(document).ready(()=>{
	$.ajax({
        url : "/admin/setTodayWorks",
        type : "get",
        data : {
        },
        success : function(rst){
        	
       	let memQuiry = rst.memQuiry;
       	let memOneqn = rst.memOneqn;
       	let sellerNpd = rst.sellerNpd;
       	let sellerPd = rst.sellerPd;
		
       	$("#seller_newPd_quiry").text(sellerNpd);
       	$("#seller_Pd_quiry").text(sellerPd);
       	$("#mem_Pd_quiry").text(memQuiry);
       	$("#mem_oto_quiry").text(memOneqn);
        },
        error : function(){
             alert('error - setTodayWorks');
        }//error
    });//ajax
});
</script>
</html>