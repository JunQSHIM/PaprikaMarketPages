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
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<title>비밀번호 변경</title>
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
<script>
	function setOutline(objFormElement, color) {
		if (objFormElement.style)
			objFormElement.style.outline = color;
	}
	function formReset() {
		var theForm = document.change;
		document.getElementById('result').innerHTML = '';
		setOutline(theForm.password, "1px solid black");
		setOutline(theForm.repassword, "1px solid black");
	}
	$(document).ready(function() {
		var theForm = document.change;
		const target = document.getElementById('changeButton');
		$("#passwordCheck").keyup(function() {
							var password = theForm.password.value;
							
							var repassword = theForm.repassword.value;
							if (repassword == password) {
								setOutline(theForm.repassword,
										"2px solid green");
								document
										.getElementById('result').innerHTML = '<font color="green">비밀번호가 일치합니다.</font>';
								target.disabled = false;
							} else if (!theForm.repassword.value
									|| repassword != password) {
								setOutline(theForm.repassword,
										"2px solid red");
								document
										.getElementById('result').innerHTML = '<font color="red">비밀번호가 일치하지 않습니다.</font>';
								theForm.repassword.focus();
								target.disabled = true;
							}
						});

		
		$("#changeButton").click(function() {

							if (!theForm.password.value) {
								setOutline(theForm.password,
										"2px solid red");
								theForm.password.placeholder = '비밀번호를 입력해주세요';
								theForm.password.focus();
								return;
							} else {
								setOutline(theForm.password,
										"1px solid black");
							}
							if (!theForm.repassword.value) {
								setOutline(theForm.repassword,
										"2px solid red");
								theForm.repassword.placeholder = '비밀번호를 확인해주세요';
								theForm.repassword.focus();
								return;
							} else {
								setOutline(theForm.repassword,
										"1px solid black");
							}
							
							theForm.submit();
						});
	});
</script>
</head>
<body>
	<div align="center" style="margin-top: 40px;">
		<a href="/myweb/login/main/mother.jsp"> <img
			src="/myweb/login/images/dklogo.png" width="26%">
		</a>
	</div>
	
		<div>
			<div class="card">
				<div class="card-header">
					<h3 align="center">비밀번호 수정</h3>
				</div>
				<div class="card-body">
					<form action="changePass.do" name="change" id="change">

						<div class="input-group form-group">
							<input type="password" name="password" placeholder="비밀번호" style="width: 400px;">
						</div>
						<div class="input-group form-group">
							<input type="password" name="repassword" placeholder="비밀번호확인" style="width: 400px;" id="passwordCheck">
							<div id="result"></div>
						</div>
						<div class="form-group">
							<input type="button" id="changeButton" value="변경" class="btn float-left login_btn">
							<input type="reset" onClick="formReset()" value="취소" class="btn float-right login_btn">
						</div>
						
					</form>
				</div>
			</div>
		</div>

</body>
</html>