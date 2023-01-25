<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
/* 판매자/일반회원 선택버튼 => 버튼의 label태그에 붙어있음 */
.typebtn{ 
      height: 40px;
      width: 120px;
      font-weight: bold;
}
/* 사업자 등록번호는 처음에는 안보임 */
.form_selRegiNum,.success_result{
	display: none;
}
/* a태그 장식 없애기 */
a{
	text-decoration: none;
	color:black;
}
/* 메인 타이틀 */
.main_title{
	font-weight: bold;
	font-size: 20px;
}
/* row 간격늘리기 */
.row_margin{
	margin-bottom: 10px;
}

.find_pwd_wrap{
	width:70%;
}

/* 모달 가운데 정렬 */
.center-align{
	text-align: center;
	vertical-align:middle;
	font-weight: bold;
}

/* 로그인/비찾 폰트 */
.find_font{
	font-weight: bold;
	font-size: 12px;
}

/* 찾기버튼 */
.pwd_check_btn{
	height: 40px;
	width:300px;
    font-weight: bold;
    font-size: 15px;
}

/* 테스트 */
.col{
/* 	border:1px solid red; */
}
</style>
<body>
<div class="find_pwd_wrap container text-center">
	<div class="row">
		<div class="col col-lg-2">
		</div>
		<div class="col">
			<span class="main_title">비밀번호 찾기</span>
		</div>
		<div class="col col-lg-2">
		</div>
	</div>
	<form id="find_pwd_form" class="form-horizontal" method="post">
		<div class="row_margin inside_form_wrap">
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
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input class="form_id form-control" name="memId" type="text" placeholder="아이디를 입력하세요"/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input class="form_name form-control" name="memName" type="text" placeholder="성함을 입력하세요" maxLength="5"/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input class="form_phone form-control" name="memPhone" type="text" oninput="autoHyphen(this)" placeholder="전화번호를 입력하세요" maxLength="13"/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<input class="form_selRegiNum form-control" name="selRegiNum" type="text" placeholder="사업자등록번호를 입력하세요" maxLength="10" 
	    		oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
	    <div class="row_margin row">
		    <div class="col col-lg-4"></div>
	    	<div class="col">
	    		<button type="button" class="pwd_check_btn btn btn-danger">비밀번호 수정</button>
	    	</div>
	    	<div class="col col-lg-4"></div>
	    </div>
    </form>
</div>
<!-- 모달창 -->
<div id="validataion_warm_msg" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal_msg center-align modal-body">

      </div>
      <div class="center-align modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
let sellerSelected = false;
$(".pwd_check_btn").click(function(){
	if($(".form_id").val().length==0){$(".modal_msg").html("<p>아이디를 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
	if($(".form_name").val().length==0){$(".modal_msg").html("<p>성함을 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
	if($(".form_phone").val().length==0){$(".modal_msg").html("<p>전화번호를 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
	if(sellerSelected){
		if($(".form_selRegiNum").val().length==0){$(".modal_msg").html("<p>사업자등록번호를 입력하세요.</p>");$('#validataion_warm_msg').modal("show");return false;}
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
				$(".modal_msg").html("<p>올바르지 않은 정보입니다.</p>");
				$('#validataion_warm_msg').modal("show");
			}
		}// success 종료
	}); // ajax 종료	
});

// $(".form_id").keyup(function(){
// 	if($(".form_id").val()==""){
// 		$('.warn_msg').css('display','block');
// 		$(".warn_msg").html("<p style='color: red'>아이디를 입력하세요.</p>");
// 	}else{
// 		$('.warn_msg').css('display','none');
// 	}
// });

// $(".form_name").keyup(function(){
// 	if($(".form_name").val()==""){
// 		$('.warn_msg').css('display','block');
// 		$(".warn_msg").html("<p style='color: red'>이름을 입력하세요.</p>");
// 	}else{
// 		$('.warn_msg').css('display','none');
// 	}
// });

// $(".form_phone").keyup(function(){
// 	if($(".form_phone").val()==""){
// 		$('.warn_msg').css('display','block');
// 		$(".warn_msg").html("<p style='color: red'>전화번호를 입력하세요.</p>");
// 	}else{
// 		$('.warn_msg').css('display','none');
// 	}
// });

// $(".form_selRegiNum").keyup(function(){
// 	if(sellerSelected){
// 		if($(".form_selRegiNum").val()==""){
// 			$('.warn_msg').css('display','block');
// 			$(".warn_msg").html("<p style='color: red'>사업자등록번호를 입력하세요.</p>");
// 		}else{
// 			$('.warn_msg').css('display','none');
// 		}
// 	}
// });

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
// 	$('.warn_msg').css('display','none');
	sellerSelected = true;
});

//일반 모드
$("#typeSel1").click(function(){
	$(".form_selRegiNum").css('display','none');
// 	$('.warn_msg').css('display','none');
	sellerSelected = false;
});

</script>
</html>