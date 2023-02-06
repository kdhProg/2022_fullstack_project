<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="icon" href="/resources/pdimages/favicon.ico" type="image/x-icon">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- ==========================김동훈추가시작============================== -->
<script src="https://www.gstatic.com/charts/loader.js"></script>
<!-- ==========================김동훈추가끝============================== -->
<style>
#noticeBt,#faqBt,#onetooneBt{
   text-decoration: none;
}
a {
   text-decoration: none;
}
/* 김동훈추가시작 */
#chart_div_AnnotationChart_annotationsTd{
/*    display: none; */
}
/* 차트 크기 */
#chart_div{
   width: 900px; 
   height: 600px;
}


/* 방문자수 - 폰트 크고굵게 */
.focus_font{
   font-weight: bold;
   font-size: 2em;
}
/* 방문자수 - 회색 테두리 */
.border-grey{
   border: 1px solid rgba(128,128,128,0.7);
}
/* 차트 - 버튼 숨기기 */
#chart_div_AnnotationChart_zoomControlContainer_1-hour,#chart_div_AnnotationChart_zoomControlContainer_3-months{
   display:none;
}
/* 차트 줌 버튼 꾸미기 */
.zoomButton{
   border: none;
   width:40px;
   height: 20px;
   margin-left: 10px;
   font-weight: bold;
   font-size: 1.2em;
}
.nav_homeBtn{
	border: none;
	background: transparent;
}
/* 상단 요약탭 */
#daySummary{
	padding: 15px;
	background: #FAFAFA;
}
/* 각각요소 흰색배경 */
#daySummary_inside{
	padding-top:10px;
	background: white;
	padding-bottom:10px;
}
.col{
/*     border: 1px solid red;  */
}
/* 김동훈추가끝 */
</style>
<body>
<div class="container">
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/storeList">스토어 관리</a>
			<a class="navbar-brand" href="/admin/seller">셀러 관리</a>
			<a class="navbar-brand" href="/admin/product">상품 관리</a>
			<a class="navbar-brand" href="/admin/clientList">고객센터 관리</a>
			<a class="navbar-brand" href="/admin/memberGrade">회원 등급 관리</a>
			<a class="navbar-brand" href="/admin/adminStats">통계</a>
			<a class="navbar-brand" href="/admin/enterAdminMain"><svg class="nav_homeBtn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg></a>
		</div>
	</nav>
	<br />
		<div class="row">
			<div class="col text-center"> 
				<h1>통계</h1>
			</div>
		</div>
	<br />
   		<div id="daySummary" class="row">
			<div id="daySummary_inside" class="col text-center"> 
				<table class="table">
					<tr>
						<th>일자</th><th>주문수</th><th>매출액</th><th>방문자</th><th>가입</th>
					</tr>
					<tr>
						<td><span id="summ_today"></span></td>
						<td><span id="summ_orderCnt"></span></td>
						<td><span id="summ_sales"></span></td>
						<td><span id="summ_visitors"></span></td>
						<td><span id="summ_join"></span></td>
					</tr>
				</table>
			</div>
		</div>
   <br />
   <a href="#" onclick="return false;" id="visitBt" class="btn btn-primary">방문자 수</a>
   <a href="#" onclick="return false;" id="svBt" class="btn btn-primary">판매량</a>
   <a href="#" onclick="return false;" id="tpBt" class="btn btn-primary">매출액</a>
   <a href="#" onclick="return false;" id="downloadBtnExcel" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="white" class="bi bi-file-earmark-excel" viewBox="0 0 16 16"><path d="M5.884 6.68a.5.5 0 1 0-.768.64L7.349 10l-2.233 2.68a.5.5 0 0 0 .768.64L8 10.781l2.116 2.54a.5.5 0 0 0 .768-.641L8.651 10l2.233-2.68a.5.5 0 0 0-.768-.64L8 9.219l-2.116-2.54z"/><path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/></svg>&nbsp;자료 다운받기(Excel)</a>
