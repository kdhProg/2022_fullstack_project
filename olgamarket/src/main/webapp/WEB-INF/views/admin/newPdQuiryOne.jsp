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
			<input type="hidden" id="npqNo" name="npqNo" value="${newPdQuiryOne.npqNo}" />
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>내용</th>
				<th>상세 이미지</th>
				<th>답변 상태</th>
				<th>등록 날짜</th>
				<th>작성자</th>
			</tr>
			<tr>
				<td>${newPdQuiryOne.npqNo}</td>
				<td>${newPdQuiryOne.npqTitle}</td>
				<td>${newPdQuiryOne.npqContent}</td>
				<td>${newPdQuiryOne.npqImg}</td>
				<td>${newPdQuiryOne.npqState}</td>
				<td>
					<fmt:parseDate value="${newPdQuiryOne.npqUpdDate}" var="npqUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${npqUpdDate}" pattern="yyyy.MM.dd"/>
				</td>
				<td>${newPdQuiryOne.npqselId}</td>
			</tr>
		</table>
 	
		<div id="reply">
		  <ol class="newPdAnList">
		    <c:forEach items="${newPdAnList}" var="newPdAnList">
		      <li>
		        <p>
		        답변 내용 : ${newPdAnList.npaContent}<br />
		        작성 날짜 : 
		        	<fmt:parseDate value="${newPdAnList.npaUpdDate}" var="npaUpdDate" pattern="yyyy-MM-dd HH:mm:ss"/> 
		        	<fmt:formatDate value="${npaUpdDate}" pattern="yyyy-MM-dd" />
		        </p>
		        
		      </li>
		    </c:forEach>   
		  </ol>
		</div>	
		<form name="insertForm" method="post" action="/admin/newPdAnswerInsertView?npqNo=${newPdQuiryOne.npqNo}">
			<div>
				<button type="submit" class="npaInsert_btn">답글 등록</button>
			</div>
		</form>
		<form name="updateForm" method="post" action="/admin/newPdAnswerUpdateView?npqNo=${newPdQuiryOne.npqNo}">
			<div>
				<button type="submit" class="npaDelete_btn">답글 수정</button>
			</div>
		</form>	
		<form name="listForm" method="post" action="/seller/dedicated">
			<div>
				<button type="submit" class="list_btn">목록</button>
			</div>
		</form>	
	</div>
</section>

</body>
</html>