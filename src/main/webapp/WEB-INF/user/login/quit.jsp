<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="login/js/jquery-3.6.0.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<title>회원탈퇴</title>
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
	href="/myweb/login/css/quit.css">
</head>
<body>
	
	<div>
		<div class="card">
			<div class="card-header">
				<h3 align="center">회원탈퇴</h3>
			</div>
			<div class="card-body">
				<section id="container">
		<form action="withdrawal.do" method="post">
		<input type="hidden" value="${user.user_seq }">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label> <input
					class="form-control" type="text" id="userId" name="id"
					value="${user.id}" readonly="readonly" />
			</div>
				<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label> <input
					class="form-control" type="text" id="userName" name="name"
					value="${user.name}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label> <input
					class="form-control" type="password" id="userPass" name="password" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass2">패스워드 확인</label> <input
					class="form-control" type="password" id="userPass2"
					name="password2" />
			</div>
			<div>
				<div>
					<div>
					<h2>탈퇴사유</h2>
						<input type="radio" id="service" name="withdrawal_content" value="1"><label for="service">서비스불만족</label><br>
						<input type="radio" id="unused" name="withdrawal_content" value="2"><label for="unused" >장기미사용</label><br>
						<input type="radio" id="platform"name="withdrawal_content" value="3"><label for="platform">타 플랫폼 이용</label><br>
						<input type="radio" id="private" name="withdrawal_content" value="4"><label for="private">개인정보노출우려</label><br>
						<input type="radio" id="prod"name="withdrawal_content" value="5"><label for="prod">상품의 다양성 부족</label><br>
						<input type="radio" id="etc" name="withdrawal_content" value="6"><label for="etc">기타</label><br>
					</div>
				</div>
			</div>
		
			<div class="form-group has-feedback">
				<button class="btn login_btn" type="submit" id="submit" onclick="Arr()">회원탈퇴</button>
				<button id="aa" class="btn login_btn" type="button">취소</button>
			</div>
			
			
		</form>
	</section>
			</div>

		</div>
	</div>
<script type="text/javascript" src="/myweb/login/js/quit.js"></script>
</body>
</html>