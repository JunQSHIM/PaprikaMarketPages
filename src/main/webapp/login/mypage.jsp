<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="mypage.css">
<meta charset="UTF-8">
<script>
function move()  {
	 window.location.href ='main.jsp';
}
function login()  {
	 window.location.href ='login.jsp';
}	
function register()  {
	 window.location.href ='register.jsp';
}
function mypage(){
	window.location.href = 'mypage.jsp';
}
$(function(){
	$("#innerTempBar").css({
		"width":"30%"
	});
});

function toMannerEval() {
	window.location.href = 'mannerEval.jsp';
}
function toMyReview() {
	window.location.href = 'myReview.jsp';
}
function toProfileEdit() {
	window.location.href = 'profileEdit.jsp';
}
</script>
<title>mypage</title>
</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<div class="logo">
			<img src="images/pklogo.png" onclick=move()>
		</div>
		<hr style="border: 1px solid orange;">

		<div class="card">
			<div id="myPage_head">
				<img src="images/pkIcon.png"><b>마이페이지</b>
			</div>
			<div id="profile">
				<div id="profile_pic"></div>
				<div id="nickname_and_button">
					<div id="nickName">닉네임</div>
					<div id="function">	
						<button type="button" id="sell" onclick=move()></button>
						<button type="button" id="buy" onclick=move()></button>
						<button type="button" id="wishlist" onclick=move()></button>
					</div>
				</div>
				<div id="temperature">
					<div id="mannerTitle">매너온도</div>
					<div id="mannerTemp">123</div>
					<div class="outterTempBar">
						<div id="innerTempBar"></div>
					</div>
					<div id="redeal_and_answer">
						<div id="redeal">
							<b>🧡재거래희망율 -%</b><br/>
							-명 중 -명이 만족
						</div>
						<div id="answer">
							<b>💬응답율 -%</b><br/>
							보통 -분 이내 응답
						</div>
					</div>
				</div>
			</div>
			<div id="profile_edit">
				<div id="edit_button">
					<button type="button" onclick=toProfileEdit()>프로필 수정</button>
				</div>
			</div>
			<div id="eval_and_review">
				<div id="manner_eval">
					<div id="manner_eval_head"><b onclick=toMannerEval()>받은 매너 평가 ></b></div>
					<div id="manner_eval_list">받은 매너 칭찬이 아직 없어요</div>
				</div>
				<div id="purchase_review">
					<div id="review_list_head"><b onclick=toMyReview()>받은 거래 후기 ></b></div>
					<div id="review_list">받은 거래 후기가 아직 없어요</div>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="footer.jsp" %>
		</footer>
	</div>
</body>
</html>