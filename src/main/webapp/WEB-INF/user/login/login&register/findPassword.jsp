<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<title>findPassword</title>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="/myweb/login/login&register/styles.css">
<script type="text/javascript" src="/myweb/login/login&register/js/findPassword.js"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
</head>
<body>
	<div align="center" style="margin-top: 40px;">
		<a href="main.do"> <img
			src="/myweb/login/images/dklogo.png" width="26%">
		</a>
	</div>
	
		<div>
			<div class="card" style="width:400px;">
				<div class="card-header">
					<h3 align="center">비밀번호 찾기</h3>
				</div>
				<form action="findPassword.do" method="post" name="findPassword">
				<div class="card-body">
	    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="text" name="id" id="id" placeholder="아이디" style="width: 250px;" oninput="checkId()">
					<br>
					<div id="idCk"></div>
					<input type="text" name="email" id="email" placeholder="이메일" style="width:250px;" oninput="checkEmail()">
					<br>
					<div id="emCk"></div>
					<br>
					<button id="find" onclick="check()">확인</button>
					<br><br>
					<div id=result></div>
				</div>
				</form>
			</div>
		</div>
<script>
function setOutline(objFormElement, color) {
	if (objFormElement.style)
		objFormElement.style.outline = color;
}
function checkId() {
	var theForm = document.findPassword;
	var id = theForm.id.value.trim(); //id값이 "id"인 입력란의 값을 저장
	$.ajax({
				url : '/myweb/idCheck.do', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					id : id
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					const target = document.getElementById('find');
					if (cnt == 1) { //cnt가 1이면 없는 아이디 
						setOutline(theForm.id, "2px solid red");
						document.getElementById("idCk").innerHTML = "등록되지 않은 아이디 입니다.";
						target.disabled = true;
					} else { // cnt가 0일 경우 -> 이미 존재하는 아이디 -> 이메일 확인으로 전달 
						setOutline(theForm.id, "2px solid green");
						document.getElementById("idCk").innerHTML = "";
						theForm.id.focus();
						target.disabled = false;
					}
				},
			});
}
function checkEmail() {
	var theForm = document.findPassword;
	var id = theForm.id.value.trim(); //id값이 "id"인 입력란의 값을 저장
	var email = theForm.email.value.trim();
	$.ajax({
				url : '/myweb/idEmailCheck.do', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					id : id,
					email : email
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					const target = document.getElementById('find');
					if (cnt == 1) { //cnt가 1이면 없는 아이디 
						setOutline(theForm.email, "2px solid green");
						document.getElementById("emCk").innerHTML = "";
						target.disabled = false;
					} else { // cnt가 0일 경우 -> 이미 존재하는 아이디 -> 이메일 확인으로 전달 
						setOutline(theForm.email, "2px solid red");
						document.getElementById("emCk").innerHTML = "이메일을 다시 입력해주십시오.";
						theForm.email.focus();
						target.disabled = true;
					}
				},
			});
}
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
</script>
</body>
</html>