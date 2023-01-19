<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
/* 주소는 API로 넣기 전까지는 보이지 않음 */
.daum_address_wrapper{
	display: none;
}

/* 판매자폼은 선택하기 전까지는 보이지 않음 */
.seller_entire_form{
	display: none;
}

.typeSelect_btn_wrap {
    padding: 15px 10px;
}
.typeSelect_btn_wrap input[type=radio]{
    display: none;
}
.typeSelect_btn_wrap input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
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

.join_button{
	display: inline-block;
	background-color: rgb(234, 44, 0);
	color: #fff;
    cursor: pointer;
    height: 60px;
    width: 150px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}

</style>
<body>
<div class="form_wrapper">
	<form id="join_form" method="get">
	<div class="wrap">
		<div class="subjecet">
			<span>회원가입</span>
		</div>
		<!-- 아이디 -->
		<div class="id_wrap">
			<div class="id_name">아이디</div>
			<div class="id_input_box">
				<input class="id_input" name="memId" maxlength="16">
			</div>
			<button type="button" class="id_duplicate_check">아이디 중복검사</button>
			<span class="id_alert_box"></span>
			<span class="id_role_msg"></span>
		</div>
		
		<!-- 비밀번호 -->
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box">
				<input class="pw_input" name="memPwd" maxlength="20">
			</div>
			<span class="pwd_alert_box"></span>			
		</div>
		
		<!-- 비밀번호확인 -->
		<div class="pwck_wrap">
			<div class="pwck_name">비밀번호확인</div>
			<div class="pwck_input_box">
				<input class="pwck_input" name="memPwdck" maxlength="20">
			</div>
			<span class="pwck_alert_box"></span>			
		</div>
		
		<!-- 이름 -->
		<div class="nameBox_wrap">
			<div class="nameBox_name">성명</div>
			<div class="nameBox_input_box">
				<input class="nameBox_input" name="memName" maxlength="5">
			</div>
			<span class="nameBox_alert_box"></span>			
		</div>
		
		<!-- 이메일 -->
		<div class="email_wrap">
			<div class="email_name">이메일</div>
			<div class="email_input_box">
				<input class="email_input" name="memEmail" placeholder="예시: abcde@olga.com">
			</div>
			<button type="button" class="email_duplicate_check">이메일 중복검사</button>
			<span class="email_alert_box"></span>			
		</div>
		
		<!-- 전화번호 -->
		<div class="phone_wrap">
			<div class="phone_name">전화번호</div>
			<div class="phone_input_box">
				<input class="phone_input" name="memPhone" maxlength="13" oninput="autoHypen(this)">
			</div>
			<input type="button" value="인증번호받기(구현X)"/>
			<span class="phone_alert_box"></span>			
		</div>
		
		<!-- 주소 -->
		<div class="address_wrap">
			<div class="address_name">주소</div>
			<div class="address_input_box">
				<div class="daum_address_wrapper">
					<input type="text" id="main_postcode" placeholder="우편번호" readonly="readonly" name="mainPostcode"><br />
					<input type="text" id="main_address" placeholder="주소" readonly="readonly" name="mainAddress"><br>
					<input type="text" class="address_input" id="main_detailAddress" placeholder="상세주소" name="mainDetailAddress"><br />
				</div>
				<input class="daum_address_btn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			</div>
			<span class="address_alert_box"></span>			
		</div>
		
		<!-- 생년월일 -->
		<div class="birth_wrap">
			<div class="birth_name">생일</div>
			<div class="birth_input_box">
				<input type="text" class="birth_input_year" name="memBirthYear" maxlength="4">/
				<input type="text" class="birth_input_month" name="memBirthMonth" maxlength="2" disabled="disabled">/
				<input type="text" class="birth_input_date" name="memBirthDate" maxlength="2" disabled="disabled">
			</div>
			<span class="birth_alert_box"></span>		
			<span class="birth_alert_box_adeYear"></span>	
		</div>
		
		<!-- 성별 -->
		<div class="gender_wrap">
			<div class="gender_name">성별</div>
			<div class="gender_input_box">
				<input type="radio" id="select" name="memGender" value="남성" checked="checked"><label for="select">남성</label>
   				<input type="radio" id="select2" name="memGender" value="여성"><label for="select2">여성</label>
			</div>		
		</div>
		
		<!-- 일반회원/판매자 토글 버튼 : 컨트롤러에서 value를 보고 판단하도록 한다. -->
		<div class="typeSelect_btn_wrap">
			<input type="radio" id="typeSel1" name="typeSelRadio" value="normalMem" checked="checked"><label for="typeSel1">일반회원</label>
			<input type="radio" id="typeSel2" name="typeSelRadio" value="sellerMem" ><label for="typeSel2">판매자회원</label>
		</div>
		
		<!-- ***************************판매자전용 추가 탭*************************** -->
		<!-- 판매자-고유번호 -->
		<div class="seller_entire_form">
			<div class="seller_marketUniqueNo_wrap">
				<div class="seller_marketUniqueNo_name">판매자-발급고유번호</div>
				<div class="seller_marketUniqueNo_input_box">
					<input type="text" class="seller_marketUniqueNo_input" name="selMarketUniqueNo" maxlength="10">
				</div>
				<span class="seller_entire_alert_box"></span>
				<button type="button" class="seller_marketUniqueNo_check">번호검사</button>
			</div>
			
			<!-- 판매자-판매자명>고유번호 통과 시 자동입력 -->
			<div class="seller_brandName_wrap">
				<div class="seller_brandName_name">판매자-판매점명</div>
				<div class="seller_brandName_input_box">
					<input class="seller_brandName_input" name="selstlBrandName" readonly="readonly">
				</div>		
			</div>
			
			<!-- 판매자-사업자등록번호>고유번호 통과 시 자동입력 -->
			<div class="seller_selRegiNo_wrap">
				<div class="seller_selRegiNo_name">판매자-사업자등록번호</div>
				<div class="seller_selRegiNo_input_box">
					<input class="seller_selRegiNo_input" name="selSelRegiNo" maxlength="10" readonly="readonly">
				</div>		
			</div>
		</div>
		<!-- ***************************판매자전용 추가 탭 끝*************************** -->
		
		<fieldset>
		<label>전체선택</label><input class="allCk" type="checkbox"/>
		<!-- 필수약관 -->
		<div class="essential_wrap">
			<div class="essential_name">필수약관</div>
			<div class="essential_select_box">
				<input class="essentialOne" type="checkbox"><label>이용약관 동의(필수)</label><br />
      			<input class="essentialTwo" type="checkbox"><label>개인정보 수집 및 이용동의(필수)</label>
			</div>
			<span class="essential_alert_box"></span>			
		</div>
		
		<!-- 선택약관 -->
		<div class="choice_wrap">
			<div class="choice_name">선택약관</div>
			<div class="choice_select_box">
				<input class="choiceOne" type="checkbox" name="choiceSelectBoxOne" value=1><label>정보수신 이용동의(선택)</label><br />
      			<input class="choiceTwo" type="checkbox" name="choiceSelectBoxTwo" value=10><label>추가 개인정보 수집 및 이용동의(선택)</label><br />
      			<input class="choiceThree" type="checkbox" name="choiceSelectBoxThree" value=100><label>기타 서비스 이용 동의(선택)</label>
			</div>		
		</div>
		</fieldset>
		
			
	</div>
	<input type="button" class="join_button" value="가입하기">
	</form>