</div>
<br />

<!-- 김동훈 작업 시작 -->
<div class="container" id="visitDiv" style="display : none;">
	<br />
		<div>
			<h2>*방문자수*</h2>
		</div>
	<br />
	<br />
      <div class="col col-lg-3">
         <div class="row">
            <div class="col border-grey">
               <p class="focus_font">오늘 방문자수</p>
               <div id="todayVisit" class="focus_font"></div>
            </div>
         </div>
         <div class="row">
            <div class="col border-grey">
               <p class="focus_font">누적 방문자수</p>
               <div id="accumulateVisit" class="focus_font"></div>
            </div>
         </div>
      </div>
      <br />
      <div class="col col-lg-9">
         <div id='chart_div'></div>
      </div>
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
	<br />      
</div>

<!-- 판매량 div -->
<div class="container" id="svDiv" style="display : none;">
	<br />
		<div>
			<h2>*판매량*</h2>
		</div>
	<br />
	<br />
	<!-- 일별 -->
	<div class="container">
		<div class="col col-lg-3">
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">판매량(일일)</p>
	               <div id="todaySv" class="focus_font"></div>
	            </div>
	         </div>
	    </div>
		<div class="row" >
	      <div class="col col-lg-9">
	         <div id='columnchart_values_sv1' ></div>
	      </div>
	    </div>
	</div>
<hr />	
	<!-- 월별 -->
	<div class="container">
		<div class="col col-lg-3">
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">판매량(월간)</p>
	               <div id="monthSv" class="focus_font"></div>
	            </div>
	         </div>
	      </div>
	   <div class="row" >
	      <div class="col col-lg-9">
	         <div id='columnchart_values_sv2' ></div>
	      </div>
	   </div>
	</div>
<hr />	
	<!-- 연별 -->
	<div class="container">
		<div class="col col-lg-3">
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">판매량(연간)</p>
	               <div id="yearSv" class="focus_font"></div>
	            </div>
	         </div>
	      </div>
	   <div class="row" >
	      <div class="col col-lg-9">
	         <div id='columnchart_values_sv3' ></div>
	      </div>
	   </div>
	</div>
<hr />	
	<!-- 누적 -->
	<div class="container">
		<div class="col col-lg-3">
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">총 판매량</p>
	               <div id="allSv" class="focus_font"></div>
	            </div>
	         </div>
	      </div>
	   <div class="row" >
	      <div class="col col-lg-9">
	         <div id='columnchart_values_sv4' ></div>
	      </div>
	   </div>
	</div>
</div>

<!-- 매출액 div -->
<!-- 일별 -->
<div class="container" id="tpDiv" style="display : none;">
	<br />
		<div>
			<h2>*매출액*</h2>
		</div>
	<br />
	<br />
	<div class="container">
		<div class="col col-lg-3">
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">총 매출액(일간)</p>
	               <div id="todayTotalPrice" class="focus_font"></div>
	            </div>
	         </div>
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">순 매출액(일간)</p>
	               <div id="dayNetSales" class="focus_font"></div>
	            </div>
	         </div>
	      </div>
	   <div class="row" >
	      <div class="col col-lg-9">
	         <div id='columnchart_values' ></div>
	      </div>
	   </div>
	</div>
<hr />	
	<!-- 월별 -->
	<div class="container">
		<div class="col col-lg-3">
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">총 매출액(월간)</p>
	               <div id="monthTotalPrice" class="focus_font"></div>
	            </div>
	         </div>
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">순 매출액(월간)</p>
	               <div id="monthNetSales" class="focus_font"></div>
	            </div>
	         </div>
	      </div>
	   <div class="row" >
	      <div class="col col-lg-9">
	         <div id='columnchart_values2' ></div>
	      </div>
	   </div>
	</div>
