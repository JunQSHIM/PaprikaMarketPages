<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
					<div class="productPage">
		
		<div>
		<c:if test="${param.category_seq != null }">
				<div id="productList">
				홈 > 
				<select onchange="if(this.value) location.href=(this.value);" name="category_seq">
					<option selected disabled>카테고리선택&nbsp;&nbsp;▼</option>
					
					<c:if test="${param.category_seq == 1 }">
					<option value="category.do?category_seq=1" selected>디지털기기</option>
					</c:if>
					<c:if test="${param.category_seq != 1 }">
					<option value="category.do?category_seq=1">디지털기기</option>
					</c:if>
					<c:if test="${param.category_seq == 2 }">
					<option value="category.do?category_seq=2" selected>가구/인테리어</option>
					</c:if>
					<c:if test="${param.category_seq != 2 }">
					<option value="category.do?category_seq=2">가구/인테리어</option>
					</c:if>
					<c:if test="${param.category_seq == 3 }">
					<option value="category.do?category_seq=3" selected>유아동/유아도서</option>
					</c:if>
					<c:if test="${param.category_seq != 3 }">
					<option value="category.do?category_seq=3" >유아동/유아도서</option>
					</c:if>
					<c:if test="${param.category_seq == 4 }">
					<option value="category.do?category_seq=4" selected>생활/가공식품</option>
					</c:if>
					<c:if test="${param.category_seq != 4 }">
					<option value="category.do?category_seq=4">생활/가공식품</option>
					</c:if>
					<c:if test="${param.category_seq == 5 }">
					<option value="category.do?category_seq=5" selected>스포츠/레저</option>
					</c:if>
					<c:if test="${param.category_seq != 5 }">
					<option value="category.do?category_seq=5">스포츠/레저</option>
					</c:if>
					<c:if test="${param.category_seq == 6 }">
					<option value="category.do?category_seq=6" selected>여성잡화</option>
					</c:if>
					<c:if test="${param.category_seq != 6 }">
					<option value="category.do?category_seq=6">여성잡화</option>
					</c:if>
					<c:if test="${param.category_seq == 7 }">
					<option value="category.do?category_seq=7" selected>여성의류</option>
					</c:if>
					<c:if test="${param.category_seq != 7 }">
					<option value="category.do?category_seq=7">여성의류</option>
					</c:if>
					<c:if test="${param.category_seq == 8 }">
					<option value="category.do?category_seq=8" selected>남성패션/잡화</option>
					</c:if>
					<c:if test="${param.category_seq != 8 }">
					<option value="category.do?category_seq=8">남성패션/잡화</option>
					</c:if>
					<c:if test="${param.category_seq == 9 }">
					<option value="category.do?category_seq=9" selected>게임/취미</option>
					</c:if>
					<c:if test="${param.category_seq != 9 }">
					<option value="category.do?category_seq=9">게임/취미</option>
					</c:if>
					<c:if test="${param.category_seq == 10 }">
					<option value="category.do?category_seq=10" selected>뷰티/미용</option>
					</c:if>
					<c:if test="${param.category_seq != 10 }">
					<option value="category.do?category_seq=10">뷰티/미용</option>
					</c:if>
					<c:if test="${param.category_seq == 11}">
					<option value="category.do?category_seq=11" selected>반려동물용품</option>
					</c:if>
					<c:if test="${param.category_seq != 11}">
					<option value="category.do?category_seq=11">반려동물용품</option>
					</c:if>
					<c:if test="${param.category_seq == 12}">
					<option value="category.do?category_seq=12" selected>도서/티켓/음반</option>
					</c:if>
					<c:if test="${param.category_seq != 12}">
					<option value="category.do?category_seq=12">도서/티켓/음반</option>
					</c:if>
					<c:if test="${param.category_seq == 13 }">
					<option value="category.do?category_seq=13" selected>기타 중고물품</option>
					</c:if>
					<c:if test="${param.category_seq != 13 }">
					<option value="category.do?category_seq=13">기타 중고물품</option>
					</c:if>
					<c:if test="${param.category_seq == 14 }">
					<option value="category.do?category_seq=14" selected>삽니다</option>
					</c:if>
					<c:if test="${param.category_seq != 14 }">
					<option value="category.do?category_seq=14">삽니다</option>
					</c:if>
				</select>
			</div>
			</c:if>

			<c:if test="${param.category_seq == 1 }">
			<div class="cate"><span class="cate_list">디지털기기/가전</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 2 }">
			<div class="cate"><span class="cate_list">가구/인테리어</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 3 }">
			<div class="cate"><span class="cate_list">유아용/유아도서</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 4 }">
			<div class="cate"><span class="cate_list">생활/가공식품</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 5 }">
			<div class="cate"><span class="cate_list">스포츠/레저</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 6 }">
			<div class="cate"><span class="cate_list">여성잡화</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 7 }">
			<div class="cate"><span class="cate_list">여성의류</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 8 }">
			<div class="cate"><span class="cate_list">남성패션/잡화</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 9 }">
			<div class="cate"><span class="cate_list">게임/취미</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 10 }">
			<div class="cate"><span class="cate_list">뷰티/미용</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 11 }">
			<div class="cate"><span class="cate_list">반려동물용품</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 12 }">
			<div class="cate"><span class="cate_list">도서/티켓/음반</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 13 }">
			<div class="cate"><span class="cate_list">기타 중고물품</span>의 추천상품</div>
			</c:if>
			<c:if test="${param.category_seq == 14 }">
			<div class="cate"><span class="cate_list">삽니다</span>의 추천상품</div>
			</c:if>
	</div>	
			<div class="jjim_list_2">
				<div class="jjim_list_3">
					
				<div class="sell_cart_1">
					<div class="sell_cart_2">
						<div class="sell_cart_3">
							<div class="sell_cart_4">
							<c:if test="${param.category_seq == null }">
								<div class="today_prod"><h2>오늘의 상품 추천</h2></div>
							</c:if>	
							</div>
							
						</div>
					</div> 
					<div class="sell_product_cart">
					
					<c:choose>
					<c:when test="${param.category_seq != null}">
					<c:forEach items="${ct }" var="post" varStatus="status">
						<div class="sell_product_board">
							<a class="sell_board" href="postDetail.do?post_seq=${post.post_seq}&user_seq=${user.user_seq}">
								<div class="sell_image">
										<img src="${photo[status.index] }" width="194" height="194">
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
						</c:when>
						</c:choose>
						
						<c:if test="${param.category_seq == null }">
						<c:forEach items="${list }" var="post" varStatus="status">
						<div class="sell_product_board">
						
							<a class="sell_board" href="postDetail.do?post_seq=${post.post_seq}&user_seq=${user.user_seq}">
								<div class="sell_image">
										<img src="${photo[status.index] }" width="194" height="194">
									<span class="image_span">
										<c:choose>
									<c:when test="${post.pay_check == 1 }">
										<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/kakao.png" width="60" height="30"alt="페이 가능">
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
					</c:if>
					</div>
					<div class="bottom_space"></div>
				</div>
	<c:if test="${param.category_seq != null }">
	<div class="pagingBody">
	 	<div class= "paging">
		<c:if test="${page.prev}">
			<a href="category.do?category_seq=${param.category_seq }&num=${page.startPageNum - 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12" class="prev"></a>
			
		</c:if>
	
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<c:if test="${select != num}">
					<a href="category.do?category_seq=${param.category_seq }&num=${num}" class="present_page">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
			
		</c:forEach>

		<c:if test="${page.next}">
			<a href="category.do?category_seq=${param.category_seq }&num=${page.endPageNum + 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12"></a>
			
		</c:if>
		</div>
	</div>
	</c:if>
	
	
	
	
	<c:if test="${param.category_seq == null }">
	<div class="pagingBody">
	 	<div class= "paging">
		<c:if test="${page.prev}">
		<c:if test="${page.keyword == null }">
			<a href="main.do?num=${page.startPageNum - 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12" class="prev"></a>
		</c:if>
		<c:if test="${page.keyword != null }">
			<a href="main.do?keyword=${page.keyword }&num=${page.startPageNum - 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12" class="prev"></a>
		</c:if>
			
		</c:if>
	
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<c:if test="${select != num}">
					<c:if test="${page.keyword == null }">
						<a href="main.do?num=${num}" class="present_page">${num}</a>
					</c:if>
					<c:if test="${page.keyword != null }">
						<a href="main.do?keyword=${page.keyword }&num=${num}" class="present_page">${num}</a>
					</c:if>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
			
		</c:forEach>

		<c:if test="${page.next}">
		<c:if test="${page.keyword == null }">
			<a href="main.do?num=${page.endPageNum + 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12"></a>
		</c:if>	
		<c:if test="${page.keyword != null }">
			<a href="main.do?keyword=${page.keyword }&num=${page.endPageNum + 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12"></a>
		</c:if>
		</c:if>
		</div>
	</div>
	</c:if>
			</div>
			</div>
 			</div>