</div>
<script>
 /* 기본 유효성 검사(입력여부/체크여부) 통과유무 변수 */
var idCheck = false;			// 아이디
var pwCheck = false;			// 비번
var pwckCheck = false;			// 비번 확인
var nameCheck = false;         // 이름확인
var emailCheck = false;         // 이메일확인
var phoneCheck = false;        // 전화번호체크
// var addressPostcodeCheck = false;        // 우편번호체크
// var addressMainCheck = false;        // 메인주소체크
var addressDetailWriteCheck = false;        // 상세주소체크(나머지 주소는 자동입력이므로)
/*  성별은 기본값(male)이므로 스킵 */
var birthYearCheck = false;        // 생일-연도 체크
var birthMonthCheck = false;        // 생일-월 체크
var birthDateCheck = false;        // 생일-일 체크
var essentialOneCheck = false;        // 필수약관체크1
var essentialTwoCheck = false;        // 필수약관체크2
/* 판매자 전용 */
var sellerMarUniqueNoCheck = false;        // 판매자고유번호 체크

/* 구체적 유효성검사 변수 */
var idDuplCheck = false;        // 아이디 중복 검사
var idFormatCheck = false;        // 아이디 형식 검사
var pwdFormatCheck = false;        // 비밀번호 형식 검사
var pwdChekerFormatCheck = false;        // 비밀번호 확인 검사
var nameFormatCheck = false;         // 이름형식검사
var emailFormatCheck = false;        //이메일 형식 검사
var emailDuplCheck = false;        //이메일 중복 검사
var phoneFormatCheck = false;         // 전화번호형식검사
var birthYearFormatCheck = false;     // 생일-연도 검사
var birthMonthFormatCheck = false;     // 생일-월 검사
var birthDateFormatCheck = false;     // 생일-일 검사
var adequateYearCheck = false;     // 만14세 이상이며 미래에서 오지는 않음

