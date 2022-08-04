<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="mannerEval.css">
<meta charset="UTF-8">
<script>
function move() {
	window.location.href = 'main.jsp';
}
function toMypage() {
	window.location.href = 'mypage.jsp';
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
<title>MannerEval Page</title>
</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<div class="logo">
			<img src="images/pklogo.png" onclick=move()>
		</div>
		<hr style="border: 1px solid orange;">

		<div class="eval_detail">
			<div id="my_manner_head">
				<img src="images/pkIcon.png"><b>내가 받은 매너 평가</b>
			</div>

			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1"><b>😀받은 매너 칭찬</b></li>
				<li class="tab-link" data-tab="tab-2"><b>😢받은 비매너</b></li>
				<li class="tab-link" data-tab="tab-3"><b>참고사항</b></li>
			</ul>

			<div id="tab-1" class="tab-content current">
				<div id="good_manner_detail">
					받은 매너 칭찬이 아직 없어요.
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<div id="bad_manner_detail">
					받은 비매너가 아직 없어요.
				</div>
			</div>
			<div id="tab-3" class="tab-content">
				<div id="notice_detail">
					<b>- 받은 비매너 내역은 나에게만 보입니다.</b><br /><br />
					<b>- 매너 온도가 올라가는 경우(가산점 높은 순)</b><br />
					1. 거래 상대에게 받은 긍정 거래 후기<br />
					2. 거래 상대에게 받은 매너 칭찬<br />
					3. 대화 상대에게 받은 매너 칭찬<br /><br />
					<b>- 매너 온도가 내려가는 경우(감산점 높은 순)</b><br />
					1. 이용정지 징계<br />
					2. 거래 상대의 비매너 평가<br />
					3. 대화 상대의 비매너 평가
				</div>
			</div>
			<div id="toMypage">
				<div id="toMypage_button">
					<button type="button" onclick=toMypage()>마이페이지로</button>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>