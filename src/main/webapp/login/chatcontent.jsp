<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/testWeb/chat/mychat.css">
</head>
<body>
	<div id="chatbox">
		<div id="print">
			${param.id}님과의 채팅
		</div>
		<div id="input">
			<input type="text" name="chatcontent">
			<input type="button" value="전송">
		</div>
	</div>
</body>
</html>