/* 판매자 모드로 선택되었는가? */
var sellerSelected = false;    // 판매자모드일시 true + 다른 유효성 검사 필요해짐
var sellerMarketUniqueNoCheck = false // 판매자 번호를 제대로 입력하였는가


/* 입력값 변수 */
var id;				// id 입력란
var pw;				// 비밀번호 입력란
var pwck;			// 비밀번호 확인 입력란
var name;			// 이름 입력란
var email;			// 이메일 입력란
var phone;			// 전화번호 입력란
var addressDetail;			// 상세주소 입력란
var birthYear;			// 생일-연도 입력란
var birthMonth;			// 생일-월 입력란
var birthDate;			// 생일-일 입력란
var essentialOne;  //필수약관1체크여부
var essentialTwo;  //필수약관2체크여부
var sellerUniqueNo;  //판매자 고유번호 작성여부


	$(".join_button").click(function(){
		id = $('.id_input').val(); 				// id 입력란
		pw = $('.pw_input').val();				// 비밀번호 입력란
		pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란
		name = $('.nameBox_input').val();			// 이름 입력란
		email = $('.email_input').val();			// 이메일 입력란
		phone = $('.phone_input').val();			// 전화번호 입력란
		addressDetail = $('.address_input').val();			// 상세주소 입력란
		birthYear = $('.birth_input_year').val();			// 생일-연도 입력란
		birthMonth = $('.birth_input_month').val();			// 생일-월 입력란
		birthDate = $('.birth_input_date').val();			// 생일-일 입력란
		essentialOne = $('.essentialOne').is(':checked');  //필수약관1체크여부
		essentialTwo = $('.essentialTwo').is(':checked');  //필수약관2체크여부
		sellerUniqueNo = $('.seller_marketUniqueNo_input').val();  //판매자 고유번호 작성여부
		
		/* 아이디 유효성검사 */
		if(id == ""){
			$('.id_alert_box').css('display','block');
			$('.id_alert_box').html("<span style='color: red'>아이디를 입력하세요.</span>");
			$('.id_duplicate_check_msg_wrapper').css('display','none');
			idCheck = false;
		}else{
// 			$('.id_alert_box').css('display', 'none');
			idCheck = true;
		}
		
		/* 비밀번호 유효성 검사 */
		if(pw == ""){
			$('.pwd_alert_box').css('display','block');
			$('.pwd_alert_box').html("<span style='color: red'>비밀번호를 입력하세요.</span>");
			pwCheck = false;
		}else{
// 			$('.pwd_alert_box').css('display', 'none');
			pwCheck = true;
		}
		
		/* 비밀번호 확인 유효성 검사 */
		if(pwck == ""){
			$('.pwck_alert_box').css('display','block');
			$('.pwck_alert_box').html("<span style='color: red'>비밀번호확인 칸을 입력하세요.</span>");
			pwckCheck = false;
		}else{
// 			$('.pwck_alert_box').css('display', 'none');
			pwckCheck = true;
		}
		
		/* 이름 확인 유효성 검사 */
		if(name == ""){
			$('.nameBox_alert_box').css('display','block');
			$('.nameBox_alert_box').html("<span style='color: red'>성함을 입력하세요.</span>");
			nameCheck = false;
		}else{
// 			$('.nameBox_alert_box').css('display', 'none');
			nameCheck = true;
		}
		
		/* 이메일 유효성 검사 */
		if(email == ""){
			$('.email_alert_box').css('display','block');
			$('.email_alert_box').html("<span style='color: red'>이메일을 입력하세요.</span>");
			emailCheck = false;
		}else{
// 			$('.email_alert_box').css('display', 'none');
			emailCheck = true;
		}
		
		/* 전화번호 유효성 검사 */
		if(phone == ""){
			$('.phone_alert_box').css('display','block');
			$('.phone_alert_box').html("<span style='color: red'>전화번호를 입력하세요.</span>");
			phoneCheck = false;
		}else{
// 			$('.phone_alert_box').css('display', 'none');
			phoneCheck = true;
		}
		
		/* 주소 유효성 검사 */
		/* 우편번호하고 메인주소는 자동입력 이므로 상세주소만 반드시 입력하도록 체크한다*/
		if(addressDetail == ""){
			$('.address_alert_box').css('display','block');
			$('.address_alert_box').html("<span style='color: red'>상세주소를 입력하세요.</span>");
			addressDetailWriteCheck = false;
		}else{
			$('.address_alert_box').css('display', 'none');
			addressDetailWriteCheck = true;
		}
		
		/*  성별은 기본값(male)이므로 스킵 */

		
		
		/* 생일 유효성 검사 */
		if(birthYear == "" || birthMonth == "" || birthDate == "" ){
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>생일을 모두 입력해주세요.</span>");
			birthYearCheck = false;
			birthMonthCheck = false;
			birthDateCheck = false;
		}else{
			$('.birth_alert_box').css('display', 'none');
			birthYearCheck = true;
			birthMonthCheck = true;
			birthDateCheck = true;
		}
		
		/* 필수약관 체크 검사 */
		if(!essentialOne || !essentialTwo){
			$('.essential_alert_box').css('display','block');
			$('.essential_alert_box').html("<span style='color: red'>필수약관에 체크해주세요.</span>");
			essentialOneCheck = false;
			essentialTwoCheck = false;
		}else{
			$('.essential_alert_box').css('display', 'none');
			essentialOneCheck = true;
			essentialTwoCheck = true;
		}
		
		/* 판매자면 sellerSelected가 true로 바뀜 */
		if(sellerSelected == true){
			//판매자 모드라는 뜻
			/* 판매자 고유번호 유효성 검사 - 나머지 2개는 자동입력이므로 필요 X */
			if(sellerUniqueNo==""){
				$('.seller_entire_alert_box').css('display','block');
				$('.seller_entire_alert_box').html("<span style='color: red'>발급받은 고유번호를 입력하세요.</span>");
				sellerMarUniqueNoCheck = false;
			}else{
				$('.seller_entire_alert_box').css('display', 'none');
				sellerMarUniqueNoCheck = true;
			}
		}// 판매자 모드 끝
		
		/* 선택약관은 체크 여부 무관 */

		if(sellerSelected ==true){
			//판매자일때 - 몇가지 값이 더 true여야함
			if(idCheck && pwCheck && pwckCheck && nameCheck  && emailCheck && phoneCheck 
					&& addressDetailWriteCheck && birthYearCheck 
					&& birthMonthCheck  && birthDateCheck  && essentialOneCheck  && essentialTwoCheck 
					&& sellerMarUniqueNoCheck && idDuplCheck  && idFormatCheck && pwdFormatCheck  && pwdChekerFormatCheck 
					&& nameFormatCheck  && emailFormatCheck  && emailDuplCheck  && phoneFormatCheck  && birthYearFormatCheck 
					&& birthMonthFormatCheck  && birthDateFormatCheck && adequateYearCheck && sellerMarketUniqueNoCheck
					){
						console.log("판매자 모두 성립");
						$("#join_form").attr("action", "/member/joinAct");
						$("#join_form").submit();
					}console.log("판매자 안 성립");
		}else{
			//일반회원의 경우
			if(idCheck && pwCheck && pwckCheck && nameCheck  && emailCheck && phoneCheck 
					&& addressDetailWriteCheck && birthYearCheck 
					&& birthMonthCheck  && birthDateCheck  && essentialOneCheck  && essentialTwoCheck 
					&& idDuplCheck  && idFormatCheck && pwdFormatCheck  && pwdChekerFormatCheck 
					&& nameFormatCheck  && emailFormatCheck  && emailDuplCheck  && phoneFormatCheck  && birthYearFormatCheck 
					&& birthMonthFormatCheck  && birthDateFormatCheck && adequateYearCheck
					){
						console.log("일반회원 모두 성립");
						$("#join_form").attr("action", "/member/joinAct");
						$("#join_form").submit();
					}console.log("일반회원 안 성립");
		}
		
		return false;
	}); // 클릭함수 끝