<hr />	
	<!-- 연별 -->
	<div class="container">
		<div class="col col-lg-3">
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">총 매출액(연간)</p>
	               <div id="yearTotalPrice" class="focus_font"></div>
	            </div>
	         </div>
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">순 매출액(연간)</p>
	               <div id="yearNetSales" class="focus_font"></div>
	            </div>
	         </div>
	      </div>
	   <div class="row" >
	      <div class="col col-lg-9">
	         <div id='columnchart_values3' ></div>
	      </div>
	   </div>
	</div>
<hr />	
	<!-- 누적 -->
	<div class="container">
		<div class="col col-lg-3">
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">총 매출액</p>
	               <div id="allTotalPrice" class="focus_font"></div>
	            </div>
	         </div>
	         <div class="row">
	            <div class="col border-grey">
	               <p class="focus_font">순 매출액</p>
	               <div id="allNetSales" class="focus_font"></div>
	            </div>
	         </div>
	      </div>
	   <div class="row" >
	      <div class="col col-lg-9">
	         <div id='columnchart_values4' ></div>
	      </div>
	   </div>
	</div>
</div>

<!-- 김동훈 작업 끝 -->   
</body>
<script>
$("#visitBt").on("click", function() {
   $(this).css('font-weight', 'bold');
   $('#visitDiv').css('display', 'block');
   $("#svBt").css('font-weight', 'normal');
   $('#svDiv').css('display', 'none');
   $("#tpBt").css('font-weight', 'normal');
   $('#tpDiv').css('display', 'none');
});
$("#svBt").on("click", function() {
   $(this).css('font-weight', 'bold');
   $('#svDiv').css('display', 'block');
   $("#visitBt").css('font-weight', 'normal');
   $('#visitDiv').css('display', 'none');
   $("#tpBt").css('font-weight', 'normal');
   $('#tpDiv').css('display', 'none');
});
$("#tpBt").on("click", function() {
   $(this).css('font-weight', 'bold');
   $('#tpDiv').css('display', 'block');
   $("#visitBt").css('font-weight', 'normal');
   $('#visitDiv').css('display', 'none');
   $("#svBt").css('font-weight', 'normal');
   $('#svDiv').css('display', 'none');
   
});
/* ===================김동훈추가시작==================== */
     
function getVisitorsList(){
   $.ajax({
      type : "get",
      url : "/visitors/getVisitorList",
      data : {
      },
      success : function(result){
         let countList = result.countList;
         let dateList = result.dateList;
         let accumulateVisit = result.accumulateVisit;
         let todayVisit = result.todayVisit;
         
         $("#accumulateVisit").text(Number(accumulateVisit).toLocaleString('ko-KR'));
         $("#todayVisit").text(Number(todayVisit).toLocaleString('ko-KR'));
         
         let interGratedList = [];
         
         for(let i=0 ; i < countList.length ; i++){
            let elementList = [];
            elementList.push(new Date(dateList[i].substring(0,4),dateList[i].substring(5,7),dateList[i].substring(8,10)));
            elementList.push(countList[i]);
            
            interGratedList.push(elementList);
         }
         drawChart(interGratedList);
      }// success 종료
   }); // ajax 종료
}

google.charts.load('current', {'packages':['annotationchart']});
google.charts.setOnLoadCallback(getVisitorsList);

function drawChart(interGratedList) {
  var data = new google.visualization.DataTable();
  data.addColumn('date', 'Date');
  data.addColumn('number', '방문자');
  data.addRows(interGratedList);

  var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

  var options = {
	width: 1200,
    height: 800,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
    displayAnnotations: true
  };

  chart.draw(data, options);
}

/* ===================김동훈추가끝==================== */


/* ===================판매량 시작==================== */

// 일별 판매량
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getDaySalesVolume); 
 
