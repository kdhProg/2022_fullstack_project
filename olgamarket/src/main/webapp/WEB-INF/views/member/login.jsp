<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 모달 창 시작 */
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.7);
  top:0; left:0;
  display:none;
}

.modal_content{
  width:300px; height:120px;
  background:#fff; border-radius:20px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box;
  padding:20px 0;
}
.modal_msg{
	font-weight: bold;
	text-align: center;
	padding: 10px 0;;
}
.modal_btn{
	cursor:pointer;
	font-weight: bold;
	color: tomato;
	padding-bottom:10px;	
}
/* 모달 창 끝 */
/* 로그인 에러 메시지 */
#loginErrorMsg{
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
<h1>로그인</h1>
<!-- 일반회원/판매자 토글 버튼 : 컨트롤러에서 value를 보고 판단하도록 한다. -->

<div id="formWrapper">
	<form id="loginForm" action="/member/login" method="post">
		<div class="typeSelect_btn_wrap">
			<input type="radio" id="typeSel1" name="typeSelRadio" value="normalMem" checked="checked"><label for="typeSel1">일반회원 로그인</label>
			<input type="radio" id="typeSel2" name="typeSelRadio" value="sellerMem" ><label for="typeSel2">판매자 로그인</label>
		</div>
		<input type="text" id="memIdInputBox" placeholder="아이디 입력" name="memId"/>
		<input type="password" id="memPwdInputBox" placeholder="비밀번호 입력" name="memPwd"/>
		<button id="loginFormBtn">로그인</button>
	</form>
</div>
<div id="preLoginWarn"></div>

<!-- 아래의 loginErrorMsg는 로그인 결과 체크용 -->
<div id="loginErrorMsg">${loginResult}</div>

<a href="/member/join">회원가입하기</a>&nbsp;&nbsp;&nbsp;<a href="">아이디찾기</a>&nbsp;&nbsp;&nbsp;<a href="">비밀번호찾기</a>

<div class="modal">
  <div class="modal_content">
  	<div class="modal_msg">
  	아이디,비밀번호를 확인하세요
  	</div>
  	<hr />
    <div class="modal_btn">
    	확인
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
	$("#loginFormBtn").click(function(){
		if($("#memIdInputBox").val().length==0){$('#preLoginWarn').css('display','block');$("#preLoginWarn").html("<p style='color: red'>아이디를 입력하세요.</p>");return false;}
		if($("#memPwdInputBox").val().length==0){$('#preLoginWarn').css('display','block');$("#preLoginWarn").html("<p style='color: red'>비밀번호를 입력하세요.</p>");return false;}
	});
});

$("#memIdInputBox").keyup(function(){
	if($("#memIdInputBox").val() ==""){
		$('#preLoginWarn').css('display','block');
		$("#preLoginWarn").html("<p style='color: red'>아이디를 입력하세요.</p>");
	}else{
		$('#preLoginWarn').css('display','none');
	}
})

$("#memPwdInputBox").keyup(function(){
	if($("#memPwdInputBox").val()==""){
		$('#preLoginWarn').css('display','block');
		$("#preLoginWarn").html("<p style='color: red'>비밀번호를 입력하세요.</p>");
	}else{
		$('#preLoginWarn').css('display','none');
	}
})

let loginRst = $("#loginErrorMsg").text();
// console.log("loginRst"+loginRst);

$(function(){ 
	
	if(loginRst == "failed"){$(".modal").fadeIn();}
	  
	  $(".modal_btn").click(function(){
	    $(".modal").fadeOut();
	  });
	  
	});
</script>

</body>
</html>