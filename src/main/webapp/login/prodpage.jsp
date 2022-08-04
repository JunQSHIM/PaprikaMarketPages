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

	<div class="prodread"> 
		<div class="grid_12 read">
			<div class="grid_6 pics">
				사진
				<div class="grid_5 innerpics">
					<img class="grid_5" src="images/hair.png">
				</div>
			</div>
			<div class="grid_6 texts">
				정보
				<div class="grid_5 innertext">
					<div class="row grid_5 user">
						<div class="grid_1 psa">
							<img class="grid_1" src="images/hair.png">
						</div>
						<div class="grid_2 name">
							<h3>장문기</h3>
							<div class="grid_2 location">부천시 상동</div>
						</div>
						<div class="grid_2 mannertemp">45도</div>
					</div>
					<div class="proinfo">
						<div class="title">가발</div>
						<div class="price">3000원</div>
						<div class="cate">아동</div>
						<div class="data">
							<div class="grid_1 jjim">♡ 3</div>
							<div class="grid_3 empty">&nbsp;</div>
							<div class="grid_1 time">4분전</div>
						</div>


					</div>

				</div>
			</div>
			<div class="grid_12 feat">
				설명
				<div class="grid_11">대머리 필수품 지금 바로 주문하세요!</div>
			</div>
			<div class="btns">
			<div class="jjimbtn"></div>
			</div>
		</div>
	</div>

	<%@include file="motherbottom.jsp"%>
</body>
</html>