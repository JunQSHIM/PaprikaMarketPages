<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>Insert title here</title>
</head>
<body>
<form action="updateQPopUpConfirmed.mdo">
	<input type="hidden" value="${q_seq }" name="q_seq">
	<input type="hidden" value="${a_seq }" name="a_seq">
	<label>질문 수정</label>
	<input type="text" placeholder="${question}" name="question">
	<label>답변 수정</label>
	<input type="text" placeholder="${answer }" name="answer">
	<input type="submit" value="전송">
</form>
</body>
</html>