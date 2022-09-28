<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계 만들기</title>
</head>
<body>
	제목 : <input type="text" id="new_card_title">
	<select>
		<option value="post">상품</option>
		<option value="board">게시판</option>
		<option value="post">상품</option>
		<option value="singo">신고</option>
		<option value="inAndout?">가입/탈퇴</option>
	</select>
	
	<select id="postmenu">
		<option value="todaypost">일주일 등록된 상품 수</option>
		<option value="board">카테고리별</option>
		<option value="post">조회수</option>
		<option value="singo">가격대</option>
		<option value="inAndout?">가입/탈퇴</option>
	</select>

	<select id="boardmenu">
		<option value="todaypost">일주일 등록된 게시글</option>
		<option value="board">가격순</option>
		<option value="post">상품</option>
		<option value="singo">신고</option>
	</select>
	
	
</body>
</html>