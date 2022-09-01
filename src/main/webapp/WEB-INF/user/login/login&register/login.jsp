<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="login/js/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	function setOutline(objFormElement, color) {
		if (objFormElement.style)
			objFormElement.style.outline = color;
	}
	//아이디 비밀번호
	$(document).ready(function() {
		var theForm = document.login;
		$("#loginButton").click(function() {
			if (!theForm.id.value) {
				setOutline(theForm.id, "2px solid red");
				theForm.id.placeholder = '아이디를 입력해주세요';
				theForm.id.focus();
				return;
			}

			if (!theForm.password.value) {
				setOutline(theForm.password, "2px solid red");
				theForm.password.placeholder = '비밀번호를 입력해주세요';
				theForm.password.focus();
				if (theForm.id.value != "") {
					setOutline(theForm.id, "1px solid black");
				}
				return;
			}
			theForm.submit();
		});
	});
</script>
<title>login</title>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!--Custom styles-->
<link rel="stylesheet" type="text/css"
	href="/myweb/login/login&register/styles.css">
</head>
<body>
	<div align="center" style="margin-top: 70px; margin-bottom: 20px;">
		<a href="/myweb/login/main/mother.jsp"> <img
			src="/myweb/login/images/dklogo.png" width="26%">
		</a>
	</div>
	<div>
		<div class="card">
			<div class="card-header">
				<h3 align="center">로그인</h3>
			</div>
			<div class="card-body">
				<form action="loginProc.do" name="login">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="아이디" value="${cookie.id.value}"
							name="id">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" placeholder="비밀번호"
							name="password" id="password">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox" ${empty cookie.id.value ? "":"checked" } name="rememberId">ID 기억하기
					</div>
					<div class="form-group">
						<input type="button" id="loginButton" value="로그인"
							class="btn login_btn">
					</div>
					<div class="btn register_btn">
						<a href="/myweb/login/login&register/registerAgree.jsp">회원가입</a>
					</div>
					<div class="btn register_btn">
						<a href="#">비밀번호 찾기</a>
					</div>

					<br> <br>
					<div class="button-login" align="center">
						<a id="kakao-login-btn"	class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=808d349080855e826b4c4cb8c77a836d&redirect_uri=http://localhost:8080/myweb/kakaoLogin.do&response_type=code">
						<img
							src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
							width="83%" height="50px" />
						</a>
					</div>
				</form>
			</div>

		</div>
	</div>


</body>
</html>