/* 빈칸인지아닌지 실시간 검사 + 값 바꿈 */

// $('.id_input').keyup(){
// 	if()
// }



/* 아이디 형식 검사 */

$('.id_input').keyup( function() {
	if(!idFormatChk($('.id_input').val())){
		$('.id_alert_box').css('display','block');
		$('.id_alert_box').html("<span style='color: red'>영문으로 시작하는 6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합</span>");
		idFormatCheck = false;
	}else{
	 	$('.id_alert_box').css('display','none');
	 	idFormatCheck = true;
	}
});

function idFormatChk(value) {
// 	var regExp = /^[a-z]+[a-z0-9]{6,16}$/g;
	const pattern = new RegExp("^[a-zA-Z][0-9a-zA-Z]{5,15}$");
	return pattern.test(value);
}



/* 아이디 중복검사 */
$('.id_duplicate_check').click(function(){
	if(idFormatCheck){
	var memId = $('.id_input').val();			// .id_input에 입력되는 값
	var data = {memId : memId}					// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	$.ajax({
		type : "post",
		url : "/member/memIdCheck",
		data : data,
		success : function(result){
			// console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.id_alert_box').css('display','block');
				$('.id_alert_box').html("<span style='color: green'>사용가능한 아이디 입니다</span>");
				idDuplCheck = true;
			} else {
				$('.id_alert_box').css('display','block');
				$('.id_alert_box').html("<span style='color: red'>이미 사용중인 아이디입니다</span>");
				idDuplCheck = false;
			}	
		}// success 종료
	}); // ajax 종료	
	}else{
		$('.id_alert_box').css('display','block');
		$('.id_alert_box').html("<span style='color: red'>형식을 맞추고 진행해 주세요.</span>");
	}
});// function 종료



