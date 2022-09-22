<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/header/css/headertop.css">
<!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
$(document).ready(function(){
	$("#noticeList").hide();
	
	$("#notice").mouseenter(function() {
		$("#noticeList").show();
	});
	$("#noticeList").mouseleave(function() {
		$("#noticeList").hide();
	});
});
var sock = new SockJS("/myweb/echo");
sock.onmessage = function(e){
	$("#noticeList").append("<li>"+e.data+"</li>");
}
sock.onclose = function(){
	alert("quit");
}

</script>
<div class="header_wrap">
	<div class="favorite_part">
			<span onclick="alert('Ctrl+D 키를 누르면 즐겨찾기에 추가하실 수 있습니다.')"
				class="favorite"> <img src="/myweb/login/images/favorite.svg">
				즐겨찾기
			</span>
	</div>
 </div>
	<div class="button_part">
		<div class="button_wrap" style="z-index: 1; position: relative;">
			<c:choose>
				<c:when test="${user.id ne null }">
					<button type="button" id="notice" onclick="notice()">알림</button>
					<button type="button" onclick="location.href='logout.do'">로그아웃</button>
					<button type="button" onclick="location.href='mypage.do'">마이페이지</button>
				</c:when>
				<c:when test="${kakaoUser.email ne null }">
					<button type="button" id="notice" onclick="notice()">알림</button>
					<button type="button" onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=808d349080855e826b4c4cb8c77a836d&logout_redirect_uri=http://localhost:8080/myweb/kakaoLogout.do'">로그아웃</button>
					<button type="button" onclick="location.href='mypage.do'">마이페이지</button>
				</c:when>
				<c:otherwise> 
					<button type="button" onclick="location.href='loginForm.do'">로그인</button>
					<button type="button" onclick="location.href='insert.do'">회원가입</button>
				</c:otherwise>
			</c:choose> 
		</div>
		<div id="noticeList" style="z-index: 0; position: absolute; background-color:orange; width:300px;">
			<ul id="nList">
			</ul>
		</div>
	</div>
	
