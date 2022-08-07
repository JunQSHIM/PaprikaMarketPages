<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new</title>
<link rel="stylesheet" type="text/css" href="../css/new.css">
</head>
<body>

	<%@include file="../parts/mothertop.jsp"%>

	<div class="grid_12 management">
		<div class="register">상품등록</div>
		<div class="bar">|</div>
		<div class="manager">상품관리</div>
		<div class="bar">|</div>
		<div class="hist">구매/판매 내역</div>

	</div>
	<div class="grid_12 newinfo">
		<div class="newinfo_1">
			<div class="grid_2 newinfo_1_1">기본정보</div>
			<div class="grid_2 newinfo_1_2">*필수항목</div>
		</div>
		<div class="grid_12 proimg">
			<div class="grid_3 explain">
				상품이미지
				<div class="star">*</div>
			</div>
			<div class="grid_9 newdata">
				<div class="grid_9 pics">
					<div class="grid_2 regpic">
						<div class="file_0">
							<div class="file_1">
								<input type="file">
							</div>
							<div class="file_2">
								<img src="../images/regpic.png" alt="이미지등록" onclick="#">
							</div>
						</div>
					</div>
					<div class="grid_2 regedpic">1</div>
					<div class="grid_2 regedpic">1</div>
					<div class="grid_2 regedpic">1</div>

				</div>
				<div class="clear grid_9 warn">
					* 상품 이미지는 640x640에 최적화 되어 있습니다. <br> - 상품 이미지는 PC에서는 1:1,
					모바일에서는 1:1.23 비율로 보여집니다. <br>- 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다.
					<br>- 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다. <br>- 이미지를 클릭 후
					이동하여 등록순서를 변경할 수 있습니다. <br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수
					있습니다. <br>최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
				</div>
			</div>

		</div>
		<div class="grid_12 title">
			<div class="grid_3 explain">
				제목
				<div class="star">*</div>
			</div>
			<div class="grid_9 newdata">
				<div class="titlebox">
					<input type="text" name="title" placeholder="상품 제목을 입력해주세요.">
					<a href="#">거래금지 품목</a>
				</div>

			</div>
		</div>
		<div class="grid_12 categ">
			<div class="grid_3 explain">
				카테고리
				<div class="star">*</div>
			</div>
			<div class="grid_9 newdata">1</div>
		</div>
		<div class="grid_12 location">
			<div class="grid_3 explain">
				거래지역
				<div class="star">*</div>
			</div>
			<div class="grid_9 newdata">1</div>
		</div>
		<div class="grid_12 state">
			<div class="grid_3 explain">
				상태
				<div class="star">*</div>
			</div>
			<div class="grid_9 newdata">
				<input type="radio" name="state" value="secondhand">중고상품 <input
					type="radio" name="state" value="newone">새상품
			</div>
		</div>
		<div class="grid_12 refund">
			<div class="grid_3 explain">
				교환
				<div class="star">*</div>
			</div>
			<div class="grid_9 newdata">
				<input type="radio" name="refund" value="can">환불가능 <input
					type="radio" name="refund" value="cannot">환불불가
			</div>
		</div>
		<div class="grid_12 price">
			<div class="grid_3 explain">
				가격
				<div class="star">*</div>
			</div>
			<div class="grid_9 newdata">
				<input type="number" name="price" placeholder="숫자만 입력해주세요.">
				원<input type="checkbox" name="shipfee"> 배송비 포함
			</div>
		</div>
		<div class="grid_12 feat">
			<div class="grid_3 explain">
				설명
				<div class="star">*</div>
			</div>
			<div class="grid_9 newdata">
			<textarea placeholder=""></textarea></div>
		</div>
		<div class="grid_12 tag">
			<div class="grid_3 explain">연관태그</div>
		</div>

		<div class="fastsell">
			<div class="grid_2 fastsell_1">빠른 판매</div>
			<div class="grid_5 fastsell_2">
				내 상품에 안전결제 배지가 표시돼요 <a href="#">자세히</a>
			</div>
			<div class="clear"></div>
			<div class="grid_3 explain">옵션</div>
			<div class="grid_9 newdata">1</div>
		</div>



	</div>




	<%@include file="../parts/motherbottom.jsp"%>
</body>
</html>