/* 아이디 중복검사 했는데 바꾼 경우 */

$('.id_input').keyup( function() {
	if(idDuplCheck){
		$('.id_alert_box').css('display','block');
		$('.id_alert_box').html("<span style='color: red'>다시 중복검사 해주세요</span>");
		idDuplCheck = false;
	}
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
// 	const pattern = new RegExp("^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$");
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

/* 이름 한글 형식 검사 */

$('.nameBox_input').keyup( function() {
	if(!nameFormatChk($('.nameBox_input').val())){
		$('.nameBox_alert_box').css('display','block');
		$('.nameBox_alert_box').html("<span style='color: red'>2~5자리의 한글</span>");
		nameFormatCheck = false;
	}else{
// 	 	$('.nameBox_alert_box').css('display','none');
	 	$('.nameBox_alert_box').html("<span style='color: green'>이름 형식 검사 완료</span>");
	 	nameFormatCheck = true;
	}
});

function nameFormatChk(value) {
	const pattern = new RegExp("^[가-힣]{2,6}$");
	return pattern.test(value);
}
  
 /* 이메일 형식 검사 */

$('.email_input').keyup( function() {
	if(!emailFormatChk($('.email_input').val())){
		$('.email_alert_box').css('display','block');
		$('.email_alert_box').html("<span style='color: red'>이메일 형식을 지켜주세요</span>");
		emailFormatCheck = false;
	}else{
	 	$('.email_alert_box').css('display','none');
	 	emailFormatCheck = true;
	}
});

function emailFormatChk(value) {
	const pattern = new RegExp("^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
	return pattern.test(value);
}



/* 이메일 중복검사 */
$('.email_duplicate_check').click(function(){
	if(emailFormatCheck){
	var memEmail = $('.email_input').val();			// .id_input에 입력되는 값
	var data = {memEmail : memEmail}					// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	$.ajax({
		type : "post",
		url : "/member/memEmailCheck",
		data : data,
		success : function(result){
			// console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.email_alert_box').css('display','block');
				$('.email_alert_box').html("<span style='color: green'>사용가능한 이메일 입니다</span>");
				emailDuplCheck = true;
			} else {
				$('.email_alert_box').css('display','block');
				$('.email_alert_box').html("<span style='color: red'>이미 사용중인 이메일입니다</span>");
				emailDuplCheck = false;
			}	
		}// success 종료
	}); // ajax 종료	
	}else{
		$('.email_alert_box').css('display','block');
		$('.email_alert_box').html("<span style='color: red'>형식을 맞추고 진행해 주세요.</span>");
	}
});// function 종료



/* 이메일 중복검사 했는데 바꾼 경우 */

$('.email_input').keyup( function() {
	if(emailDuplCheck){
		$('.email_alert_box').css('display','block');
		$('.email_alert_box').html("<span style='color: red'>다시 중복검사 해주세요</span>");
		emailDuplCheck = false;
	}
});

/* 전화번호 형식 검사 */

$('.phone_input').keyup( function() {
	if(phoneFormatChk($('.phone_input').val())==="fail"){
		$('.phone_alert_box').css('display','block');
		$('.phone_alert_box').html("<span style='color: red'>전화번호 형식을 지켜주세요</span>");
		phoneFormatCheck = false;
	}else{
// 	 	$('.phone_alert_box').css('display','none');
	 	$('.phone_alert_box').html("<span style='color: green'>전화번호 형식 검사 완료</span>");
	 	phoneFormatCheck = true;
	}
});

