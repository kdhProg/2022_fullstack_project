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
			<input type="hidden" id="sqNo" name="sqNo" value="${selQuiryOne.sqNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>상품 Id</th>
				<th>제목</th>
				<th>내용</th>
				<th>답변 상태</th>
				<th>등록 날짜</th>
				<th>작성자</th>
			</tr>
			<tr>
				<td>${selQuiryOne.sqNo}</td>
				<td><a href="/admin/productOne?pdId=${selQuiryOne.sqpdId}">${selQuiryOne.sqpdId}</a></td>
				<td>${selQuiryOne.sqTitle}</td>
				<td>${selQuiryOne.sqContent}</td>
				<td>${selQuiryOne.sqState}</td>
				<td>
					<fmt:parseDate value="${selQuiryOne.sqUpdDate}" var="sqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${sqUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>${selQuiryOne.sqselId}</td>
			</tr>
		</table>
 	
		<div id="reply">
		  <ol class="selAnList">
		    <c:forEach items="${selAnList}" var="selAnList">
		      <li>
		        <p>
		        답변 내용 : ${selAnList.saContents}<br />
		        작성 날짜 : 
		        	<fmt:parseDate value="${selAnList.saUpdDate}" var="saUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
		        	<fmt:formatDate value="${saUpdDate}" pattern="yyyy-MM-dd" />
		        </p>
		        
		      </li>
		    </c:forEach>   
		  </ol>
		</div>
		<form name="insertForm" method="post" action="/admin/selAnswerInsertView?sqNo=${selQuiryOne.sqNo}">
			<div>
				<button type="submit" class="anInsert_btn">답글 등록</button>
			</div>
		</form>	
		<form name="updateForm" method="post" action="/admin/selAnswerUpdateView?sqNo=${selQuiryOne.sqNo}">
			<div>
				<button type="submit" class="anInsert_btn">답글 수정</button>
			</div>
		</form>	
		<form name="listForm" method="post" action="/admin/seller">
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
				formObj.attr("action", "/admin/selAnswerInsertView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
		})
		
		// 답글 수정
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			$(".anUpdate_btn").on("click", function(){
				formObj.attr("action", "/admin/selAnswerUpdateView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
		}
		
		// 목록
		$(document).ready(function(){
			var formObj = $("form[name='listForm']");
			$(".list_btn").on("click", function(){
				location.href = "/admin/seller";
			})
		}
		
</script>
</html>