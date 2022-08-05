<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="grid_12 row header">
	<div class="grid_3 app">
		<div>
			<span onclick="alert('Ctrl+D 키를 누르면 즐겨찾기에 추가하실 수 있습니다.')"
				class="favorite"> <img src="../images/favorite.svg">
				즐겨찾기
			</span>
		</div>
	</div>
	<div class="grid_6 empty"></div>
	<div class="grid_3 topbt">
		<c:choose>
			<c:when test="${param.id ne null }">
				<a class="alarm_message">알림</a>
				<button type="button" onclick="logout()">로그아웃</button>
				<button type="button" onclick="mypage()">마이페이지</button>
			</c:when>
			<c:otherwise> 
				<button type="button" onclick="login()">로그인</button>
				<button type="button" onclick="register()">회원가입</button>
			</c:otherwise>
		</c:choose> 
	</div>
</div>