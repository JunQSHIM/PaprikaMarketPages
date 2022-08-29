<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<div class="products">
		<%
		for (int i = 0; i < 20; i++) {
		%>
		<a href="/myweb/login/product&purchase/product_detail.jsp">
			<div class="row grid_3 products">
				<div class="pic"></div>
				<div class="text">
					<div class="title">
						<h3>상품명 : 아냐</h3>
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