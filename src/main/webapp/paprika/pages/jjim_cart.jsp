<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jjim page</title>

<link href="../css/jjim_cart.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%@include file="../parts/mothertop.jsp"%>

	<div class="productPage">
		<div class="favorite_body">
			<div class="jjim_list">
				<div class="jjim_list_1">
					<a class="sell_product" href="myProductCart.jsp">상품 <span
						class="sell_product_span">1</span></a> <a class="review_product"
						href="review_product.jsp">상품후기 <span
						class="review_product_span">2</span></a> <a class="jjim_product">찜
						<span class="jjim_product_span">1</span>
					</a>
				</div>
			</div>
		</div>
		<div class="jjim_list_2">
			<div class="jjim_list_3">
				<div class=jjim_list_4>
					<div>
						찜 <span class="jjim_list_4_span">1</span>
					</div>
				</div>

			</div>
			<div>
				<div class="jjim_board">
					<div class="jjim_delete">
						<div class="jjim_delete_1">
							<input type="checkbox" id="jjim_delete_btn">
							<button class="select_delete_btn" disabled="disabled"
								onclick="btn()">선택삭제</button>
						</div>
						<div class="array">
							<a class="select_array"> 최신순 </a> <a class="non_select_array">
								인기순 </a> <a class="non_select_array"> 저가순 </a> <a
								class="non_select_array"> 고가순 </a>

						</div>
					</div>

				</div>
				<div class="jjim_board_body">
					<div class="jjim_board_list">
						<a class="jjim_board_article" href="#">
							<div class="article_select">
								<input type="checkbox" class="article_select1">

							</div>
							<div class="jjim_image">
								<img src="../images/jjim_icon/travis.png" alt="상품 이미지">
								<div class="delivery_charge">배송비 포함</div>
								<div class="inner_jjim_image"></div>
							</div>
							<div class="jjim_detail">
								<div class="jjim_detail_1">
									<div class="jjim_title">에어 조던 1 로우 OG SP 트래비스 스캇 프라그먼트
										밀리터리 블루</div>
									<div class="jjim_price">
										<div>17,000</div>
									</div>
									<div class="jjim_day">4일 전</div>
								</div>
								<div class="jjim_location">
									<img src="../images/jjim_icon/location.png" width="15"
										height="17" alt="위치 아이콘"> 서울특별시 성북구 석관동
								</div>
							</div>
						</a>
					</div>

					<div class="jjim_board_list">
						<a class="jjim_board_article" href="#">
							<div class="article_select">
								<input type="checkbox" class="article_select1">

							</div>
							<div class="jjim_image">
								<img src="../images/jjim_icon/travis.png" alt="상품 이미지">
								<div class="delivery_charge">배송비 포함</div>
								<div class="inner_jjim_image"></div>
							</div>
							<div class="jjim_detail">
								<div class="jjim_detail_1">
									<div class="jjim_title">에어 조던 1 로우 OG SP 트래비스 스캇 프라그먼트
										밀리터리 블루</div>
									<div class="jjim_price">
										<div>17,000</div>
									</div>
									<div class="jjim_day">4일 전</div>
								</div>
								<div class="jjim_location">
									<img src="../images/jjim_icon/location.png" width="15"
										height="17" alt="위치 아이콘"> 서울특별시 성북구 석관동
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>

	</div>


	<%@include file="../parts/motherbottom.jsp"%>
</body>
</html>