<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link rel="stylesheet" type="text/css" href="/myweb/login/myProductCart/myProductCart.css">
	

	
	
					<div class="productPage">
		
			<div class="jjim_list_2">
				<div class="jjim_list_3">
					
				<div class="sell_cart_1">
					<div class="sell_cart_2">
						<div class="sell_cart_3">
							<div class="sell_cart_4">
								<div><span>오늘의 상품 추천</span></div>
							</div>
							
						</div>
					</div>
					<div class="sell_product_cart">
					<c:forEach items="${board }" var="boardList">
						<div class="sell_product_board">
							<a class="sell_board" href="#">
								<div class="sell_image">
									<img src="/myweb/login/images/jjim_icon/anya.jpg" width="194" height="194">
									<span class="image_span">
										<img src="/myweb/login/images/jjim_icon/pay.svg" alt="페이 가능">
									</span>
									<div class="inner_sell_image"></div>
								</div>
								<div class="sell_product_detail">
									<div class="sell_product_title">${boardList.prod_title }</div>
									<div class="sell_product_price">
										<div class="sell_product_price_1">
											${boardList.price }
										</div>
										<div class="sell_product_time">
											<span>8시간 전</span>
										</div>
									</div>
								</div>
								<div class="sell_location">
									<img src="/myweb/login/images/jjim_icon/location.png" width="15" height="17" alt="위치">
									${boardList.location }
								</div>
							</a>
						</div>
						</c:forEach>
						
						
						
					</div>
					<div class="bottom_space"></div>
				</div>
			</div>
			</div>
 			</div>
