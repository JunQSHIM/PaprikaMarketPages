<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/slider/slider.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<meta charset="UTF-8">
<title>slider</title>
</head>
<body>
	<div class="productPage">
	<c:if test="${param.category_seq == null }">
		<div class="slider">
			<c:forEach items="${banner }" var="banner">
				<div>
					<img src="${banner.saved_file_name }">
				</div>
			</c:forEach>
		</div>
	</c:if>
	</div>
</body>
</html>