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
/* 사업자 등록번호는 처음에는 안보임 */
.form_selRegiNum{
	display: none;
}

/* 회원/판매자 토글 시작*/
.typeSelect_btn_wrap {
    padding: 15px 10px;
}
.typeSelect_btn_wrap input[type=radio]{
    display: none;
}
.typeSelect_btn_wrap input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 30px;
    width: 120px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.typeSelect_btn_wrap input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.typeSelect_btn_wrap input[type=radio]:checked+label{
    background-color: rgb(234, 44, 0);
    color: #fff;
}
/* 회원/판매자 토글 끝*/
</style>
<body>
<div class="entire_wrap">
	<div class="form_wrap">
		<form id="find_pwd_form" method="post">
			<div class="typeSelect_btn_wrap">
				<input type="radio" id="typeSel1" name="typeSelRadio" value="normalMem" checked="checked"><label for="typeSel1">일반회원</label>
				<input type="radio" id="typeSel2" name="typeSelRadio" value="sellerMem" ><label for="typeSel2">판매자</label>
			</div>
			<label for=""><input class="form_id" name="memId" type="text" placeholder="아이디입력"/></label>
			<label for=""><input class="form_name" name="memName" type="text" placeholder="이름입력" maxLength="5"/></label>
			<label for=""><input class="form_phone" name="memPhone" type="text" oninput="autoHyphen(this)" placeholder="전화번호 입력" maxLength="13"/></label>
			<div class="selRegiNum_wrap">
				<label for=""><input class="form_selRegiNum" name="selRegiNum" type="text" placeholder="사업자등록번호 입력" 
				maxLength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></label>
			</div>
		</form>
		<button class="pwd_check_btn">비밀번호 수정</button>
	</div>
	<div class="warn_msg"></div>
	<div class="result_wrap"></div>
</div>
<a href="/member/login">로그인</a>
</body>
<script>
let sellerSelected = false;
$(".pwd_check_btn").click(function(){
	if($(".form_id").val().length==0){$('.warn_msg').css('display','block');$(".warn_msg").html("<p style='color: red'>아이디를 입력하세요.</p>");return false;}
	if($(".form_name").val().length==0){$('.warn_msg').css('display','block');$(".warn_msg").html("<p style='color: red'>이름를 입력하세요.</p>");return false;}
	if($(".form_phone").val().length==0){$('.warn_msg').css('display','block');$(".warn_msg").html("<p style='color: red'>전화번호를 입력하세요.</p>");return false;}
	if(sellerSelected){
		if($(".form_selRegiNum").val().length==0){$('.warn_msg').css('display','block');$(".warn_msg").html("<p style='color: red'>사업자등록번호를 입력하세요.</p>");return false;}
	}
	// 모든 입력칸 입력됨
	let memId = $(".form_id").val();
	let memName = $(".form_name").val();
	let memPhone = $(".form_phone").val();
	let selSelRegiNo;
	if(sellerSelected){
		//판매자면 값 담기
		selSelRegiNo = $(".form_selRegiNum").val();
	}else{
		//일반회원의 경우
		selSelRegiNo = "defaultMember";
	}
	$.ajax({
		type : "get",
		url : "/member/findPwdAct",
		data : {
			memId : memId,
			memName : memName,
			memPhone : memPhone,
			selSelRegiNo : selSelRegiNo
		},
		success : function(result){
			if(result != "failed"){
				// 성공 => 비밀번호 수정폼으로 이동
				$("#find_pwd_form").attr("action", "/member/updatePwdForm");
				$("#find_pwd_form").submit();
			}else{
				// 찾기 실패
				$('.warn_msg').css('display','block');
				$('.warn_msg').html("<span style='color: red'>정보가 맞지 않습니다</span>");	
			}
		}// success 종료
	}); // ajax 종료	
});

$(".form_id").keyup(function(){
	if($(".form_id").val()==""){
		$('.warn_msg').css('display','block');
		$(".warn_msg").html("<p style='color: red'>아이디를 입력하세요.</p>");
	}else{
		$('.warn_msg').css('display','none');
	}
});

$(".form_name").keyup(function(){
	if($(".form_name").val()==""){
		$('.warn_msg').css('display','block');
		$(".warn_msg").html("<p style='color: red'>이름을 입력하세요.</p>");
	}else{
		$('.warn_msg').css('display','none');
	}
});

$(".form_phone").keyup(function(){
	if($(".form_phone").val()==""){
		$('.warn_msg').css('display','block');
		$(".warn_msg").html("<p style='color: red'>전화번호를 입력하세요.</p>");
	}else{
		$('.warn_msg').css('display','none');
	}
});

$(".form_selRegiNum").keyup(function(){
	if(sellerSelected){
		if($(".form_selRegiNum").val()==""){
			$('.warn_msg').css('display','block');
			$(".warn_msg").html("<p style='color: red'>사업자등록번호를 입력하세요.</p>");
		}else{
			$('.warn_msg').css('display','none');
		}
	}
});

//전화번호 오토하이픈
function autoHyphen(target){
	return target.value = target.value.replace(/[^0-9]/g, '')
	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	.replace(/(\-{1,2})$/g, "");
}


/* 판매자 회원 버튼 토글 */

//판매자 모드
$("#typeSel2").click(function(){
	$(".form_selRegiNum").css('display','block');
	$('.warn_msg').css('display','none');
	sellerSelected = true;
});

//일반 모드
$("#typeSel1").click(function(){
	$(".form_selRegiNum").css('display','none');
	$('.warn_msg').css('display','none');
	sellerSelected = false;
});

</script>
</html>