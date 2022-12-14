<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	 window.location.href ='main.do';
}
function login()  {
	 window.location.href ='login.do';
}	
function register()  {
	 window.location.href ='register.do';
}
function mypage(){
	window.location.href = 'mypage.do';
}
$(function(){
	$("#innerTempBar").css({
		"width":"30%"
	});
});

function toMannerEval() {
	window.location.href = 'mannerView.do';
}
function toMyReview() {
	window.location.href = '/myweb/login/mypage/myReview.jsp';
}
function toProfileEdit() {
	window.location.href = 'profileEdit.do';
}
</script>
<title>mypage</title>
</head>
<body>
<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
	
		<div class="card">
			<div id="myPage_head">
				<img src="/myweb/login/images/pkIcon.png"><b>마이페이지</b>
			</div>
			<div id="profile">
					<div id="profile_pic" style="background-image: url(${user.profile_image});"></div>
				<div id="nickname_and_button">
					<div id="nickName">
					${user.nickname }
							&nbsp;&nbsp;<c:if test="${user.pay ne null }">&#127818;</c:if>
					</div>
					<div id="function">	
						<button type="button" id="sell" onclick="location.href='myProductCart.do?user_seq=${user.user_seq}'"></button>
						<button type="button" id="buy" onclick=move()></button>
						<button type="button" id="wishlist" onclick="location.href='favorite.do?user_seq=${user.user_seq}'"></button>
					</div>
				</div>
				<div id="temperature">
					<div id="mannerTitle">매너온도</div>
					<div id="mannerTemp">${user.temp }℃</div>
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
						<c:choose>
							<c:when test="${user.location1 ne null }">
								${user.location1 } / ${user.location2 }
							</c:when>
							<%-- <c:when test="${user.location1 ne null and kakaoUser.location1 ne null}">
								${user.location1 } / ${user.location2 }
							</c:when>
							<c:when test="${user.location1 ne null and kakaoUser.location1 eq null}">
								${user.location1 } / ${user.location2 }
							</c:when> --%>
							<c:otherwise>
								동네 인증이 필요합니다!
							</c:otherwise>
						</c:choose>
						<br>
						<div id="verifyBirth">
						<c:choose>
						<c:when test="${user.join_type eq 0}">
							<b>생년월일</b><fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/>
						</c:when>
						<c:when test="${user.birth ne null and kakaoUser.available eq 0}"><b>본인인증</b><a href="/myweb/userVerify.do" style="cursor: pointer;" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">본인인증이 필요합니다.</a></c:when>
						<c:otherwise><b>생년월일</b><fmt:formatDate value="${kakaoUser.birth}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;<a href="/myweb/userVerify.do" style="cursor: pointer;" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">생년월일변경하기</a></c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div id="profile_edit">
				<div id="edit_button">
				<c:if test="${user.join_type == 0 }">
					<button type="button" onclick=toProfileEdit()>프로필 수정</button>
				</c:if>
				<c:if test="${user.join_type == 1 }">
					<button type="button" onclick=toProfileEdit() style="visibility:hidden;">프로필 수정</button>
				</c:if>
					<button type="button" onclick="location.href='location.do'">동네 인증하기</button>
					<button type="button" onclick="location.href='pay.do'">파프리카 페이 사용하기</button>
					<button type="button" onclick="location.href='withdrawalView.do?user_seq=${user.user_seq}'">회원탈퇴</button>
				</div>
			</div>
			<div id="eval_and_review">
				<div id="manner_eval">
					<div id="manner_eval_head"><b onclick=toMannerEval()>받은 매너 평가 ></b></div>
					<c:if test="${reviewCnt == 0 }">
						<div id="manner_eval_list">받은 매너 칭찬이 아직 없어요</div>
					</c:if>
					<c:if test="${reviewCnt != 0 }">
						<div id="manner_eval_list">받은 매너 평가 보러가기</div>
					</c:if>
				</div>
				<div id="purchase_review">
					<div id="review_list_head"><b onclick="location.href='reviewProductView.do?user_seq=${user.user_seq}'">받은 거래 후기 ></b></div>
					<c:if test="${reviewCnt == 0 }">
					<div id="review_list">받은 거래 후기가 아직 없어요</div>
					</c:if>
					<c:if test="${reviewCnt != 0 }">
					<div id="review_list">
						${reviewCnt }건의 거래 후기가 있습니다.
					</div>
					</c:if>
				</div>
			</div>
		</div>
		</article>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>