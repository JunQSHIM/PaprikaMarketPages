<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<link rel="stylesheet" type="text/css" href="/myweb/login/myProductCart/myProductCart.css">
					<div class="productPage">
		
		<div align="left" style="margin-bottom:40px;">
		
				<div id="productList">
				홈 > 
				<select onchange="if(this.value) location.href=(this.value);" name="category_seq">
					<option selected disabled>카테고리</option>
					<option value="category.do?category_seq=1">디지털기기</option>
					<option value="category.do?category_seq=2">가구/인테리어</option>
					<option value="category.do?category_seq=3">유아동/유아도서</option>
					<option value="category.do?category_seq=4">생활/가공식품</option>
					<option value="category.do?category_seq=5">스포츠/레저</option>
					<option value="category.do?category_seq=6">여성잡화</option>
					<option value="category.do?category_seq=7">여성의류</option>
					<option value="category.do?category_seq=8">남성패션/잡화</option>
					<option value="category.do?category_seq=9">게임/취미</option>
					<option value="category.do?category_seq=10">뷰티/미용</option>
					<option value="category.do?category_seq=11">반려동물용품</option>
					<option value="category.do?category_seq=12">도서/티켓/음반</option>
					<option value="category.do?category_seq=13">기타 중고물품</option>
					<option value="category.do?category_seq=14">삽니다</option>
				</select>
			</div>
		<font color="red"></font>의 추천상품
	
	</div>	
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
					
					<c:forEach items="${list }" var="post" varStatus="status">
						<div class="sell_product_board">
							<a class="sell_board" href="postDetail.do?post_seq=${post.post_seq}">
								<div class="sell_image">
										<img src="${photo[status.index] }" width="194" height="194">
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
						<div>
		
	</div>
					</div>
					<div class="bottom_space"></div>
				</div>
	<div class="pagingBody">
	 	<div class= "paging">
		<c:if test="${page.prev}">
			<a href="main.do?num=${page.startPageNum - 1}"> ◀ </a>
			
		</c:if>
	
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<c:if test="${select != num}">
					<a href="main.do?num=${num}" class="present_page">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
			
		</c:forEach>

		<c:if test="${page.next}">
			<a href="main.do?num=${page.endPageNum + 1}">▶</a>
			
		</c:if>
		</div>
	</div>
			</div>
			</div>
 			</div>
