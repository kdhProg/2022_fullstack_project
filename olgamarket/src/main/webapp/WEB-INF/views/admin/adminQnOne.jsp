<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>

<body>
<section id="container">
	<div>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="otqNo" name="otqNo" value="${adminQnOne.otqNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>메인 카테고리</th>
				<th>서브 카테고리</th>
				<th>제목</th>
				<th>내용</th>
				<th>답변 상태</th>
				<th>등록 날짜</th>
				<th>수정 날짜</th>
				<th>작성자</th>
			</tr>
			<tr>
				<td>${adminQnOne.otqNo}</td>
				<td>${adminQnOne.otqMainCategory}</td>
				<td>${adminQnOne.otqSubCategory}</td>
				<td>${adminQnOne.otqTitle}</td>
				<td>${adminQnOne.otqContent}</td>
				<td>${adminQnOne.otqState}</td>
			  	<td>
			  		<fmt:parseDate value="${adminQnOne.otqRegiDate}" var="otqRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${otqRegiDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>
					<fmt:parseDate value="${adminQnOne.otqUpdDate}" var="otqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${otqUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>${adminQnOne.otqmemId}</td>
			</tr>
		</table>
 	
		<div id="reply">
		  <ol class="adminAnList">
		    <c:forEach items="${adminAnList}" var="adminAnList">
		      <li>
		        <p>
		        작성자 : ${adminAnList.otaadmId}<br />
		        메인 카테고리 : ${adminAnList.otaMainCategory}<br />
		        서브 카테고리 : ${adminAnList.otaSubCategory}<br />
		        제목 :  ${adminAnList.otaTitle}<br />
		        답변 내용 : ${adminAnList.otaContent}<br />
		        작성 날짜 : 
		        	<fmt:parseDate value="${adminAnList.otaUpdDate}" var="otaUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
		        	<fmt:formatDate value="${otaUpdDate}" pattern="yyyy-MM-dd" />
		        </p>
		        
		      </li>
		    </c:forEach>   
		  </ol>
		</div>
		<form name="insertForm" method="post" action="/admin/anInsertView?otqNo=${adminQnOne.otqNo}">
			<div>
				<button type="submit" class="anInsert_btn">답글 등록</button>
			</div>
		</form>	
		<form name="updateForm" method="post" action="/admin/anUpdateView?otqNo=${adminQnOne.otqNo}">
			<div>
				<button type="submit" class="anInsert_btn">답글 수정</button>
			</div>
		</form>	
		<form name="listForm" method="post" action="/admin/clientList">
			<div>
				<button type="submit" class="list_btn">목록</button>
			</div>
		</form>	
	</div>
</section>

</body>

<script type="text/javascript">
	//답글 등록
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			$(".anInsert_btn").on("click", function(){
				formObj.attr("action", "/admin/anInsertView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
		})
		
		// 목록
		$(document).ready(function(){
			var formObj = $("form[name='listForm']");
			$(".list_btn").on("click", function(){
				location.href = "/admin/clientList";
			})
		}
		
		// 답글 수정
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			$(".anUpdate_btn").on("click", function(){
				formObj.attr("action", "/admin/anUpdateView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
		}
		
</script>
</html>