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
			<input type="hidden" id="iqNo" name="iqNo" value="${adminQuiryOne.iqNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>상품 아이디</th>
				<th>제목</th>
				<th>내용</th>
				<th>답변 상태</th>
				<th>등록 날짜</th>
				<th>작성자</th>
			</tr>
			<tr>
				<td>${adminQuiryOne.iqNo}</td>
				<td>${adminQuiryOne.iqpdId}</td>
				<td>${adminQuiryOne.iqTitle}</td>
				<td>${adminQuiryOne.iqContent}</td>
				<td>${adminQuiryOne.iqState}</td>
			  	<td>
			  		<fmt:parseDate value="${adminQuiryOne.iqUpdDate}" var="iqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${iqUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>${adminQuiryOne.iqmemId}</td>
			</tr>
		</table>
 	
		<div id="reply">
		  <ol class="answerList">
		    <c:forEach items="${answerList}" var="answerList">
		      <li>
		        <p>
		        작성자 : ${answerList.iaiqNo}<br />
		        답변 내용 : ${answerList.iaContents}<br />
		        작성 날짜 : 
		        	<fmt:parseDate value="${answerList.iqUpdDate}" var="iqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
		        	<fmt:formatDate value="${iqUpdDate}" pattern="yyyy-MM-dd" />
		        </p>
		        
		      </li>
		    </c:forEach>   
		  </ol>
		</div>
		<form name="insertForm" method="post" action="/admin/answerInsertView?iqNo=${adminQuiryOne.iqNo}">
			<div>
				<button type="submit" class="anInsert_btn">답글 등록</button>
			</div>
		</form>	
		<form name="updateForm" method="post" action="/admin/answerUpdateView?iqNo=${adminQuiryOne.iqNo}">
			<div>
				<button type="submit" class="anInsert_btn">답글 수정</button>
			</div>
		</form>	
		<form name="listForm" method="post" action="/admin/product">
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
				formObj.attr("action", "/admin/answerInsertView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
		})
		
	// 목록
		$(document).ready(function(){
			var formObj = $("form[name='listForm']");
			$(".list_btn").on("click", function(){
				location.href = "/admin/product";
			});
		}
		
	// 답글 수정
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			$(".anUpdate_btn").on("click", function(){
				formObj.attr("action", "/admin/answerUpdateView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
		}
		
</script>
</body>
</html>