function getDaySalesVolume(){
   $.ajax({
      type : "get",
      url : "/admin/daySalesVolume",
      data : {
      },
      success : function(result){
         let svDayVolume1 = result.svDay1;
         let svDayVolume2 = result.svDay2;
         let svDayVolume3 = result.svDay3;
         let svDayVolume4 = result.svDay4;
         
         if(svDayVolume1 == null){ svDayVolume1 = 0; }
         if(svDayVolume2 == null){ svDayVolume2 = 0; }
         if(svDayVolume3 == null){ svDayVolume3 = 0; }
         if(svDayVolume4 == null){ svDayVolume4 = 0; }
         
         $("#todaySv").text(Number(svDayVolume1).toLocaleString('ko-KR'));
         
         salesVolumeChart1(svDayVolume1, svDayVolume2, svDayVolume3, svDayVolume4);
      }// success 종료
   }); // ajax 종료
}

function salesVolumeChart1(svDayVolume1, svDayVolume2, svDayVolume3, svDayVolume4) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "", { role: "style" } ],
    ["3일전", svDayVolume4, "#b87333"],
    ["2일전", svDayVolume3, "silver"],
    ["1일전", svDayVolume2, "gold"],
    ["오늘", svDayVolume1, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "일 판매량",
    width: 1500,
    height: 900,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values_sv1"));
  chart.draw(view, options);

}

//월별 매출
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getMonthSalesVolume); 
 
function getMonthSalesVolume(){
   $.ajax({
      type : "get",
      url : "/admin/monthSalesVolume",
      data : {
      },
      success : function(result){
         let svMonthVolume1 = result.svMonth1;
         let svMonthVolume2 = result.svMonth2;
         let svMonthVolume3 = result.svMonth3;
         let svMonthVolume4 = result.svMonth4;
         let svMonthVolume5 = result.svMonth5;
         let svMonthVolume6 = result.svMonth6;
         let svMonthVolume7 = result.svMonth7;
         let svMonthVolume8 = result.svMonth8;
         let svMonthVolume9 = result.svMonth9;
         let svMonthVolume10 = result.svMonth10;
         let svMonthVolume11 = result.svMonth11;
         let svMonthVolume12 = result.svMonth12;
        
         if(svMonthVolume1 == null){ svMonthVolume1 = 0; }
         if(svMonthVolume2 == null){ svMonthVolume2 = 0; }
         if(svMonthVolume3 == null){ svMonthVolume3 = 0; }
         if(svMonthVolume4 == null){ svMonthVolume4 = 0; }
         if(svMonthVolume5 == null){ svMonthVolume5 = 0; }
         if(svMonthVolume6 == null){ svMonthVolume6 = 0; }
         if(svMonthVolume7 == null){ svMonthVolume7 = 0; }
         if(svMonthVolume8 == null){ svMonthVolume8 = 0; }
         if(svMonthVolume9 == null){ svMonthVolume9 = 0; }
         if(svMonthVolume10 == null){ svMonthVolume10 = 0; }
         if(svMonthVolume11 == null){ svMonthVolume11 = 0; }
         if(svMonthVolume12 == null){ svMonthVolume12 = 0; }
         
         $("#monthSv").text(Number(svMonthVolume1).toLocaleString('ko-KR'));
         
         salesVolumeChart2(svMonthVolume1, svMonthVolume2, svMonthVolume3, svMonthVolume4, svMonthVolume5, svMonthVolume6,
        					svMonthVolume7, svMonthVolume8, svMonthVolume9, svMonthVolume10, svMonthVolume11, svMonthVolume12);
      }// success 종료
   }); // ajax 종료
}

