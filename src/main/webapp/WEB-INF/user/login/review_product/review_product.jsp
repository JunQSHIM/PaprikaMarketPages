<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/myweb/login/review_product/review_product.css">
<script type="text/javascript" src="/myweb/login/review_product/review_product.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="productPage">

			<div class="favorite_body">
				<div class="jjim_list">
					<div class="jjim_list_1">
					 	<a class="sell_product"  href="myProductCart.do?user_seq=${user.user_seq }">상품 <span class="sell_product_span">${total}</span></a>
					 	<a class="review_product">상품후기 <span class="review_product_span">${reviewCnt}</span></a>
					 	<a class="jjim_product"  href="favorite.do?user_seq=${user.user_seq }">찜 <span class="jjim_product_span">${jjimCart}</span></a>
					 </div>
				</div>
			</div>
			<div class="jjim_list_2">
				<div class="jjim_list_3">
					<div class=jjim_list_4>
						<div>
							상점후기
							<span class="jjim_list_4_span">${reviewCnt}</span>
						</div>
				</div>
				
				<div class="review_board">
				<c:forEach items="${manner }" var="manner">
				<div class="none">
					<div class="review_1">
						<a class="other_store" href="#">
							<img src="/myweb/login/images/jjim_icon/store.svg" width="60" height="60" alt="리뷰어 이미지">
						</a>
						<div class="review_board">
							<div class="reviewer_title">
								<div class="reviewer_name">
									<a class="reviewer_name_1">
										준귀염둥이규
									</a>
									<div class="review_date">${manner.create_date }</div>
								</div>
								<a class="review_scores" href="#">
									<div class="review_score">
									<c:if test="${manner.manner_temp == 1 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									<c:if test="${manner.manner_temp == 2 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									<c:if test="${manner.manner_temp == 3 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									<c:if test="${manner.manner_temp == 4 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									<c:if test="${manner.manner_temp == 5 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									</div>
								</a>
							</div>
							<a class="purchase_product" href="#">
								<button class="purchase_name">트레비스 스캇 x 나이키 (정품)
								<img src="/myweb/login/images/jjim_icon/arrow2.png" width="6" height="10" alt="화살표">
								</button>
							</a>
							<div class="review_content">${manner.manner_review }</div>
							<div class="report_body">
								<a class="report_btn">
									<img src="/myweb/login/images/jjim_icon/report.png" width="14" height="14" alt="신고하기">
									신고하기
								</a>
							</div>
						</div>
					</div>
					</div>
					</c:forEach>
		
			</div>
			
			<div class="more_review">
					<button class="more_review_btn">
						<div class="more_review_text">
							상점후기 더보기
						</div>
					</button>
				</div>
			</div>
			
 			</div>
 			<input type="hidden" name="post_seq" value="${post.post_seq }">
</body>
</html>