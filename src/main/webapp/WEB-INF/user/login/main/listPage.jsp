<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/WEB-INF/user/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/main/grid.css">
<link href="/myweb/login/main/prods.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>

</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>

	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/user/login/slider/slider.jsp"></jsp:include>
	</article>
	<article class="container_12">




		<%@include file="/WEB-INF/user/login/main/prods.jsp"%>

	</article>
	<div>
		<c:if test="${prev}">
			<span>[ <a href="category.do?num=${startPageNum - 1}">이전</a> ]
			</span>
		</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <c:if test="${select != num}">
					<a href="category.do?num=${num}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
			</span>
		</c:forEach>

		<c:if test="${next}">
			<span>[ <a href="category.do?num=${endPageNum + 1}">다음</a> ]
			</span>
		</c:if>
	</div>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>