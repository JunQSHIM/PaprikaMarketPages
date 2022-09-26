<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/mypage/mannerEval.css">
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<meta charset="UTF-8">
<script> 
function move() {
	window.location.href = 'main.do';
}
function toMypage() {
	window.location.href = 'mypage.do';
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
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">

		<div class="eval_detail">
			<div id="my_manner_head">
				<img src="/myweb/login/images/pkIcon.png"><b>내가 받은 매너 평가</b>
			</div>

			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1"><b>😀받은 매너 칭찬</b></li>
				<li class="tab-link" data-tab="tab-2"><b>😢받은 비매너</b></li>
				<li class="tab-link" data-tab="tab-3"><b>참고사항</b></li>
			</ul>

			<div id="tab-1" class="tab-content current">
			<c:if test="${reviewCnt == 0 }">
				<div id="good_manner_detail">
					받은 매너 칭찬이 아직 없어요.
				</div>
			</c:if>
				<c:if test="${reviewCnt != 0 }">
				<div id="good_manner_detail">
					
						<ul>
							<li>상품 상태가 설명한 것과 같아요. ${mannerProd} </li>
						</ul>
					
				</div>
			</c:if>
			</div>
			<div id="tab-2" class="tab-content">
			<c:if test="${reviewCnt == 0 }">
				<div id="bad_manner_detail">
					받은 비매너가 아직 없어요.
				</div>
			</c:if>
			<c:if test="${reviewCnt != 0 }">
				<div id="bad_manner_detail">
				<c:forEach items="${manner }" var="manner">
					<ul>
						<li>${manner.bad_manner }</li>
					</ul>
				</c:forEach>
				</div>
			</c:if>
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

	</article>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>