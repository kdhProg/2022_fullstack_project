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
.col{
/*    border: 1px solid red; */
}
/* 김동훈추가끝 */
</style>
<body>
<div class="container">
   <nav class="navbar bg-light">
      <div class="container-fluid">
         <a class="navbar-brand" href="/admin/storeList">판매점</a>
         <a class="navbar-brand" href="/admin/seller">판매자</a>
         <a class="navbar-brand" href="/admin/product">상품</a>
         <a class="navbar-brand" href="/admin/clientList">고객센터</a>
         <a class="navbar-brand" href="/admin/memberGrade">회원</a>
         <a class="navbar-brand" href="/admin/adminStats">통계</a>   
      </div>
   </nav>
   
   <br />
   <a href="#" onclick="noticeList(1);return false;" id="noticeBt" class="btn btn-primary">방문자 수</a>
   <a href="#" onclick="faqList(1);return false;" id="faqBt" class="btn btn-primary">판매량</a>
   <a href="#" onclick="otList(1);return false;" id="onetooneBt" class="btn btn-primary">매출액</a>
</div>
<!-- 김동훈 작업 시작 -->

<br />
<br />
<div class="container">
   <div class="row">
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
      <div class="col col-lg-9">
         <div id='chart_div' ></div>
      </div>
   </div>
</div>
<br />
<br />
<br />

<!-- 매출액 div -->
<br />
<br />

<!-- 일별 -->
<div class="container">
	<div class="col col-lg-3">
         <div class="row">
            <div class="col border-grey">
               <p class="focus_font">총 매출액</p>
               <div id="todayTotalPrice" class="focus_font"></div>
            </div>
         </div>
         <div class="row">
            <div class="col border-grey">
               <p class="focus_font">순 매출액</p>
               <div id="netSales" class="focus_font"></div>
            </div>
         </div>
      </div>
   <div class="row">
      <div class="col col-lg-9">
         <div id='columnchart_values' ></div>
      </div>
   </div>
</div>

<br />
<br />

<!-- 김동훈 작업 끝 -->   
</body>
<script>
$("#noticeBt").on("click", function() {
   $(this).css('font-weight', 'bold');
   $('#noticeDiv').css('display', 'block');
   $("#faqBt").css('font-weight', 'normal');
   $("#onetooneBt").css('font-weight', 'normal');
   $('#faqDiv').css('display', 'none');
   $('#otoDiv').css('display', 'none');
});
$("#faqBt").on("click", function() {
   $(this).css('font-weight', 'bold');
   $('#faqDiv').css('display', 'block');
   $("#noticeBt").css('font-weight', 'normal');
   $("#onetooneBt").css('font-weight', 'normal');
   $('#noticeDiv').css('display', 'none');
   $('#otoDiv').css('display', 'none');
});
$("#onetooneBt").on("click", function() {
   $(this).css('font-weight', 'bold');
   $('#otoDiv').css('display', 'block');
   $("#noticeBt").css('font-weight', 'normal');
   $("#faqBt").css('font-weight', 'normal');
   $('#faqDiv').css('display', 'none');
   $('#noticeDiv').css('display', 'none');
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
    displayAnnotations: true
  };

  chart.draw(data, options);
}

/* ===================김동훈추가끝==================== */
/* ===================매출액==================== */

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
         let plTotal = result.plListTotal;
         let plTotal2 = result.plListTotal2;
         let plTotal3 = result.plListTotal3;
         let plTotal4 = result.plListTotal4;
         
         if(plTotal == null){
        	 plTotal = 0;
         }
         if(plTotal2 == null){
        	 plTotal2 = 0;
         }
         if(plTotal3 == null){
        	 plTotal3 = 0;
         }
         if(plTotal4 == null){
        	 plTotal4 = 0;
         }
         
         $("#todayTotalPrice").text(Number(plTotal).toLocaleString('ko-KR'));
         $("#netSales").text(Number(plTotal*10/100).toLocaleString('ko-KR'));
         
         drawChart2(plTotal, plTotal2, plTotal3, plTotal4);
      }// success 종료
   }); // ajax 종료
}

