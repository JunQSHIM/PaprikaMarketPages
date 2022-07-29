<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.6.0.min.js"></script>
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
</script>
<title>mypage</title>
</head>
<body>
<div class="header">
<c:choose>
<c:when test="${param.id ne null }"><button type="button" onclick="logout()">로그아웃</button><button type="button" onclick="mypage()">마이페이지</button></c:when>
<c:otherwise><button type="button" onclick="login()">로그인</button><button type="button" onclick="register()">회원가입</button></c:otherwise>
</c:choose>
</div>
<hr style="border: 1px solid orange;">
<div class="card">
<div>
	<div id="profile">
	</div>
	<div id="nickname">
		<div id="profile_pic"></div>
		닉네임
		<div id="function">
		<button type="button" id="sell" onclick=move()></button>
		<button type="button" id="buy" onclick=move()></button>
		<button type="button" id="wishlist" onclick=move()></button>
		</div>
	</div>
</div>
<div id="profile_edit">
	<button type="button">프로필 수정</button>
</div>
<div id="manner">
	매너 온도
</div>
<div id="manner_eval">
	받은 매너 평가<br>
	<div id="manner_eval_list">
	1. good
	2. bad
	3. so so
	</div>
</div>
<div id="purchase_review">
	받은 거래 후기<br>	
	
	1. 잘쓸게요
</div>
<div id="logo">
	<img src="images/pklogo.png">
</div>
</div>
</body>
</html>