function phoneFormatChk(value) {
	if(value.length === 13){
		return "success";
	}else{
		return "fail";
	}
}

function autoHypen(target){
	return target.value = target.value.replace(/[^0-9]/g, '')
	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	.replace(/(\-{1,2})$/g, "");
}


/* 주소 + 다음주소API */

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
                document.getElementById("main_postcode").value = data.zonecode;
                document.getElementById("main_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("main_detailAddress").focus();
                $('.daum_address_wrapper').css('display','block');
                $('.daum_address_btn').val('재검색');
            }else{
            	// 우편 폼만 열고 X 누른경우임 ( 문자열이 0 )
            }
            
        }
    }).open();
    
} //function end


/* 생일 형식 검사 */

	/* 1단계 - 연도 */
	$('.birth_input_year').keyup( function() {
		if(!brYearChk($('.birth_input_year').val())){
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>연도를 확인해주세요</span>");
			$(".birth_input_month").prop('disabled', true); // 달 비활성화
			$(".birth_input_date").prop('disabled', true); // 일 비활성화
			$(".birth_input_month").val(null); // 달 초기화
			$(".birth_input_date").val(null); // 일 초기화
			birthYearFormatCheck = false;
		}else{
// 	 	 	$('.birth_alert_box').css('display','none');
		 	$('.birth_alert_box').html("<span style='color: green'>연도 검사 완료</span>");
		 	$(".birth_input_month").prop('disabled', false); // 달 활성화
		 	birthYearFormatCheck = true;
		}
	});
	
	function brYearChk(target){
		// isNan => 숫자가 아니면 true 리턴
		if(!isNaN(target)){
			// 일단 숫자를 입력하였음
			var year = new Date().getFullYear()
			if(target < (year-100) || target > year){
				// 100세 이상 or 미래 시간여행자
				return false;
			}else{
				return true;
			}
		}else{
			// 숫자말고 다른 문자 감지됨
			return false;
		}
	}
	
	/* 2단계 - 월 */
	$('.birth_input_month').keyup( function() {
		if(!brMonthChk($('.birth_input_month').val())){
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>월을 확인해주세요</span>");
			$(".birth_input_date").prop('disabled', true); // 일 비활성화
			$(".birth_input_date").val(null); // 일 초기화
			birthMonthFormatCheck = false;
		}else{
// 	 	 	$('.birth_alert_box').css('display','none');
		 	$('.birth_alert_box').html("<span style='color: green'>월 검사 완료</span>");
		 	$(".birth_input_date").val(null); // 일 초기화
		 	$(".birth_input_date").prop('disabled', false); // 일 활성화
		 	birthMonthFormatCheck = true;
		}
	});
	
	function brMonthChk(target){
		// isNan => 숫자가 아니면 true 리턴
		if(!isNaN(target)){
			// 일단 숫자를 입력하였음
			if(12 < target || target < 1){
				// 12 초과 or 1 미만=> false
				return false;
			}else{
				return true;
			}
		}else{
			// 숫자말고 다른 문자 감지됨
			return false;
		}
	}
	
	
	/* 3단계 - 일 */
	/* 윤달은 아직 고려X -> 2월은 28일로 고정 */

	$('.birth_input_date').keyup( function() {
		if(!brDateChk($('.birth_input_date').val())){
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>일을 확인해주세요</span>");
			birthDateFormatCheck = false;
		}else{
// 	 	 	$('.birth_alert_box').css('display','none');
		 	$('.birth_alert_box').html("<span style='color: green'>일 검사 완료</span>");
		 	birthDateFormatCheck = true;
		}
	});
	
	function brDateChk(target){
		// isNan => 숫자가 아니면 true 리턴
		const oddMonthArr = ['1','3','5','7','9','11','01','03','05','07','09'];
		const evenMonthArr = ['4','6','8','10','12','04','06','08'];
		//2월은 28일 이므로 별도 처리
		if(!isNaN(target)){
			if(oddMonthArr.includes($('.birth_input_month').val())){
				//홀수 달인 경우
				if(30 < target || target < 1){
					// 30 초과 or 1 미만=> false
					return false;
				}else{
					return true;
				}
			}
			if(evenMonthArr.includes($('.birth_input_month').val())){
				//짝수 달인 경우 (2월제외)
				if(31 < target || target < 1){
					// 31 초과 or 1 미만=> false
					return false;
				}else{
					return true;
				}
			}
			if($('.birth_input_month').val() === '2' || $('.birth_input_month').val() === '02'){
				// 2월인 경우
				if(28 < target || target < 1){
					// 12 초과 or 1 미만=> false
					return false;
				}else{
					return true;
				}
			}
		}else{
			// 숫자말고 다른 문자 감지됨
			return false;
		}
	}
	
