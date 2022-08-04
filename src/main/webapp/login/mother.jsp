<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mother</title>
</head>
<body>

	<%@include file="mothertop.jsp"%>
	
	<%@include file="slider.jsp"%>
	<div class="products">
		<%
		for (int i = 0; i < 20; i++) {
		%>
		<a href="prodpage.jsp">
			<div class="row grid_3 products">
				<div class="pic"></div>
				<div class="text">
					<div class="title">
						<h3>상품명 : 선풍기</h3>
					</div>
					<div class="location">지역 : 부천시</div>
					<div class="price">가격 : 0000원</div>
					<div class="time">3분전</div>
					<div class="wish">♡ 1</div>
				</div>
			</div>
		</a>
		<%
		}
		%>
	</div>
	
	<%@include file="motherbottom.jsp"%>
</body>
</html>