<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<link rel="stylesheet" type="text/css" href="../css/profileEdit.css">
</head>
<body>

	<%@include file="../parts/mothertop.jsp"%>


	<div class="edit_detail">
			<div id="edit_head">
				<img src="../images/pkIcon.png"><b>프로필 수정</b>
			</div>
			<div id="edit">
				<input id="my_pic" type="file" accept="image/*" onchange="setThumbnail(event);"/>
				<div id="profile_pic">
					<img id="profile_pic_update" src="../images/profile.png">
				</div>
				<div id="nickname_edit">
					<input type="text" id="new_nickname" placeholder="새로운 닉네임">
					<button type="button">중복확인</button>
					<br><br><br>
					<input type="text" id="new_pwd" placeholder="새 비밀번호"><br><br>
					<input type="password" id="pwd_check" placeholder="비밀번호 확인">
				</div>
			</div>
			<div id="upload_bottom">
				<div id="upload_button">
					<button id="upload" onclick=upload()>프로필 사진 수정</button>
				</div>
			</div>
			<div id="toMypage">
				<div id="edit_submit">
					<button type="button" onclick=toMypage()>수정하기</button>
				</div>
				<div id="toMypage_button">
					<button type="button" onclick=toMypage()>취소</button>
				</div>
			</div>
		</div>


	<%@include file="../parts/motherbottom.jsp"%>
</body>
</html>