function salesVolumeChart2(svMonthVolume1, svMonthVolume2, svMonthVolume3, svMonthVolume4, svMonthVolume5, svMonthVolume6,
		svMonthVolume7, svMonthVolume8, svMonthVolume9, svMonthVolume10, svMonthVolume11, svMonthVolume12) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "", { role: "style" } ],
    ["열 한 달전 ", svMonthVolume12, "silver"],
    ["열 달전", svMonthVolume11, "gold"],
    ["아홉 달전", svMonthVolume10, "#b87333"],
    ["여덟 달전", svMonthVolume9, "silver"],
    ["일곱 달전", svMonthVolume8, "gold"],
    ["여섯 달전", svMonthVolume7, "#b87333"],
    ["다섯 달전", svMonthVolume6, "silver"],
    ["네 달전", svMonthVolume5, "gold"],
    ["세 달전", svMonthVolume4, "#b87333"],
    ["두 달전", svMonthVolume3, "silver"],
    ["한 달전", svMonthVolume2, "gold"],
    ["당 월", svMonthVolume1, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "월 판매량",
    width: 1500,
    height: 900,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values_sv2"));
  chart.draw(view, options);

} 

// 연별 판매량
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getYearSalesVolume); 
 
function getYearSalesVolume(){
   $.ajax({
      type : "get",
      url : "/admin/yearSalesVolume",
      data : {
      },
      success : function(result){
         let svYearVolume1 = result.svYear1;
         let svYearVolume2 = result.svYear2;
         let svYearVolume3 = result.svYear3;
         let svYearVolume4 = result.svYear4;
         let svYearVolume5 = result.svYear5;
         let svYearVolume6 = result.svYear6;
         let svYearVolume7 = result.svYear7;
         let svYearVolume8 = result.svYear8;
         let svYearVolume9 = result.svYear9;
         let svYearVolume10 = result.svYear10;
         let svYearVolume11 = result.svYear11;
         
         if(svYearVolume1 == null){ svYearVolume1 = 0; }
         if(svYearVolume2 == null){ svYearVolume2 = 0; }
         if(svYearVolume3 == null){ svYearVolume3 = 0; }
         if(svYearVolume4 == null){ svYearVolume4 = 0; }
         if(svYearVolume5 == null){ svYearVolume5 = 0; }
         if(svYearVolume6 == null){ svYearVolume6 = 0; }
         if(svYearVolume7 == null){ svYearVolume7 = 0; }
         if(svYearVolume8 == null){ svYearVolume8 = 0; }
         if(svYearVolume9 == null){ svYearVolume9 = 0; }
         if(svYearVolume10 == null){ svYearVolume10 = 0; }
         if(svYearVolume11 == null){ svYearVolume11 = 0; }
         
         $("#yearSv").text(Number(svYearVolume1).toLocaleString('ko-KR'));
         
         salesVolumeChart3(svYearVolume1, svYearVolume2, svYearVolume3, svYearVolume4, svYearVolume5, 
        					svYearVolume6, svYearVolume7, svYearVolume8, svYearVolume9, svYearVolume10, svYearVolume11);
      }// success 종료
   }); // ajax 종료
}

function salesVolumeChart3(svYearVolume1, svYearVolume2, svYearVolume3, svYearVolume4, svYearVolume5, 
		svYearVolume6, svYearVolume7, svYearVolume8, svYearVolume9, svYearVolume10, svYearVolume11) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "", { role: "style" } ],
    ["10년전", svYearVolume11, "gold"],
    ["9년전", svYearVolume10, "#b87333"],
    ["8년전", svYearVolume9, "silver"],
    ["7년전", svYearVolume8, "gold"],
    ["6년전", svYearVolume7, "#b87333"],
    ["5년전", svYearVolume6, "silver"],
    ["4년전", svYearVolume5, "gold"],
    ["3년전", svYearVolume4, "#b87333"],
    ["2년전", svYearVolume3, "silver"],
    ["1년전", svYearVolume2, "gold"],
    ["올해", svYearVolume1, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "연 판매량",
    width: 1500,
    height: 900,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values_sv3"));
  chart.draw(view, options);

} 

// 누적 판매량
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getAllSalesVolume); 
 
