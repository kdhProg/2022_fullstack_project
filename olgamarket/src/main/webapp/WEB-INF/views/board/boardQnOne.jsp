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
			<input type="hidden" id="otqNo" name="otqNo" value="${boardQnOne.otqNo}" />
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
				<td>${boardQnOne.otqNo}</td>
				<td>${boardQnOne.otqMainCategory}</td>
				<td>${boardQnOne.otqSubCategory}</td>
				<td>${boardQnOne.otqTitle}</td>
				<td>${boardQnOne.otqContent}</td>
				<td>${boardQnOne.otqState}</td>
			  	<td>
			  		<fmt:parseDate value="${boardQnOne.otqRegiDate}" var="otqRegiDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${otqRegiDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>
					<fmt:parseDate value="${boardQnOne.otqUpdDate}" var="otqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${otqUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>${boardQnOne.otqmemId}</td>
			</tr>
		</table>
 	
		<div id="reply">
		  <ol class="adminAnList">
		    <c:forEach items="${boardAnList}" var="boardAnList">
		      <li>
		        <p>
		        작성자 : ${boardAnList.otaadmId}<br />
		        메인 카테고리 : ${boardAnList.otaMainCategory}<br />
		        서브 카테고리 : ${boardAnList.otaSubCategory}<br />
		        제목 :  ${boardAnList.otaTitle}<br />
		        답변 내용 : ${boardAnList.otaContent}<br />
		        작성 날짜 : 
		        	<fmt:parseDate value="${boardAnList.otaUpdDate}" var="otaUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
		        	<fmt:formatDate value="${otaUpdDate}" pattern="yyyy-MM-dd" />
		        </p>
		        
		      </li>
		    </c:forEach>   
		  </ol>
		</div>
		<form name="updateForm" method="post" action="/board/otqUpdateView?otqNo=${boardQnOne.otqNo}">
			<div>
				<button type="submit" class="anInsert_btn">수정</button>
			</div>
		</form>	
		<form name="deleteForm" method="post" action="/board/otqDelete?otqNo=${boardQnOne.otqNo}">
			<div>
				<button type="submit" class="anInsert_btn">삭제</button>
			</div>
		</form>	
		<form name="listForm" method="post" action="/board/client">
			<div>
				<button type="submit" class="list_btn">목록</button>
			</div>
		</form>	
	</div>
</section>

</body>

<script type="text/javascript">
	// 수정	
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		$(".anInsert_btn").on("click", function(){
			formObj.attr("action", "/board/otqUpdateView");
			formObj.attr("method", "get");
			formObj.submit();				
		});
	})
	
	// 삭제
	$(document).ready(function(){
		var formObj = $("form[name='deleteForm']");
		$(".anUpdate_btn").on("click", function(){
			formObj.attr("action", "/board/otqDelete");
			formObj.attr("method", "get");
			formObj.submit();				
		});
	}
	
	// 목록
	$(document).ready(function(){
		var formObj = $("form[name='listForm']");
		$(".list_btn").on("click", function(){
			location.href = "/board/client";
		})
	}
</script>
</html>