<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<style>
.temp_memId, .temp_typeSelRadio{
	display:none;
}	
.mode_display{
	background-color: rgb(234, 44, 0);
    color: #fff;
    height: 30px;
    width: 120px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.upd_btn{
	cursor: pointer;
	background-color: rgb(234, 44, 0);
    color: #fff;
    height: 40px;
    width: 200px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
</style>
<body>
<span class="temp_memId">${memId}</span><span class="temp_typeSelRadio">${typeSelRadio}</span>
<div class="mode_display"></div>
<div class="form_wrap">
	<form class="form_tag" method="get">
			<input class="typeSelRadio" type="text" hidden="hidden" name="typeSelRadio"/>
			<label for="">아이디<input type="text" class="id_input" readonly="readonly" name="memId"/></label><br />
			<label for="">비밀번호<input type="text" class="pw_input" name="memPwd"/></label>
			<div class="pwd_alert_box"></div>
			<label for="">비밀번호 확인<input type="text" class="pwck_input"/></label>
			<div class="pwck_alert_box"></div>
		<div class="btn_wrap">
			<button class="upd_btn" type="button">비밀번호 수정</button>
		</div>
	</form>
</div>
<!-- <button class="god">전능한 버튼</button> -->
</body>
<script>
let memId = $(".temp_memId").text();
let typeSelRadio = $(".temp_typeSelRadio").text();
let pwdFormatCheck = false;
let pwdChekerFormatCheck = false;

// $(".god").click(function(){
// 	console.log("pwdFormatCheck   "+pwdFormatCheck);
// 	console.log("pwdChekerFormatCheck    "+pwdChekerFormatCheck);
// });

$(document).ready(function(){
	if(typeSelRadio === "normalMem"){
		//일반회원임
		$(".mode_display").text("일반회원");
		$(".id_input").val(memId);
		$(".typeSelRadio").val(typeSelRadio);
	}else{
		//판매자회원임
		$(".mode_display").text("판매자");
		$(".id_input").val(memId);
		$(".typeSelRadio").val(typeSelRadio);
	}
});

$(".upd_btn").click(function(){
	if($(".pw_input").val().length==0){$('.warn_msg').css('display','block');$(".pwd_alert_box").html("<p style='color: red'>비밀번호를 입력하세요.</p>");return false;}
	if($(".pwck_input").val().length==0){$('.warn_msg').css('display','block');$(".pwck_alert_box").html("<p style='color: red'>비밀번호확인란을 입력하세요.</p>");return false;}
	// 모든 입력칸 입력됨
	
	if(pwdFormatCheck && pwdChekerFormatCheck){
		$(".form_tag").attr("action", "/member/updatePwdAct");
		$(".form_tag").submit();
	}
	return false;
});

/* 비밀번호 형식 검사 */

$('.pw_input').keyup( function() {
	if(!pwdFormatChk($('.pw_input').val())){
		$('.pwd_alert_box').css('display','block');
		$('.pwd_alert_box').html("<span style='color: red'>숫자+영문자+특수문자 조합으로 8~25자리 이상 사용해야 합니다</span>");
		pwdFormatCheck = false;
		if(pwdChekerFormatCheck){
		// 비밀번호 + 비밀번호 확인 모두 통과했는데 비밀번호만 바꿔서 형식 틀릴경우	
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호 형식을 확인하세요</span>");
			$('.pwck_input').val(null);
		}
	}else{
		let pwdOrigin_temp = $('.pwck_input').val();
		let pwdChekcer_temp = $('.pw_input').val();
		if(pwdOrigin_temp !== pwdChekcer_temp){
	 		//비밀번호 + 비밀번호 확인 모두 통과하고 비밀번호를 바꿨는데(=비밀번호랑 비밀번호 확인이랑 다른 경우) 형식은 맞은 경우
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호와 동일하지 않습니다</span>");
			pwdChekerFormatCheck = false;
	 	}
// 	 	$('.pwd_alert_box').css('display','none');
	 	$('.pwd_alert_box').html("<span style='color: green'>비밀번호 형식 검사 완료</span>");
	 	$('.pwck_input').val(null);
	 	pwdFormatCheck = true;
	}
});

function pwdFormatChk(value) {
	const pattern = new RegExp("^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$");
	return pattern.test(value);
}

/* 비밀번호확인란 동일성 검사 */

$('.pwck_input').keyup( function() {
	let pwdOrigin = $('.pwck_input').val();
	let pwdChekcer = $('.pw_input').val();
	if(pwdOrigin !== pwdChekcer){
		$('.pwck_alert_box').css('display','block');
		$('.pwck_alert_box').html("<span style='color: red'>비밀번호와 동일하지 않습니다</span>");
		pwdChekerFormatCheck = false;
	}else{
		if(pwdFormatCheck){
// 	 	$('.pwck_alert_box').css('display','none');
	 	$('.pwck_alert_box').html("<span style='color: green'>동일성 검사 완료</span>");
	 	pwdChekerFormatCheck = true;
		}else{
			//이 경우는 동일한데 형식이 안맞는 경우
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호 형식을 확인하세요</span>");
		}
	}
});


</script>
</html>