function getAllSalesVolume(){
   $.ajax({
      type : "get",
      url : "/admin/allSalesVolume",
      data : {
      },
      success : function(result){
         let svAllVolume = result.svAll;
         
         if(svAllVolume == null){ svAllVolume = 0; }
         
         $("#allSv").text(Number(svAllVolume).toLocaleString('ko-KR'));
         
         salesVolumeChart4(svAllVolume);
      }// success 종료
   }); // ajax 종료
}

function salesVolumeChart4(svAllVolume) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "", { role: "style" } ],
    ["누적", svAllVolume, "color: gold"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "누적 판매량",
    width: 1500,
    height: 900,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values_sv4"));
  chart.draw(view, options);

} 

/* ===================판매량 끝==================== */


/* ===================매출액 시작==================== */

// 일별 매출
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getDayTotalPrice); 
 
function getDayTotalPrice(){
   $.ajax({
      type : "get",
      url : "/admin/dayTotalPrice",
      data : {
      },
      success : function(result){
         let plDayTotal1 = result.plDay1;
         let plDayTotal2 = result.plDay2;
         let plDayTotal3 = result.plDay3;
         let plDayTotal4 = result.plDay4;
         
         if(plDayTotal1 == null){ plDayTotal1 = 0; }
         if(plDayTotal2 == null){ plDayTotal2 = 0; }
         if(plDayTotal3 == null){ plDayTotal3 = 0; }
         if(plDayTotal4 == null){ plDayTotal4 = 0; }
         
         $("#todayTotalPrice").text(Number(plDayTotal1).toLocaleString('ko-KR'));
         $("#dayNetSales").text(Number(plDayTotal1*10/100).toLocaleString('ko-KR'));
         
         totalPriceChart1(plDayTotal1, plDayTotal2, plDayTotal3, plDayTotal4);
      }// success 종료
   }); // ajax 종료
}

function totalPriceChart1(plDayTotal1, plDayTotal2, plDayTotal3, plDayTotal4) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "", { role: "style" } ],
    ["3일전", plDayTotal4, "#b87333"],
    ["2일전", plDayTotal3, "silver"],
    ["1일전", plDayTotal2, "gold"],
    ["오늘", plDayTotal1, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "일 매출액",
    width: 1500,
    height: 900,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
  chart.draw(view, options);

}

// 월별 매출
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getMonthTotalPrice); 
 
function getMonthTotalPrice(){
   $.ajax({
      type : "get",
      url : "/admin/monthTotalPrice",
      data : {
      },
      success : function(result){
         let plMonthTotal1 = result.plMonth1;
         let plMonthTotal2 = result.plMonth2;
         let plMonthTotal3 = result.plMonth3;
         let plMonthTotal4 = result.plMonth4;
         let plMonthTotal5 = result.plMonth5;
         let plMonthTotal6 = result.plMonth6;
         let plMonthTotal7 = result.plMonth7;
         let plMonthTotal8 = result.plMonth8;
         let plMonthTotal9 = result.plMonth9;
         let plMonthTotal10 = result.plMonth10;
         let plMonthTotal11 = result.plMonth11;
         let plMonthTotal12 = result.plMonth12;
        
         if(plMonthTotal1 == null){ plMonthTotal1 = 0; }
         if(plMonthTotal2 == null){ plMonthTotal2 = 0; }
         if(plMonthTotal3 == null){ plMonthTotal3 = 0; }
         if(plMonthTotal4 == null){ plMonthTotal4 = 0; }
         if(plMonthTotal5 == null){ plMonthTotal5 = 0; }
         if(plMonthTotal6 == null){ plMonthTotal6 = 0; }
         if(plMonthTotal7 == null){ plMonthTotal7 = 0; }
         if(plMonthTotal8 == null){ plMonthTotal8 = 0; }
         if(plMonthTotal9 == null){ plMonthTotal9 = 0; }
         if(plMonthTotal10 == null){ plMonthTotal10 = 0; }
         if(plMonthTotal11 == null){ plMonthTotal11 = 0; }
         if(plMonthTotal12 == null){ plMonthTotal12 = 0; }
         
         $("#monthTotalPrice").text(Number(plMonthTotal1).toLocaleString('ko-KR'));
         $("#monthNetSales").text(Number(plMonthTotal1*10/100).toLocaleString('ko-KR'));
         
         totalPriceChart2(plMonthTotal1, plMonthTotal2, plMonthTotal3, plMonthTotal4, plMonthTotal5, plMonthTotal6, 
        				plMonthTotal7, plMonthTotal8, plMonthTotal9, plMonthTotal10, plMonthTotal11, plMonthTotal12);
      }// success 종료
   }); // ajax 종료
}

