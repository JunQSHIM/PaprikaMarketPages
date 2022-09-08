<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/WEB-INF/user/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/main/grid.css">
<link href="/myweb/login/main/prods.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<%
	String p = request.getParameter("product");
%>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/login/main/category.jsp"></jsp:include>
		<jsp:include page="/login/slider/slider.jsp"></jsp:include>
	</article>
	<article class="container_12">
	
	<div align="left" style="margin-bottom:40px;">
		<c:choose>
			<c:when test="${param.product ne null}">
				<div id="productList">
				홈 > 
				<select onchange="if(this.value) location.href=(this.value);">
					<option selected disabled>카테고리</option>
					<option value="mother.jsp?product=디지털기기">디지털기기</option>
					<option value="mother.jsp?product=생활가전">생활가전</option>
					<option value="mother.jsp?product=가구/인테리어">가구/인테리어</option>
					<option value="mother.jsp?product=유아동">유아동</option>
					<option value="mother.jsp?product=유아도서">유아도서</option>
					<option value="mother.jsp?product=생활/가공식품">생활/가공식품</option>
					<option value="mother.jsp?product=스포츠/레저">스포츠/레저</option>
					<option value="mother.jsp?product=여성잡화">여성잡화</option>
					<option value="mother.jsp?product=여성의류">여성의류</option>
					<option value="mother.jsp?product=남성패션/잡화">남성패션/잡화</option>
					<option value="mother.jsp?product=게임/취미">게임/취미</option>
					<option value="mother.jsp?product=뷰티/미용">뷰티/미용</option>
					<option value="mother.jsp?product=반려동물용품">반려동물용품</option>
					<option value="mother.jsp?product=도서/티켓/음반">도서/티켓/음반</option>
					<option value="mother.jsp?product=식물">식물</option>
					<option value="mother.jsp?product=기타 중고물품">기타 중고물품</option>
					<option value="mother.jsp?product=삽니다">삽니다</option>
				</select>
			</div>
		<font color="red"><%=p %></font>의 추천상품
			</c:when>
		</c:choose>
	</div>	
	<%@include file="/WEB-INF/user/login/main/prods.jsp"%>
	</article>
	<footer class="container_12">
		<jsp:include page="/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>