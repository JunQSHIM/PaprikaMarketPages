<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my review</title>
<link rel="stylesheet" type="text/css" href="../css/myReview.css">
</head>
<body>

	<%@include file="../parts/mothertop.jsp"%>


	<div class="review_detail">
		<div id="review_head">
			<img src="../images/pkIcon.png"><b>나의 거래 후기</b>
		</div>
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1"><b>전체 후기</b></li>
			<li class="tab-link" data-tab="tab-2"><b>판매자 후기</b></li>
			<li class="tab-link" data-tab="tab-3"><b>구매자 후기</b></li>
		</ul>

		<div id="tab-1" class="tab-content current">
			<div id="good_manner_detail">후기가 아직 없어요.</div>
		</div>
		<div id="tab-2" class="tab-content">
			<div id="bad_manner_detail">판매자 후기가 아직 없어요.</div>
		</div>
		<div id="tab-3" class="tab-content">
			<div id="notice_detail">구매자 후기가 아직 없어요</div>
		</div>
		<div id="toMypage">
			<div id="toMypage_button">
				<button type="button" onclick=toMypage()>마이페이지로</button>
			</div>
		</div>
	</div>


	<%@include file="../parts/motherbottom.jsp"%>
</body>
</html>