function totalPriceChart2(plMonthTotal1, plMonthTotal2, plMonthTotal3, plMonthTotal4, plMonthTotal5, plMonthTotal6, 
		plMonthTotal7, plMonthTotal8, plMonthTotal9, plMonthTotal10, plMonthTotal11, plMonthTotal12) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "", { role: "style" } ],
    ["열 한 달전 ", plMonthTotal12, "silver"],
    ["열 달전", plMonthTotal11, "gold"],
    ["아홉 달전", plMonthTotal10, "#b87333"],
    ["여덟 달전", plMonthTotal9, "silver"],
    ["일곱 달전", plMonthTotal8, "gold"],
    ["여섯 달전", plMonthTotal7, "#b87333"],
    ["다섯 달전", plMonthTotal6, "silver"],
    ["네 달전", plMonthTotal5, "gold"],
    ["세 달전", plMonthTotal4, "#b87333"],
    ["두 달전", plMonthTotal3, "silver"],
    ["한 달전", plMonthTotal2, "gold"],
    ["당 월", plMonthTotal1, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "월 매출액",
    width: 1500,
    height: 900,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values2"));
  chart.draw(view, options);

} 

// 연별 매출
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getYearTotalPrice); 
 
function getYearTotalPrice(){
   $.ajax({
      type : "get",
      url : "/admin/yearTotalPrice",
      data : {
      },
      success : function(result){
         let plYearTotal1 = result.plYear1;
         let plYearTotal2 = result.plYear2;
         let plYearTotal3 = result.plYear3;
         let plYearTotal4 = result.plYear4;
         let plYearTotal5 = result.plYear5;
         let plYearTotal6 = result.plYear6;
         let plYearTotal7 = result.plYear7;
         let plYearTotal8 = result.plYear8;
         let plYearTotal9 = result.plYear9;
         let plYearTotal10 = result.plYear10;
         let plYearTotal11 = result.plYear11;
         
         if(plYearTotal1 == null){ plYearTotal1 = 0; }
         if(plYearTotal2 == null){ plYearTotal2 = 0; }
         if(plYearTotal3 == null){ plYearTotal3 = 0; }
         if(plYearTotal4 == null){ plYearTotal4 = 0; }
         if(plYearTotal5 == null){ plYearTotal5 = 0; }
         if(plYearTotal6 == null){ plYearTotal6 = 0; }
         if(plYearTotal7 == null){ plYearTotal7 = 0; }
         if(plYearTotal8 == null){ plYearTotal8 = 0; }
         if(plYearTotal9 == null){ plYearTotal9 = 0; }
         if(plYearTotal10 == null){ plYearTotal10 = 0; }
         if(plYearTotal11 == null){ plYearTotal11 = 0; }
         
         $("#yearTotalPrice").text(Number(plYearTotal1).toLocaleString('ko-KR'));
         $("#yearNetSales").text(Number(plYearTotal1*10/100).toLocaleString('ko-KR'));
         
         totalPriceChart3(plYearTotal1, plYearTotal2, plYearTotal3, plYearTotal4, plYearTotal5, 
        		 			plYearTotal6, plYearTotal7, plYearTotal8, plYearTotal9, plYearTotal10, plYearTotal11);
      }// success 종료
   }); // ajax 종료
}