/* 미래에서 온사람 잡기 or 만14세 미만잡기*/
$('.birth_input_date').keyup( function() {
	var temp_birth_year = $('.birth_input_year').val();
	var temp_birth_month = $('.birth_input_month').val();
	var temp_birth_date = $('.birth_input_date').val();
	if(birthYearFormatCheck==true && birthMonthFormatCheck==true && birthDateFormatCheck==true){
		let inputDate = new Date(temp_birth_year+"-"+temp_birth_month+"-"+temp_birth_date);
		let nowDate = new Date();
		if(inputDate > nowDate){
			/* 미래에서 왔음 */
			$('.birth_alert_box').css('display','block');
			$('.birth_alert_box').html("<span style='color: red'>미래에서 오셨습니다</span>");
			adequateYearCheck = false;
		}else{
			/* 최소한 미래에서 오지는 않음 */
			/* 만나이 계산 로직 */
			let age = nowDate.getFullYear() - inputDate.getFullYear();
			const m = nowDate.getMonth() - inputDate.getMonth();
			if (m < 0 || (m === 0 && nowDate.getDate() < inputDate.getDate())) {
			    age--;
			}
			if(age < 14){
				//만 14세 미만 => 빠꾸
				$('.birth_alert_box').css('display','block');
				$('.birth_alert_box').html("<span style='color: red'>[필수]만14세 이상이어야 합니다</span>");
				adequateYearCheck = false;
			}else{
				// 미래인도 아니고 만14세 미만도 아님
				$('.birth_alert_box').css('display','none');
				adequateYearCheck = true;
			}
		}
			
		
	}
	
});


/* 모든 약관 체크 (전체선택) */
$('.allCk').click(function(){
	var checked = $('.allCk').is(':checked');
	if(checked){
		$('input:checkbox').prop('checked',true);
	}	
});


/* 판매자 회원 버튼 토글 */

//판매자 모드
$("#typeSel2").click(function(){
	$(".seller_entire_form").css('display','block');
	sellerSelected = true;
// 	console.log("판매자회원입니다: "+sellerSelected);
});

//일반 모드
$("#typeSel1").click(function(){
	$(".seller_entire_form").css('display','none');
	sellerSelected = false;
// 	console.log("일반회원입니다: "+sellerSelected);
});


/* 판매자 10자리 입력 AJAX + 숫자만 입력*/
$(".seller_marketUniqueNo_check").click(function(){
	let getUniNo = $('.seller_marketUniqueNo_input').val();
	let data = {getUniNo : getUniNo}
	$.ajax({
		type : "post",
		url : "/member/selMarketUniqueNo",
		data : data,
		success : function(data){
			var result = data.result;
			if(result != 'fail'){
				$('.seller_entire_alert_box').css('display','block');
				$('.seller_entire_alert_box').html("<span style='color: green'>검증완료</span>");
				sellerMarketUniqueNoCheck = true;
				var storeVO = data.storeVO;
				$('.seller_brandName_input').val(storeVO.stlBrandName);
				$('.seller_selRegiNo_input').val(storeVO.stlSelRegiNo);
				/* 통과시 모두 readonly */
				$(".seller_marketUniqueNo_check").prop('disabled', true);
				$(".seller_brandName_input").prop('readonly', true);
				$(".seller_selRegiNo_input").prop('readonly', true);
				$(".seller_marketUniqueNo_input").prop('readonly', true);
			} else {
				$('.seller_entire_alert_box').css('display','block');
				$('.seller_entire_alert_box').html("<span style='color: red'>잘못된 번호입니다.</span>");
				sellerMarketUniqueNoCheck = false;
			}	
		}// success 종료
	}); //ajax종료
});//클릭함수 종료

