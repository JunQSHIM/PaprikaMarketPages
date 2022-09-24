<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/mypage/profileEdit.css">
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<meta charset="UTF-8">
<title>프로필 수정</title>
<script>
function move() {
	window.location.href = '/myweb/login/main/mother.jsp';
}
function toMypage() {
	window.location.href = '/myweb/login/mypage/mypage.jsp';
}
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">

		<div class="edit_detail">
			<div id="edit_head">
				<img src="/myweb/login/images/pkIcon.png"><b>프로필 수정</b>
			</div>
			<form action="mypageProc.do" method="post" name="edit" id="edit">
   			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div id="edit">
				<input id="my_pic" type="file" accept="/myweb/login/image/*" onchange="setThumbnail(event);"/>
				<div id="profile_pic">
					<img id="profile_pic_update" src="/myweb/login/images/profile.png">
				</div>
				<div id="nickname_edit">
					<input type="text" name="nickname" id="nickname" placeholder="새로운 닉네임" oninput="checkNickname()">
					<div id="result7"></div>
					<input type="password" name="password" id="password" placeholder="새 비밀번호"><br><br>
					<input type="password" name="repassword" id="passwordCheck" placeholder="비밀번호 확인">
					<div id="result"></div>
				</div>
			</div>
			<div id="upload_bottom">
				<div id="upload_button">
					<button id="upload" onclick=upload()>프로필 사진 수정</button>
				</div>
			</div>
			<div id="toMypage">
				<button type="button" id="editSubmit" value="수정하기">수정하기</button>
				<div id="toMypage_button">
					<button type="button" onclick=toMypage()>취소</button>
				</div>
			</div>
			</form>
		</div>
		</article>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
<script>
function move() {
	window.location.href = 'main.do';
}
function toMypage() {
	window.location.href = 'mypage.do';
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
function checkNickname() {
	var theForm = document.edit;
	var nickname1 = theForm.nickname.value; 
	var nickname = nickname1.trim();
	if(!theForm.nickname.value){
		document.getElementById('result7').innerHTML = '<font color="red">닉네임을 입력해주세요.</font>';
		setOutline(theForm.nickname, "2px solid red");
		theForm.nickname.focus();
	}
	$.ajax({
				url : '/myweb/nicknameCheck.do', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					nickname : nickname
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					const target = document.getElementById('editSubmit');
					if (cnt == 0){ 
						if(!theForm.nickname.value){
							document.getElementById('result7').innerHTML = '<font color="red">닉네임을 입력해주세요.</font>';
							setOutline(theForm.nickname, "2px solid red");
						}else{
							document.getElementById('result7').innerHTML = '<font color="green">사용가능한 닉네입니다.</font>';
							setOutline(theForm.nickname, "2px solid green");
						}
					}else { // cnt가 0일 경우 -> 이미 존재하는 아이디
							document.getElementById('result7').innerHTML = '<font color="red">중복된 닉네임입니다.</font>';
							setOutline(theForm.nickname, "2px solid red");
							theForm.nickname.focus();
					} 
					
				},
		});
}
function setOutline(objFormElement, color) {
	if (objFormElement.style)
		objFormElement.style.outline = color;
}
$("#passwordCheck").keyup(function() {
	var theForm = document.edit;
	var password = theForm.password.value;
	const target = document.getElementById("editSubmit");
	var repassword = theForm.repassword.value;
	if (repassword == password) {
		setOutline(theForm.repassword,"2px solid green");
		document.getElementById('result').innerHTML = '<font color="green">비밀번호가 일치합니다.</font>';
	} else if (!theForm.repassword.value|| repassword != password) {
		setOutline(theForm.repassword,"2px solid red");
		document.getElementById('result').innerHTML = '<font color="red">비밀번호가 일치하지 않습니다.</font>';
		theForm.repassword.focus();
	}
});
var theForm = document.edit;
function setOutline(objFormElement, color) {
	if (objFormElement.style)
		objFormElement.style.outline = color;
}
	$("#editSubmit").click(function() {
		if (!theForm.nickname.value) {
			setOutline(theForm.nickname, "2px solid red");
			theForm.nickname.placeholder = '닉네임을 입력해주세요';
			theForm.nickname.focus();
			return;
		} else {
			setOutline(theForm.nickname, "1px solid black");
		}
		if (!theForm.password.value) {
			setOutline(theForm.password, "2px solid red");
			theForm.password.placeholder = '비밀번호를 입력해주세요';
			theForm.password.focus();
			return;
		} else {
			setOutline(theForm.password, "1px solid black");
		}
		if (!theForm.repassword.value) {
			setOutline(theForm.repassword, "2px solid red");
			theForm.repassword.placeholder = '비밀번호를 입력해주세요';
			theForm.repassword.focus();
			return;
		} else {
			setOutline(theForm.repassword, "1px solid black");
		}
		theForm.submit();
	});
</script>
</body>
</html>