<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/mypage/mypage.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script>
function move()  {
	 window.location.href ='/myweb/login/main/mother.jsp';
}
function login()  {
	 window.location.href ='/myweb/login/login&register/login.jsp';
}	
function register()  {
	 window.location.href ='/myweb/login/login&register/register.jsp';
}
function mypage(){
	window.location.href = '/myweb/login/mypage/mypage.jsp';
}
$(function(){
	$("#innerTempBar").css({
		"width":"30%"
	});
});

function toMannerEval() {
	window.location.href = '/myweb/login/mypage/mannerEval.jsp';
}
function toMyReview() {
	window.location.href = '/myweb/login/mypage/myReview.jsp';
}
function toProfileEdit() {
	window.location.href = '/myweb/login/mypage/profileEdit.jsp';
}
function verifyLoc() {
	window.location.href = '/myweb/login/location/verify.jsp';
}
</script>
<%
	request.setCharacterEncoding("UTF-8");
	String nearAddr = request.getParameter("nearAddr");
	String myAddr = request.getParameter("myAddr");
	if(nearAddr==null||myAddr==null){
		nearAddr = "동네인증이 필요합니다.";
		myAddr = "";
	}
%>
<title>mypage</title>
</head>
<body>
<header>
		<jsp:include page="/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">

		<div class="card">
			<div id="myPage_head">
				<img src="/myweb/login/images/pkIcon.png"><b>마이페이지</b>
			</div>
			<div id="profile">
				<div id="profile_pic"></div>
				<div id="nickname_and_button">
					<div id="nickName">${user.nickname }</div>
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
					<div id="myLoc">
						<b>내 동네</b>
						<%=myAddr %>
						<%=nearAddr %>
					</div>
				</div>
			</div>
			<div id="profile_edit">
				<div id="edit_button">
					<button type="button" onclick=toProfileEdit()>프로필 수정</button>
					<button type="button" onclick=verifyLoc()>동네 인증하기</button>
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
		</article>
	<footer class="container_12">
		<jsp:include page="/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>