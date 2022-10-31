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
	alert("알림이 도착했습니다.");
	$("#noticeList").prepend("<li>"+e.data+"</li>");
}
sock.onclose = function(){
}
function readNotice(){
	var notice_seq = document.getElementById("notice_seq").value;
	$.ajax({ // ajax 기본형태
		url : "/myweb/readNotice.do",
		type : "post",
		data : {
			notice_seq:notice_seq
		}, //위와동일
		success : function(data){ // status, xhr 생략가능 
			$("#readNotice").css("background-color","yellow");
		},
		error : function() { // (파라미터 생략가능)
			alert("error");
		}
	});	
}

</script>
<div class="header_wrap">
	<div class="favorite_part">
			<span onclick="alert('Ctrl+D 키를 누르면 즐겨찾기에 추가하실 수 있습니다.')"
				class="favorite"> <img src="/myweb/login/images/favorite.svg">
				즐겨찾기
			</span>
	</div>

	<div class="button_part">
		<div class="button_wrap" style="z-index: 1; position: relative;">
			<c:choose>
				<c:when test="${user.id ne null and kakaoUser.email eq null }">
					<button type="button" id="notice" class="noticeBtn" onclick="notice()"><img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/alert.png" width="17" height="15" alt="알림">알림</button>
					<button type="button" onclick="location.href='logout.do'">로그아웃</button>
					<button type="button" onclick="location.href='mypage.do'">마이페이지</button>
				</c:when>
				<c:when test="${kakaoUser.email ne null }">
					<button type="button" id="notice" onclick="notice()"><img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/alert.png" width="17" height="15" alt="알림">알림</button>
					<button class="kakaoLogout"type="button" onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=808d349080855e826b4c4cb8c77a836d&logout_redirect_uri=http://ec2-43-201-10-18.ap-northeast-2.compute.amazonaws.com/myweb/kakaoLogout.do'">카카오로그아웃</button>
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
				<c:forEach var="notice" items="${notice}">
				<c:choose>
					<c:when test="${notice.buyerId eq user.nickname }">
						<c:choose>
							<c:when test="${notice.action eq '신고했습니다.' }">
								<li id="readNotice">${notice.sellerId }님의  <button style="border: 0px;" onclick="location.href='/myweb/postDetail.do?post_seq=${notice.seq }'; readNotice()">상품을 신고했습니다.</button>${notice.messageFrom } [${notice.sys_time }]</li>
							</c:when>
							<c:otherwise>
								<li id="readNotice">${notice.sellerId }님의 <button style="background-color: rgba(0,0,0,0);" onclick="location.href='${notice.messageFrom}${notice.seq }'; readNotice()">상품을 </button>${notice.action } [${notice.sys_time }]</li>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="notice_seq" id="notice_seq" value="${notice.notice_seq }">
					</c:when>
					<c:when test="${notice.sellerId eq user.nickname }">
						<c:choose>
							<c:when test="${notice.action eq '신고했습니다.' }">
								<li id="readNotice">${notice.sellerId }님의  <button style="border: 0px;" onclick="location.href='/myweb/postDetail.do?post_seq=${notice.seq }'; readNotice()">상품이 신고당했습니다.</button>${notice.messageFrom } [${notice.sys_time }]</li>
							</c:when>
							<c:otherwise>
								<li id="readNotice">${notice.buyerId }님이 <button style="border: 0px;" onclick="location.href='${notice.messageFrom}${notice.seq }'; readNotice()">상품을 </button>${notice.action } [${notice.sys_time }]</li>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="notice_seq" id="notice_seq" value="${notice.notice_seq }">
					</c:when>
				</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>
 </div>	
