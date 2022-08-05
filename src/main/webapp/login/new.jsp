<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new</title>
<link rel="stylesheet" type="text/css" href="new.css">
</head>
<body>

	<%@include file="mothertop.jsp"%>

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
			<div class="grid_2 explain">상품이미지</div>
			
		</div>
		<div class="grid_12 title">
			<div class="grid_2 explain">제목</div>
		</div>
		<div class="grid_12 categ">
			<div class="grid_2 explain">카테고리</div>
		</div>
		<div class="grid_12 location">
			<div class="grid_2 explain">거래지역</div>
		</div>
		<div class="grid_12 state">
			<div class="grid_2 explain">상태</div>
		</div>
		<div class="grid_12 refund">
			<div class="grid_2 explain">교환</div>
		</div>
		<div class="grid_12 price">
			<div class="grid_2 explain">가격</div>
		</div>
		<div class="grid_12 feat">
			<div class="grid_2 explain">설명</div>
		</div>
		<div class="grid_12 tag">
			<div class="grid_2 explain">연관태그</div>
		</div>

		<div class="fastsell">
		<div class="fastsell_1">빠른 판매</div>
		<div class="fastsell_2">내 상품에 안전결제 배지가 표시돼요 <a href="#">자세히</a></div>
			<div class="grid_2 explain">옵션</div>
		</div>



	</div>




	<%@include file="motherbottom.jsp"%>
</body>
</html>