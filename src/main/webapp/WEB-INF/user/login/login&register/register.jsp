<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<title>register</title>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="/myweb/login/login&register/styles.css">
<script type="text/javascript" src="/myweb/login/login&register/js/register.js"></script>
</head>
<body>
	<div align="center" style="margin-top: 40px;">
		<a href="main.do"> <img src="/myweb/login/images/dklogo.png" width="26%">
		</a>
	</div>
	
		<div>
			<div class="card">
				<div class="card-header">
					<h3 align="center">회 원 가 입</h3>
				</div>
				<div class="card-body">
					<form action="insertProc.do" name="register" id="register">
	    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="input-group form-group">
							<input type="text" name="id" placeholder="아이디"
								style="width: 400px;" oninput="checkId()">
							<div id="result3"></div>
						</div>
						<div class="input-group form-group">
							<input type="text" name="name" placeholder="이름"
								style="width: 400px;">
						</div>
						<div class="input-group form-group">
							<input type="password" name="password" placeholder="비밀번호"
								style="width: 400px;">
						</div>
						<div class="input-group form-group">
							<input type="password" name="repassword" placeholder="비밀번호확인"
								style="width: 400px;" id="passwordCheck">
							<div id="result"></div>
						</div>
						<div class="input-group form-group">
							<input type="text" name="nickname" placeholder="닉네임"
								style="width: 400px;" oninput="checkNickname()">
							<div id="result7"></div>
						</div>
						<div class="input-group form-group">
							<input type="text" name="email" placeholder="이메일"
								style="width: 400px;" id="emailCheck" oninput="checkEmail()">
							<div id="result4"></div>
							<div id="result6"></div>
						</div>
						<div class="input-group form-group">
							<input type="date" name="birth" style="width: 400px;">
							<div id="result9"></div>
						</div>
						<div class="input-group form-group">
							<input type="text" name="phone" placeholder="전화번호를 -없이 입력해주세요."
								style="width: 400px;" id="phoneCheck" oninput="checkPhone()">
							<div id="result5"></div><br>
							<div id="result8"></div>
						</div>
						<section id="fregister_private">
							<fieldset class="fregister_agree2 checks2">
								<input type="checkbox" name="msg_agree" value="1" id="msg_agree" checked>
								<label for="msg_agree">SMS 수신 동의<span>(선택)</span></label>
							</fieldset>
						</section>
						<input type="hidden" name="profile_image" value="/myweb/login/images/profile.png">
						<div class="form-group">
							<input type="button" id="rBtn" value="회원가입"
								class="btn float-left login_btn"> <input type="reset"
								onClick="formReset()" value="취소"
								class="btn float-right login_btn">
						</div>
					</form>
				</div>
			</div>
		</div>
	
</body>
</html>