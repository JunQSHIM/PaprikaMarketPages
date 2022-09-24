<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="myReview.css">
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<meta charset="UTF-8">
<script>
function move() {
	window.location.href = '/myweb/login/main/mother.jsp';
}
function toMypage() {
	window.location.href = '/myweb/login/mypage/mypage.jsp';
}

$(document).ready(function(){
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
})
</script>
<title>My Review Page</title>
</head>
<body>
<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
	
		<div class="review_detail">
			<div id="review_head">
				<img src="/myweb/login/images/pkIcon.png"><b>나의 거래 후기</b>
			</div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1"><b>전체 후기</b></li>
				<li class="tab-link" data-tab="tab-2"><b>판매자 후기</b></li>
				<li class="tab-link" data-tab="tab-3"><b>구매자 후기</b></li>
			</ul>
	
			<div id="tab-1" class="tab-content current">
				<div id="good_manner_detail">
					후기가 아직 없어요.
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<div id="bad_manner_detail">
					판매자 후기가 아직 없어요.
				</div>
			</div>
			<div id="tab-3" class="tab-content">
				<div id="notice_detail">
					구매자 후기가 아직 없어요
				</div>
			</div>
			<div id="toMypage">
				<div id="toMypage_button">
					<button type="button" onclick=toMypage()>마이페이지로</button>
				</div>
			</div>
		</div>
	</article>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>