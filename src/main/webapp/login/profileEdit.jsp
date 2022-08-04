<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="profileEdit.css">
<meta charset="UTF-8">
<title>프로필 수정</title>
</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<div class="logo">
			<img src="images/pklogo.png" onclick=move()>
		</div>
		<hr style="border: 1px solid orange;">

		<div class="edit_detail">
			<div id="edit_head">
				<img src="images/pkIcon.png"><b>프로필 수정</b>
			</div>
			<div id="edit">
				<input id="my_pic" type="file" accept="image/*" onchange="setThumbnail(event);"/>
				<div id="profile_pic">
					<img id="profile_pic_update" src="images/profile.png">
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
		<footer>
			<%@include file="footer.jsp"%>
		</footer>
	</div>
<script>
function move() {
	window.location.href = 'main.jsp';
}
function toMypage() {
	window.location.href = 'mypage.jsp';
}
function upload() {
    let myPic = document.getElementById("my_pic");
    myPic.click();
}

function setThumbnail(event){
    var reader = new FileReader();
    console.log('hi');
    reader.onload = function(event){
       var img = document.createElement("img");
       img.setAttribute("src", event.target.result);
       img.setAttribute("height", '100%');
             
       if(document.getElementById("profile_pic").childNodes.length!=0){
			removeAllchild(document.getElementById("profile_pic"));
       }
       document.getElementById("profile_pic").appendChild(img).setAttribute('width','100%');
     };
    
    reader.readAsDataURL(event.target.files[0]);
}

function removeAllchild(div) {
  while (div.hasChildNodes()) {
      div.removeChild(div.firstChild);
  }
}
</script>
</body>
</html>