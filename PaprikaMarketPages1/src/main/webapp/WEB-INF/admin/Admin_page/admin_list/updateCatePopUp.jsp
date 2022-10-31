<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
</script>
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${qnaCate eq null }">
	<form action="updateCatePopUp.mdo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<label>카테고리 수정</label>
		<select name="qna_title" id="qna_title">
		<c:forEach var="qnaList" items="${qnaList }">
			<option value="${qnaList.qna_title }">${qnaList.qna_title }</option>
		</c:forEach>
		</select>
		<input type="submit" value="확인">
	</form>
	</c:when>
	<c:otherwise>
	<form action="updateCatePopUpConfirm.mdo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="qna_seq" value="${qnaCate.qna_seq }">
		<label>카테고리 수정</label>
		<input type="text" name="qna_title" value="${qnaCate.qna_title }">
		<input type="submit" value="확인">
	</form>
	</c:otherwise>
</c:choose>

</body>
</html>