function drawChart2(plTotal, plTotal2, plTotal3, plTotal4) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "Density", { role: "style" } ],
    ["3일전", plTotal4, "#b87333"],
    ["2일전", plTotal3, "silver"],
    ["1일전", plTotal2, "gold"],
    ["오늘", plTotal, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "일일 매출액",
    width: 600,
    height: 400,
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
      url : "/admin/",
      data : {
      },
      success : function(result){
         let plTotal = result.plListTotal;
         let plTotal2 = result.plListTotal2;
         let plTotal3 = result.plListTotal3;
         let plTotal4 = result.plListTotal4;
         
         if(plTotal == null){
        	 plTotal = 0;
         }
         if(plTotal2 == null){
        	 plTotal2 = 0;
         }
         if(plTotal3 == null){
        	 plTotal3 = 0;
         }
         if(plTotal4 == null){
        	 plTotal4 = 0;
         }
         
         $("#todayTotalPrice").text(Number(plTotal).toLocaleString('ko-KR'));
         $("#netSales").text(Number(plTotal*10/100).toLocaleString('ko-KR'));
         
         drawChart3(plTotal, plTotal2, plTotal3, plTotal4);
      }// success 종료
   }); // ajax 종료
}

function drawChart3(plTotal, plTotal2, plTotal3, plTotal4) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "Density", { role: "style" } ],
    ["3일전", plTotal4, "#b87333"],
    ["2일전", plTotal3, "silver"],
    ["1일전", plTotal2, "gold"],
    ["오늘", plTotal, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "일일 매출액",
    width: 600,
    height: 400,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
  chart.draw(view, options);

} 

// 연별 매출
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getYearTotalPrice); 
 
function getYearTotalPrice(){
   $.ajax({
      type : "get",
      url : "/admin/",
      data : {
      },
      success : function(result){
         let plTotal = result.plListTotal;
         let plTotal2 = result.plListTotal2;
         let plTotal3 = result.plListTotal3;
         let plTotal4 = result.plListTotal4;
         
         if(plTotal == null){
        	 plTotal = 0;
         }
         if(plTotal2 == null){
        	 plTotal2 = 0;
         }
         if(plTotal3 == null){
        	 plTotal3 = 0;
         }
         if(plTotal4 == null){
        	 plTotal4 = 0;
         }
         
         $("#todayTotalPrice").text(Number(plTotal).toLocaleString('ko-KR'));
         $("#netSales").text(Number(plTotal*10/100).toLocaleString('ko-KR'));
         
         drawChart4(plTotal, plTotal2, plTotal3, plTotal4);
      }// success 종료
   }); // ajax 종료
}

function drawChart4(plTotal, plTotal2, plTotal3, plTotal4) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "Density", { role: "style" } ],
    ["3일전", plTotal4, "#b87333"],
    ["2일전", plTotal3, "silver"],
    ["1일전", plTotal2, "gold"],
    ["오늘", plTotal, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "일일 매출액",
    width: 600,
    height: 400,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
  chart.draw(view, options);

} 

// 누적 매출
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(getTotalPrice); 
 
function getTotalPrice(){
   $.ajax({
      type : "get",
      url : "/admin/daySalesVolume",
      data : {
      },
      success : function(result){
         let plTotal = result.plListTotal;
         let plTotal2 = result.plListTotal2;
         let plTotal3 = result.plListTotal3;
         let plTotal4 = result.plListTotal4;
         
         if(plTotal == null){
        	 plTotal = 0;
         }
         if(plTotal2 == null){
        	 plTotal2 = 0;
         }
         if(plTotal3 == null){
        	 plTotal3 = 0;
         }
         if(plTotal4 == null){
        	 plTotal4 = 0;
         }
         
         $("#todayTotalPrice").text(Number(plTotal).toLocaleString('ko-KR'));
         $("#netSales").text(Number(plTotal*10/100).toLocaleString('ko-KR'));
         
         drawChart2(plTotal, plTotal2, plTotal3, plTotal4);
      }// success 종료
   }); // ajax 종료
}

function drawChart2(plTotal, plTotal2, plTotal3, plTotal4) {
  var data = google.visualization.arrayToDataTable([
    ["기간", "Density", { role: "style" } ],
    ["3일전", plTotal4, "#b87333"],
    ["2일전", plTotal3, "silver"],
    ["1일전", plTotal2, "gold"],
    ["오늘", plTotal, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "일일 매출액",
    width: 600,
    height: 400,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
  chart.draw(view, options);

} 

 
 
</script>
</html>