<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					
					<c:forEach items="${post }" var="post">
						<div class="sell_product_board">
							<a class="sell_board" href="postDetail.do?post_seq=${post.post_seq}">
								<div class="sell_image">
									<img src="https://paprikaproject.s3.ap-northeast-2.amazonaws.com/김채원.jpg" width="194" height="194">
									<span class="image_span">
										<img src="/myweb/login/images/jjim_icon/pay.svg" alt="페이 가능">
									</span>
									<div class="inner_sell_image"></div>
								</div>
								<div class="sell_product_detail">
									<div class="sell_product_title">${post.post_title }</div>
									<div class="sell_product_price">
										<div class="sell_product_price_1">
										<fmt:formatNumber value="${post.price }" pattern="###,###,###"/>
										</div>
										<div class="sell_product_time">
											<span>${post.upload_date }</span>
										</div>
									</div>
								</div>
								<div class="sell_location">
									<img src="/myweb/login/images/jjim_icon/location.png" width="15" height="17" alt="위치">
									${post.location }
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
