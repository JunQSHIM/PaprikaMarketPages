<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/myweb/login/jjim_cart/jjim_cart.css">
<script type="text/javascript" src="/myweb/login/jjim_cart/jjim_cart.js"></script>
<meta charset="UTF-8">
<title>jjim cart</title>
</head>
<body>

			<div class="favorite_body">
				<div class="jjim_list">
					<div class="jjim_list_1">
					 	<a class="sell_product" href="myProductCart.do?user_seq=${user.user_seq }">상품 <span class="sell_product_span">${total }</span></a>
					 	<a class="review_product" href="reviewProductView.do?user_seq=${user.user_seq }">상품후기 <span class="review_product_span">5</span></a>
					 	<a class="jjim_product" >찜 <span class="jjim_product_span">${jjimCart}</span></a>
					 </div>
				</div>
			</div>
			<div class="jjim_list_2">
				<div class="jjim_list_3">
					<div class=jjim_list_4>
						<div>
							찜
							<span class="jjim_list_4_span">${jjimCart }</span>
						</div>
					</div>
					
				</div>
				<div>
				<div class="jjim_board">
					<div class="jjim_delete">
						<div class="jjim_delete_1">
							<div>
							<input type="checkbox" id="jjim_delete_btn" name="allCheck" value="${post.post_seq }">
							<input type ="hidden" value="${post.post_seq }">
							<input type ="hidden" id="user_seq" value="${user.user_seq }">
							
							</div>
							<div>
							<button class="select_delete_btn" disabled="disabled" onclick="jjimDelete()" >선택삭제</button>
							</div>
						</div>
						<div class="array">
								<a class="non_select_array" type="button" onclick="location.href='favorite.do?user_seq=${user.user_seq}&num=${select }&sort=1'">
									최신순
								</a>
								<a class="non_select_array" type="button" onclick="location.href='favorite.do?user_seq=${user.user_seq}&num=${select }&sort=2'">
									인기순
								</a>
								<a class="non_select_array" type="button" onclick="location.href='favorite.do?user_seq=${user.user_seq}&num=${select }&sort=3'">
									저가순
								</a>
								<a class="non_select_array" type="button" onclick="location.href='favorite.do?user_seq=${user.user_seq}&num=${select }&sort=4'">
									고가순
								</a>
							</div>
					</div>
						
					</div>
				<div class="jjim_board_body">
				<c:forEach items="${list }" var="list" varStatus="status">
					<div class="jjim_board_list">
						<a class="jjim_board_article" href="postDetail.do?post_seq=${list.post_seq}">
							<div class="article_select">
								<input type="checkbox"  class="article_select1" name="rowCheck" value="${list.post_seq }">
								
							</div>
						<div class="jjim_image">
							<img src="${ photo[status.index]}" alt="상품 이미지" class="jjimImage">
							<c:choose>
								<c:when test="${list.pay_check == 1 }">
									<div class="delivery_charge">카카오페이</div>
								</c:when>
								<c:when test="${list.pay_check == 1 }">
									<div class="delivery_charge" style="visibility: hidden;">카카오페이</div>
								</c:when>
							
							</c:choose>
							<div class="inner_jjim_image"></div>
						</div>
					<div class="jjim_detail">
							<div class="jjim_detail_1">
								<div class="jjim_title">${list.post_title }</div>
								<div class="jjim_price">
									<div>
										<fmt:formatNumber value="${list.price }" pattern ="###,###,###"></fmt:formatNumber>
									</div>
								</div>
								<div class="jjim_day">4일 전</div>
							</div>
						<div class="jjim_location">
							<img src="/myweb/login/images/jjim_icon/location.png" width="15" height="17" alt="위치 아이콘">
							${list.location1 }
						</div>
					</div>
					</a>
					</div>
					</c:forEach>
				</div>
			</div>
	<div class="pagingBody">
	<div class= "paging">
		<c:if test="${page.prev}">
			<a href="favorite.do?user_seq=${user.user_seq }&num=${page.startPageNum - 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12" class="prev"></a>
			
		</c:if>
	
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<c:if test="${select != num}">
					<a href="favorite.do?user_seq=${user.user_seq }&num=${num}" class="present_page">${num}</a>
				</c:if>
			<c:if test="${select == num}"><b>${num}</b>
				</c:if>
			
		</c:forEach>

		<c:if test="${page.next}">
			<a href="favorite.do?user_seq=${user.user_seq }&num=${page.endPageNum + 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12"></a>
			
		</c:if>
		</div>
		</div>
			</div>
			
 		
</body>
</html>