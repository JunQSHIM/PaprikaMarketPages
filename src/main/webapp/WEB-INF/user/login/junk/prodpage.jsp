<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<link rel="stylesheet" type="text/css" href="prodpage.css">
</head>
<body>
	<header>
		<jsp:include page="/login/main/header/header.jsp"></jsp:include>
	</header>

	<article class="container_12">
		<jsp:include page="/login/main/category.jsp"></jsp:include>
	</article>
	<br>
	<div class="prodread">
		<div class="grid_12 read">
			<div class="grid_5 pics">

				<img class="grid_5" src="images/hair.png">

			</div>
			<div class="grid_7 texts">

				<div class="innertext">
					<div class="row grid_6 user">
						<div class="grid_1 psa">
							<img class="grid_1" src="images/hair.png">
						</div>
						<div class="grid_2 name">
							<h3>장문기</h3>
							<div class="grid_2 location">부천시 상동</div>
						</div>
						<div class="grid_2 mannertemp">45도</div>
					</div>
					<div class="proinfo_1">

						<div class="cate">카테고리 : 아동</div>
						<div class="title">가발</div>
						<div class="price">3,000원</div>

						<hr>
					</div>
					<div class="proinfo_2">
						<div class="state">
							<div class="s_1_1">
								<img src="images/jjim.png" alt="찜">
							</div>
							<div class="s_1_2">8</div>
							<div class="s_bar">|</div>
							<div class="s_2_1">
								<img src="images/count.png" alt="조회수">
							</div>
							<div class="s_2_2">57</div>
							<div class="s_bar">|</div>
							<div class="s_3_1">
								<img src="images/time.png" alt="업로드된 시간">
							</div>
							<div class="s_3_2">8시간 전</div>
							<div class="s_4_1">
								<a href="#"><img src="images/report.png" alt="신고" /></a>
							</div>

						</div>
						<div class="clear row buybtns">
							<div class="grid_2 jjimbtn">♡ 찜 8</div>
							<div class="grid_2 chat talk">

								<img src="images/talkmark.png" alt="파프리카톡">파프리카톡

							</div>
							<div class="grid_2 buy">바로구매</div>
						</div>
						<div class="data"></div>


					</div>

				</div>
			</div>
			<div class="grid_12 separate"></div>
			<hr>

			<div class="row grid_12 feat">
				<div class="grid_8 featleft">
					<div class="innerfl">
						<div class="prodinfo">
							상품정보
							<hr>
						</div>


						<div class="feature">
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
							<p>대머리 필수품 지금 바로 주문하세요!</p>
						</div>
					</div>
				</div>
				<div class="grid_4 featright">
					<div class="innerfr">

						<div class="row storeinfo">
							<div class="storeinfo_1">
								상점정보
								<hr>
							</div>
							<div class="storeinfo_2">
								<div class="row user">
									<div class="grid_1 psa">
										<img class="grid_1" src="images/hair.png">
									</div>
									<div class="grid_1 name">
										<h3>장문기</h3>
										<div class="grid_1 location">부천시 상동</div>
									</div>
									<div class="grid_1 mannertemp">45도</div>

								</div>
								<div>
									<hr>
								</div>
							</div>
							<div class="row gird_2 storeinfo_3">
								<div class="grid_1 review">
									<b>상점후기</b>
								</div>
								<div class="count">41</div>
								<div class="clear">
									<hr>
								</div>
								<div class="reviews">
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
									<p>김유신 : 와이라노</p>
								</div>
							</div>
						</div>
					</div>
					<div class="grid_4 buybtns_feat">
						<div class="chat talk">

							<img src="images/talkmark.png" alt="파프리카톡">파프리카톡

						</div>
						<div class="buy">바로구매</div>
					</div>
				</div>
			</div>
			<div class="btns">
				<div class="jjimbtn"></div>
			</div>
		</div>
	</div>
	<footer class="container_12">
		<jsp:include page="/login/main/footer/footer1.jsp"></jsp:include>
	</footer>

</body>
</html>