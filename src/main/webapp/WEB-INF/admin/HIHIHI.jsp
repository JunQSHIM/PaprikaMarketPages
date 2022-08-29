<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="user" items="${list }">
<table border="1">
	<tr>
		<td>${user.user_seq }</td>
		<td>${user.id }</td>
		<td>${user.password }</td>
		<td>${user.name }</td>
		<td>${user.nickname }</td>
		<td>${user.birth }</td>
		<td>${user.email }</td>
		<td>${user.phone }</td>
		<td>${user.location1 }</td>
		<td>${user.location2 }</td>
		<td>${user.rep_no }</td>
		<td>${user.fav_category }</td>
		<td>${user.fav_product }</td>
		<td>${user.join_type }</td>	
		<td>${user.msg_agree }</td>
		<td>${user.user_type }</td>
	</tr>
</table>
</c:forEach>
</body>
</html>