function totalPriceChart3(plYearTotal1, plYearTotal2, plYearTotal3, plYearTotal4, plYearTotal5, 
			plYearTotal6, plYearTotal7, plYearTotal8, plYearTotal9, plYearTotal10, plYearTotal11) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "", { role: "style" } ],
    ["10년전", plYearTotal11, "gold"],
    ["9년전", plYearTotal10, "#b87333"],
    ["8년전", plYearTotal9, "silver"],
    ["7년전", plYearTotal8, "gold"],
    ["6년전", plYearTotal7, "#b87333"],
    ["5년전", plYearTotal6, "silver"],
    ["4년전", plYearTotal5, "gold"],
    ["3년전", plYearTotal4, "#b87333"],
    ["2년전", plYearTotal3, "silver"],
    ["1년전", plYearTotal2, "gold"],
    ["올해", plYearTotal1, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "연 매출액",
    width: 1500,
    height: 900,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values3"));
  chart.draw(view, options);

} 

// 누적 매출
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getAllTotalPrice); 
 
function getAllTotalPrice(){
   $.ajax({
      type : "get",
      url : "/admin/allTotalPrice",
      data : {
      },
      success : function(result){
         let plAllTotal = result.plAll;
         
         if(plAllTotal == null){ plAllTotal = 0; }
         
         $("#allTotalPrice").text(Number(plAllTotal).toLocaleString('ko-KR'));
         $("#allNetSales").text(Number(plAllTotal*10/100).toLocaleString('ko-KR'));
         
         totalPriceChart4(plAllTotal);
      }// success 종료
   }); // ajax 종료
}

function totalPriceChart4(plAllTotal) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "", { role: "style" } ],
    ["누적", plAllTotal, "color: gold"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "누적 매출액",
    width: 1500,
    height: 900,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values4"));
  chart.draw(view, options);

} 

/* ===================매출액 끝==================== */ 

// 엑셀다운
$("#downloadBtnExcel").click(()=>{
	location.href="/admin/downExcel";
});

// 요약탭
$(document).ready(()=>{
	// 1. 날짜
	let today = new Date();
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);
	let week = new Array('일', '월', '화', '수', '목', '금', '토');
	$("#summ_today").text(year + '-' + month  + '-' + day+"  "+week[today.getDay()]+"요일");
	
	// 2.주문건수
	$.ajax({
      type : "get",
      url : "/admin/countTodayPurchase",
      data : {
      },
      success : function(result){
         let rst = result;
         if(rst == null){ rst = 0; }
         $("#summ_orderCnt").text(Number(rst).toLocaleString('ko-KR'));
      }// success 종료
   }); // ajax 종료
	
	// 3.판매량
	$.ajax({
      type : "get",
      url : "/admin/dayTotalPrice",
      data : {
      },
      success : function(result){
         let plDayTotal1 = result.plDay1;
         if(plDayTotal1 == null){ plDayTotal1 = 0; }
         $("#summ_sales").text(Number(plDayTotal1).toLocaleString('ko-KR'));
      }// success 종료
   }); // ajax 종료
	
   
	// 4. 방문자수
	$.ajax({
      type : "get",
      url : "/visitors/getVisitorList",
      data : {
      },
      success : function(result){
         let todayVisit = result.todayVisit;
  
         $("#summ_visitors").text(Number(todayVisit).toLocaleString('ko-KR'));
      }// success 종료 
   }); // ajax 종료
	// 5. 가입수
	$.ajax({
      type : "get",
      url : "/admin/countTodayJoin",
      data : {
      },
      success : function(result){
         let todayJoin = result;
  
         $("#summ_join").text(Number(todayJoin).toLocaleString('ko-KR'));
      }// success 종료 
   }); // ajax 종료
});
</script>
</html>