/* 기초 입력값 실시간 감지 - 작성 여부 */

	/* 아이디 */
	$('.id_input').keyup( function() {
		if($('.id_input').val() == ""){
			idCheck = false;
		}else{
			idCheck = true;
		}
	});
	
	
	/* 비밀번호 */
	$('.pw_input').keyup( function() {
		if($('.pw_input').val() == ""){
			pwCheck = false;
		}else{
			pwCheck = true;
		}
	});
	
	/* 비밀번호확인 */
	$('.email_input').keyup( function() {
		if($('.email_input').val() == ""){
			pwckCheck = false;
		}else{
			pwckCheck = true;
		}
	});
	
	/* 이름 */
	$('.nameBox_input').keyup( function() {
		if($('.nameBox_input').val() == ""){
			nameCheck = false;
		}else{
			nameCheck = true;
		}
	});
	
	/* 이메일 */
	$('.nameBox_input').keyup( function() {
		if($('.nameBox_input').val() == ""){
			emailCheck = false;
		}else{
			emailCheck = true;
		}
	});
	
	/* 전화번호 */
	$('.phone_input').keyup( function() {
		if($('.phone_input').val() == ""){
			phoneCheck = false;
		}else{
			phoneCheck = true;
		}
	});
	
	/* 상세주소 */
	$('.address_input').keyup( function() {
		if($('.address_input').val() == ""){
			addressDetailWriteCheck = false;
		}else{
			addressDetailWriteCheck = true;
		}
	});
	
	/* 생일-연도 */
	$('.birth_input_year').keyup( function() {
		if($('.birth_input_year').val() == ""){
			birthYearCheck = false;
		}else{
			birthYearCheck = true;
		}
	});
	
	/* 생일-월 */
	$('.birth_input_month').keyup( function() {
		if($('.birth_input_month').val() == ""){
			birthMonthCheck = false;
		}else{
			birthMonthCheck = true;
		}
	});
	
	/* 생일-일 */
	$('.birth_input_date').keyup( function() {
		if($('.birth_input_date').val() == ""){
			birthDateCheck = false;
		}else{
			birthDateCheck = true;
		}
	});
	
	/* 필수약관체크1 */
	$('.essentialOne').change( function() {
		if($('.essentialOne').is(':checked')){
			essentialOneCheck = true;
		}else{
			essentialOneCheck = false;
		}
	});
	
	/* 필수약관체크2 */
	$('.essentialTwo').change( function() {
		if($('.essentialTwo').is(':checked')){
			essentialTwoCheck = true;
		}else{
			essentialTwoCheck = false;
		}
	});
	
	/* 판매자 고유번호 체크 */
	$('.seller_marketUniqueNo_input').keyup( function() {
		if($('.seller_marketUniqueNo_input').val() == ""){
			sellerUniqueNo = false;
		}else{
			sellerUniqueNo = true;
		}
	});

	/* 기초 입력값 실시간 감지 - 작성 여부 -끝- */
	
/* 전능한 버튼 => god이라는 클래스명 부여하고 사용하기*/
// $(".god").click(function(){
// 	console.log("idCheck : "+idCheck );
// 	console.log("pwCheck  : "+pwCheck  );
// 	console.log("pwckCheck  : "+pwckCheck  );
// 	console.log("nameCheck  : "+nameCheck  );
// 	console.log("emailCheck  : "+emailCheck  );
// 	console.log("phoneCheck  : "+phoneCheck  );
// 	console.log("addressPostcodeCheck  : "+addressPostcodeCheck  );
// 	console.log("addressMainCheck  : "+addressMainCheck  );
// 	console.log("addressDetailWriteCheck  : "+addressDetailWriteCheck  );
// 	console.log("birthYearCheck  : "+birthYearCheck  );
// 	console.log("birthMonthCheck  : "+birthMonthCheck  );
// 	console.log("birthDateCheck  : "+birthDateCheck  );
// 	console.log("essentialOneCheck  : "+essentialOneCheck  );
// 	console.log("essentialTwoCheck  : "+essentialTwoCheck  );
// 	console.log("sellerMarUniqueNoCheck(판매자)  : "+sellerMarUniqueNoCheck  );
// 	console.log("idDuplCheck  : "+idDuplCheck  );
// 	console.log("idFormatCheck  : "+idFormatCheck  );
// 	console.log("pwdFormatCheck  : "+pwdFormatCheck  );
// 	console.log("pwdChekerFormatCheck  : "+pwdChekerFormatCheck  );
// 	console.log("nameFormatCheck  : "+nameFormatCheck  );
// 	console.log("emailFormatCheck  : "+emailFormatCheck  );
// 	console.log("emailDuplCheck  : "+emailDuplCheck  );
// 	console.log("phoneFormatCheck  : "+phoneFormatCheck  );
// 	console.log("birthYearFormatCheck  : "+birthYearFormatCheck  );
// 	console.log("birthMonthFormatCheck   : "+birthMonthFormatCheck   );
// 	console.log("birthDateFormatCheck   : "+birthDateFormatCheck   );
// 	console.log("adequateYearCheck   : "+adequateYearCheck   );
// 	console.log("sellerMarketUniqueNoCheck(판매자)  : "+sellerMarketUniqueNoCheck  );
// });
</script>
</body>
</html>