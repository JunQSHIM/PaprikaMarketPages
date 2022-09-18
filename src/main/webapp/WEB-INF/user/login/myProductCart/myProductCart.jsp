<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/myweb/login/myProductCart/myProductCart.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			
			<div class="productPage">
			<div class="favorite_body">
				<div class="jjim_list">
					<div class="jjim_list_1">
					 	<a class="sell_product">상품 <span class="sell_product_span">${total }</span></a>
					 	<a class="review_product" href="/myweb/login/review_product.jsp">상품후기 <span class="review_product_span">5</span></a>
					 	<a class="jjim_product" href="/myweb/login/jjim_cart.jsp">찜 <span class="jjim_product_span">2</span></a>
					 </div>
				</div>
			</div>
			<div class="jjim_list_2">
				<div class="jjim_list_3">
					<div class=jjim_list_4>
						<div>
							상품
							<span class="jjim_list_4_span">${total }</span>
						</div>
					<div class="product_category">
						<div class="product_category_1">
							<div class="product_category_2">
								전체
								<img src="/myweb/login/images/jjim_icon/category_arrow.png" width="10" height="6" alt="카테고리 화살표 아이콘">
							</div>
							<div class="product_category_3">
								<a class="all_category">전체</a>
								<c:forEach items="${clist }" var="category">
								<a class="digital_category" data-value="${category.category_seq }">${category.category_name }</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="sell_cart_1">
					<div class="sell_cart_2">
						<div class="sell_cart_3">
							<div class="sell_cart_4">
								<div>전체</div>
								<span class="sell_cart_4_span">${total } 개</span>
							</div>
							<div class="array">
								<a class="select_array">
									최신순
								</a>
								<a class="non_select_array">
									인기순
								</a>
								<a class="non_select_array">
									저가순
								</a>
								<a class="non_select_array">
								고가순
								</a>
							</div>
						</div>
					</div>
					
					<div class="sell_product_cart">
					
					<c:forEach items="${list }" var="post" varStatus="status">
						<div class="sell_product_board">
							<a class="sell_board" href="postDetail.do?post_seq=${post.post_seq}">
								<div class="sell_image">
								<c:if test="${post.sell_status == 0 }">
									<img src="${photo[status.index] }" width="194" height="194">
								</c:if>
								<c:if test="${post.sell_status == 2 }">
									<img src="${photo[status.index] }" width="194" height="194">
									<div class="reservation">
										<div>판매</div>
										<img src="/myweb/login/images/jjim_icon/reservation.png" width="11" height="11" alt="판매 불가 아이콘">
										<div>완료</div>
									</div>
								</c:if>
									<span class="image_span">
								<c:choose>
									<c:when test="${post.pay_check == 1 }">
										<img src="/myweb/login/images/jjim_icon/pay.svg" alt="페이 가능">
									</c:when>
              				 		<c:when test="${post.pay_check == 0 }">
               							<img src="/myweb/login/images/jjim_icon/pay.svg" style="visibility: hidden;" alt="페이 가능">
               						</c:when>
								</c:choose>
									
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
									${post.location1 }
								</div>
							</a>
						</div>
						</c:forEach>
						
						
						<div class="sell_product_board">
							<a class="sell_board" href="#">
								<div class="sell_image">
									<img src="./images/jjim_icon/santiago.png" width="194" height="194">
									<div class="reservation">
										<div>판매</div>
										<img src="/myweb/login/images/jjim_icon/reservation.png" width="11" height="11" alt="판매 불가 아이콘">
										<div>완료</div>
									</div>
									<div class="inner_sell_image"></div>
								</div>
								<div class="sell_product_detail">
									<div class="sell_product_title">스파이 패밀리-아냐</div>
									<div class="sell_product_price">
										<div class="sell_product_price_1">
											150,000
										</div>
										<div class="sell_product_time">
											<span>8시간 전</span>
										</div>
									</div>
								</div>
								<div class="sell_location">
									<img src="./images/jjim_icon/location.png" width="15" height="17" alt="위치">
									전국
								</div>
							</a>
						</div>
						
						
						
					</div>
					<div class="bottom_space"></div>
				</div>
					<div class="pagingBody">
	 	<div class= "paging">
		<c:if test="${page.prev}">
			<a href="myProductCart.do?num=${page.startPageNum - 1}"> ◀ </a>
			
		</c:if>
	
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<c:if test="${select != num}">
					<a href="myProductCart.do?num=${num}" class="present_page">${num}</a>
				</c:if>
			<c:if test="${select == num}"><b>${num}</b>
				</c:if>
			
		</c:forEach>

		<c:if test="${page.next}">
			<a href="myProductCart.do?num=${page.endPageNum + 1}">▶</a>
			
		</c:if>
		</div>
	</div>
			</div>
			</div>
 			</div>
 <script type="text/javascript" src="/myweb/login/myProductCart/myProductCart.js"></script>
</body>
</html>