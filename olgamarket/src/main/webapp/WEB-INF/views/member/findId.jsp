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
		<form action="/member/findIdAct">
			<div class="typeSelect_btn_wrap">
				<input type="radio" id="typeSel1" name="typeSelRadio" value="normalMem" checked="checked"><label for="typeSel1">일반회원</label>
				<input type="radio" id="typeSel2" name="typeSelRadio" value="sellerMem" ><label for="typeSel2">판매자</label>
			</div>
			<label for=""><input class="form_name" type="text" placeholder="이름입력" maxLength="5"/></label>
			<label for=""><input class="form_phone" type="text" oninput="autoHyphen(this)" placeholder="전화번호 입력" maxLength="13"/></label>
		</form>
		<button class="find_btn">찾기</button>
	</div>
	<div class="warn_msg"></div>
	<div class="result_wrap"></div>
</div>
<a href="/member/login">로그인</a>&nbsp;&nbsp;<a href="/member/findPwd">비밀번호찾기</a>
</body>
<script>

$(".find_btn").click(function(){
	if($(".form_name").val().length==0){$('.warn_msg').css('display','block');$(".warn_msg").html("<p style='color: red'>아이디를 입력하세요.</p>");return false;}
	if($(".form_phone").val().length==0){$('.warn_msg').css('display','block');$(".warn_msg").html("<p style='color: red'>전화번호를 입력하세요.</p>");return false;}
	// 모든 입력칸 입력됨
	let memName = $(".form_name").val();
	let memPhone = $(".form_phone").val();
	$.ajax({
		type : "get",
		url : "/member/findIdAct",
		data : {
			memName : memName,
			memPhone : memPhone
		},
		success : function(result){
			if(result != "failed"){
				$('.warn_msg').css('display','block');
				$('.warn_msg').html("<span style='color: green'>아이디를 찾았습니다: "+result+"</span>");	
			}else{
				$('.warn_msg').css('display','block');
				$('.warn_msg').html("<span style='color: red'>아이디가 존재하지 않습니다</span>");	
			}
		}// success 종료
	}); // ajax 종료	
});

$(".form_name").keyup(function(){
	if($(".form_name").val()==""){
		$('.warn_msg').css('display','block');
		$(".warn_msg").html("<p style='color: red'>아이디를 입력하세요.</p>");
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

//전화번호 오토하이픈
function autoHyphen(target){
	return target.value = target.value.replace(/[^0-9]/g, '')
	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	.replace(/(\-{1,2})$/g, "");
}

</script>
</html>