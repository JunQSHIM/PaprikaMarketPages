<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					 	<a class="review_product">상품후기 <span class="review_product_span">5</span></a>
					 	<a class="jjim_product"  href="favorite.do?user_seq=${user.user_seq }">찜 <span class="jjim_product_span">${jjimCart}</span></a>
					 </div>
				</div>
			</div>
			<div class="jjim_list_2">
				<div class="jjim_list_3">
					<div class=jjim_list_4>
						<div>
							상점후기
							<span class="jjim_list_4_span">5</span>
						</div>
				</div>
				<div class="review_board">
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
									<div class="review_date">2주 전</div>
								</div>
								<a class="review_scores" href="#">
									<div class="review_score">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</div>
								</a>
							</div>
							<a class="purchase_product" href="#">
								<button class="purchase_name">트레비스 스캇 x 나이키 (정품)
								<img src="/myweb/login/images/jjim_icon/arrow2.png" width="6" height="10" alt="화살표">
								</button>
							</a>
							<div class="review_content">잘 신겠습니다. 감사합니다.</div>
							<div class="report_body">
								<a class="report_btn">
									<img src="/myweb/login/images/jjim_icon/report.png" width="14" height="14" alt="신고하기">
									신고하기
								</a>
							</div>
						</div>
					</div>
					</div>
					
		
			</div>
			</div>
			
 			</div>
</body>
</html>