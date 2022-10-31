<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="login/js/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>emailVerify</title>
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
<script type="text/javascript"
	src="/myweb/login/login&register/js/login.js"></script>
<link rel="stylesheet" type="text/css"
	href="/myweb/login/login&register/styles.css">
</head>
<script>
function reload(){
	location.reload();
}
function login(){
	location.href="/myweb/loginForm.do";
}
</script>
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
					<div class="input-group form-group">
						<span>입력하신 이메일로 인증메일을 보냈습니다.<br> 이메일 인증을 먼저 해주세요.</span>
					</div>
					<button onclick="reload()">다시 보내기</button>
					<button onclick="login()">로그인창으로 돌아가기</button>
			</div>
		</div>
	</div>
</body>
</html>