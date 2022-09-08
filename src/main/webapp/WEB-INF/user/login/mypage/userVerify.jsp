<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="verify.do" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<label>생년월일을 입력해주세요.</label>
	<input type="date" id="birth" name="birth">
	<input type="submit" value="전송">
</form>
</body>
</html>