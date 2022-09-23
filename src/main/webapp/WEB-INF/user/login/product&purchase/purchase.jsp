<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>매너평가</title>

<link rel="stylesheet" type="text/css" href="/myweb/login/product&purchase/purchase.css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
	<h2>구매가 완료되었습니다.</h2><br><br>
	<form name="purchase" id="purchase" method="post" action="evaluation.do">
	<input type="hidden" value="${user.user_seq }">
	<input type="hidden" value="${post.post_seq }">
	<input type="hidden" value="${post.user_seq }">
	<div id="manner">
    <fieldset>
        <legend>매너온도 평가하기</legend>
	        <input type="radio" name="manner_temp" value="5" id="rate1"><label for="rate1">⭐</label>
	        <input type="radio" name="manner_temp" value="4" id="rate2"><label for="rate2">⭐</label>
	        <input type="radio" name="manner_temp" value="3" id="rate3"><label for="rate3">⭐</label>
	        <input type="radio" name="manner_temp" value="2" id="rate4"><label for="rate4">⭐</label>
	        <input type="radio" name="manner_temp" value="1" id="rate5"><label for="rate5">⭐</label>
    </fieldset><br>
    </div>
	<div>
	<hr style="border:1px solid orange;">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1"><b>😀매너 칭찬하기</b></li>
				<li class="tab-link" data-tab="tab-2"><b>😢비매너평가하기</b></li>
				<li class="tab-link" data-tab="tab-3"><b>후기작성하기</b></li>
			</ul>
			<hr style="border:1px solid orange;">
			<div id="tab-1" class="tab-content current">
				<div class="manner_evaluation">
					<input type="checkbox" name="manner_compliment" id="1" value="상품 상태가 설명한 것과 같아요."><label for="1">상품 상태가 설명한 것과 같아요.</label><br>
					<input type="checkbox" name="manner_compliment" id="2" value="시간 약속을 잘 지켜요."><label for="2">시간 약속을 잘 지켜요.</label><br>
					<input type="checkbox" name="manner_compliment" id="3" value="친절하고 매너가 좋아요."><label for="3">친절하고 매너가 좋아요.</label><br>
					<input type="checkbox" name="manner_compliment" id="4" value="좋은 상품을 저렴하게 판매해요."><label for="4">좋은 상품을 저렴하게 판매해요.</label><br>
					<input type="checkbox" name="manner_compliment" id="5" value="응답이 빨라요."><label for="5">응답이 빨라요.</label><br>
					<input type="checkbox" name="manner_compliment" id="6" value="상품설명이 자세해요."><label for="6">상품설명이 자세해요.</label><br>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<div class="manner_evaluation">
					<input type="checkbox" name="bad_manner" id="7" value="상품상태가 설명한 것과 달라요."><label for="7">상품상태가 설명한 것과 달라요.</label><br>
					<input type="checkbox" name="bad_manner" id="8" value="불친절하고 매너가 안좋아요."><label for="8">불친절하고 매너가 안좋아요.</label><br>
					<input type="checkbox" name="bad_manner" id="9" value="시간 약속을 잘 어겨요."><label for="9">시간 약속을 잘 어겨요.</label><br>
					<input type="checkbox" name="bad_manner" id="10" value="상품의 가격이 너무 비싸요."><label for="10">상품의 가격이 너무 비싸요.</label><br>
					<input type="checkbox" name="bad_manner" id="11" value="응답이 느려요."><label for="11">응답이 느려요.</label><br>
					<input type="checkbox" name="bad_manner" id="12" value="상품설명이 부족해요."><label for="12">상품설명이 부족해요.</label><br>
					<input type="checkbox" name="bad_manner" id="13" value="없음."><label for="13">없음.</label><br>
				</div>
			</div>
			<div id="tab-3" class="tab-content">
				<textarea rows="40" cols="40" id="review" name="manner_review">
				</textarea>
			</div>
		</div>
		<input type="submit" value="구매확인" id="confirm" onclick="review1();location.href='main.do'">
		<input type="button" value="취소" id="confirm" onclick="noreview()">
	</form>
	</article>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
<script type="text/javascript" src="/myweb/login/product&purchase/purchase.js"></script>
</body>
</html>