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
	<%@include file="mothertop.jsp"%>
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
			<div class="grid_12 separate"></div>
			<div class="row grid_12 feat">
				<div class="featleft">
					<div class="prodinfo">
						상품정보<hr>
					</div>
 
					
					<div class="feature">대머리 필수품 지금 바로 주문하세요!</div>
				</div>
				<div class="featright">
					<div class="storeinfo">
						상점정보<hr>
					</div>
				
				</div>
			</div>
			<div class="btns">
				<div class="jjimbtn"></div>
			</div>
		</div>
	</div>

	<%@include file="motherbottom.jsp"%>
</body>
</html>