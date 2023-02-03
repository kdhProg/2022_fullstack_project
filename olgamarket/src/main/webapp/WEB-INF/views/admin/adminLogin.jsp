<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>


/* 로그인 에러 메시지 */
#loginErrorMsg{
	display: none;
}
* {
	/* 초기화 */
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    letter-spacing: 0;
    word-spacing: 0;
}
/* 로그인 에러 메시지 */
#loginErrorMsg{
	display: none;
}

.login_form_wrap{
	width:70%;
}
/* row 간격늘리기 */
.row_margin{
	margin-bottom: 10px;
}

/* 테스트 */
.col{
/* 	border:1px solid red; */
}

/* a태그 장식 없애기 */
a{
	text-decoration: none;
	color:black;
}

/* 큰버튼 */
.bigBtn{
	height: 40px;
	width:275px;
    font-weight: bold;
    font-size: 15px;
}

/* 모달 가운데 정렬 */
.center-align{
	text-align: center;
	vertical-align:middle;
	font-weight: bold;
}

/* 메인 타이틀 */
.join_title{
	font-weight: bold;
	font-size: 20px;
}

.find_font{
	font-weight: bold;
	font-size: 12px;
}
.container{
	margin-top : 200px;
}
.h{
	margin-left : 300px;
}
</style>
<body>

<div class="container">
<h1 class="h">관리자 로그인 페이지</h1>
<br />
	<div class="row">
		<form id="loginForm" action="/admin/adminLogin" method="post">
			<div class="row">
				<div class="col col-lg-3"></div>
			  	<div class="col">
			    	<label for="exampleInputEmail1" class="form-label">Admin Id</label>
			    	<input class="form-control" type="text" id="memIdInputBox" placeholder="아이디 입력" name="admId">
			    	<div id="emailHelp" class="form-text"></div>
				</div>
			<div class="col col-lg-3"></div>
			</div>
			<div class="row">
				<div class="col col-lg-3"></div>
			 	<div class="col">
			    	<label for="exampleInputPassword1" class="form-label">Password</label>
			    	<input class="form-control" type="password" id="memPwdInputBox" placeholder="비밀번호 입력" name="admPwd">
			  	</div>
				<div class="col col-lg-3"></div>
			</div>
			<br />
			<div class="row">
		 		<div class="col col-lg-8"></div>
		 			<div class="col">
		  				<button type="submit" id="loginFormBtn" class="btn btn-primary">Login</button>
					</div>
				<div class="col col-lg-8"></div>
			</div>	
		</form>
	</div>
	<div class="row">
		<div id="preLoginWarn" class="col text-center"></div>
	</div>
</div>

<!-- 아래의 loginErrorMsg는 로그인 결과 체크용 -->
<div id="loginErrorMsg">${loginResult}</div>

<!-- 모달창-로그인 -->
<div id="login_warn_modal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
		<p>아이디,비밀번호를 확인하세요</p>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
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
});

$("#memPwdInputBox").keyup(function(){
	if($("#memPwdInputBox").val()==""){
		$('#preLoginWarn').css('display','block');
		$("#preLoginWarn").html("<p style='color: red'>비밀번호를 입력하세요.</p>");
	}else{
		$('#preLoginWarn').css('display','none');
	}
});

let loginRst = $("#loginErrorMsg").text();
// console.log("loginRst"+loginRst);

$(document).ready(()=>{
	if(loginRst == "failed"){$("#login_warn_modal").modal("show");return false;}  
});

</script>
</body>
</html>