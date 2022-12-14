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
					 	<a class="review_product" href="reviewProductView.do?user_seq=${user.user_seq }">상품후기 <span class="review_product_span">${reviewCnt }</span></a>
					 	<a class="jjim_product" href="favorite.do?user_seq=${user.user_seq }">찜 <span class="jjim_product_span">${jjimCart }</span></a>
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
								<c:forEach items="${clist }" var="clist">
								<a class="digital_category" data-value="${clist.category_seq }">${clist.category_name }</a>
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
								<a class="non_select_array" type="button" onclick="location.href='myProductCart.do?user_seq=${user.user_seq}&num=${select }&sort=1'">
									최신순
								</a>
								<a class="non_select_array" type="button" onclick="location.href='myProductCart.do?user_seq=${user.user_seq}&num=${select }&sort=2'">
									인기순
								</a>
								<a class="non_select_array" type="button" onclick="location.href='myProductCart.do?user_seq=${user.user_seq}&num=${select }&sort=3'">
									저가순
								</a>
								<a class="non_select_array" type="button" onclick="location.href='myProductCart.do?user_seq=${user.user_seq}&num=${select }&sort=4'">
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
										<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/kakao.png" width="60" height="30" alt="페이 가능">
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
						
					</div>
					<div class="bottom_space"></div>
				</div>
					<div class="pagingBody">
	 		<div class= "paging">
		<c:if test="${page.prev}">
			<a href="myProductCart.do?user_seq=${user.user_seq }&num=${page.startPageNum - 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12" class="prev"></a>
			
		</c:if>
	
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<c:if test="${select != num}">
					<a href="myProductCart.do?user_seq=${user.user_seq }&num=${num}" class="present_page">${num}</a>
				</c:if>
			<c:if test="${select == num}"><b>${num}</b>
				</c:if>
			
		</c:forEach>

		<c:if test="${page.next}">
			<a href="myProductCart.do?user_seq=${user.user_seq }&num=${page.endPageNum + 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12"></a>
			
		</c:if>
		</div>
	</div>
			</div>
			</div>
 			</div>
 <script type="text/javascript" src="/myweb/login/myProductCart/myProductCart.js"></script>
</body>
</html>