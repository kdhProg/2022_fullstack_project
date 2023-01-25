<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
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

/* 판매자/일반회원 선택버튼 => 버튼의 label태그에 붙어있음 */
.typebtn{ 
      height: 40px;
      width: 120px;
      font-weight: bold;
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
</style>
<body>
<!-- 아래의 loginErrorMsg는 로그인 결과 체크용 -->
<div id="loginErrorMsg">${loginResult}</div>
<div class="container">
	<div class="login_form_wrap container text-center">
		<div class="row_margin row">
			<div class="col col-lg-2">
			</div>
			<div class="col">
				<span class="join_title">로그인</span>
			</div>
			<div class="col col-lg-2">
			</div>
		</div>
		<form id="loginForm" class="form-horizontal" action="/member/login" method="post">
			<div class="inside_form_wrap">
				<!-- 일반회원/판매자 토글 버튼 : 컨트롤러에서 value를 보고 판단하도록 한다. -->
				<div class="typeSelect_btn_wrap row_margin row justify-content-center">
				    <div class="col col-lg-3">
			    		<input type="radio" class="btn-check" name="typeSelRadio" id="typeSel1" value="normalMem" autocomplete="off" checked="checked">
						<label class="typebtn btn btn-outline-danger" for="typeSel1">일반회원</label>
				    </div>
				    <div class="col col-lg-3">
				   		<input type="radio" class="btn-check" name="typeSelRadio" id="typeSel2" value="sellerMem" autocomplete="off">
						<label class="typebtn btn btn-outline-danger" for="typeSel2">판매자회원</label>
				    </div>
			    </div>
			    <div class="row_margin row">
			    	<div class="col col-lg-4"></div>
			    	<div class="col">
			    		<input type="text" id="memIdInputBox" class="form-control" placeholder="아이디를 입력하세요" name="memId"/>
			    	</div>
			    	<div class="col col-lg-4"></div>
			    </div>
			    <div class="row_margin row">
			    	<div class="col col-lg-4"></div>
			    	<div class="col">
			    		<input type="password" id="memPwdInputBox" class="form-control" placeholder="비밀번호를 입력하세요" name="memPwd"/>
			    	</div>
			    	<div class="col col-lg-4"></div>
			    </div>
			    <div class="row_margin row">
			    	<div class="col col-lg-4"></div>
			    	<div class="find_font col">
			    		<a href="/member/findId">아이디찾기</a>
			    	</div>
			    	<div class="find_font col">
			    		<a href="/member/findPwd">비밀번호찾기</a>
			    	</div>
			    	<div class="col col-lg-4"></div>
			    </div>
			    <div class="row_margin row">
			    	<div class="col col-lg-4"></div>
			    	<div class="col">
			    		<button id="loginFormBtn" class="bigBtn btn btn-danger">로그인</button> 		
			    	</div>
			    	<div class="col col-lg-4"></div>
			    </div>
			    <div class="row_margin row">
			    	<div class="col col-lg-4"></div>
			    	<div class="col">
			    		<button type="button" id="memJoinBtn" class="bigBtn btn btn-outline-danger">회원가입</button> 		
			    	</div>
			    	<div class="col col-lg-4"></div>
			    </div>
		    </div>
	    </form>
	</div>
</div>

<div id="validataion_warm_msg" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="center-align modal-body">
        <p>아이디,비밀번호를 확인하세요</p>
      </div>
      <div class="center-align modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
	$("#loginFormBtn").click(function(){
		if($("#memIdInputBox").val().length==0){$('#validataion_warm_msg').modal("show");return false;}
		if($("#memPwdInputBox").val().length==0){$('#validataion_warm_msg').modal("show");return false;}
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

// 로그인 실패시 모달값 가져오기
let loginRst = $("#loginErrorMsg").text();
// console.log("loginRst"+loginRst);

// 모달값 판단 메서드
$(document).ready(function(){
	if(loginRst == "failed"){$('#validataion_warm_msg').modal("show");}
});

// 회원가입창 이동
$("#memJoinBtn").click(function(){
// 	location.replace("/member/join");
	location.href = "/member/join";
});

/* 약관 모달 */
$('#validataion_warm_msg').click(function(e){
e.preventDefault();
$('#validataion_warm_msg').modal("show");
});
</script>

</body>
</html>