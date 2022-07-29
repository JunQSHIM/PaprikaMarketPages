<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<title>register</title>
<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
<script>
function setOutline(objFormElement, color) {
	  if (objFormElement.style)
	       objFormElement.style.outline = color;
}
function formReset(){
	

	var theForm = document.register;
		document.getElementById('result').innerHTML = '';
		document.getElementById('result2').innerHTML = '';
		document.getElementById('result3').innerHTML = '';
		document.getElementById('result4').innerHTML = '';
		setOutline(theForm.id, "1px solid black");
		setOutline(theForm.password, "1px solid black");
		setOutline(theForm.repassword, "1px solid black");
		setOutline(theForm.year, "1px solid black");
		setOutline(theForm.month, "1px solid black");
		setOutline(theForm.day, "1px solid black");
		setOutline(theForm.nickname, "1px solid black");
		setOutline(theForm.phone, "1px solid black");
		setOutline(theForm.email, "1px solid black");
		setOutline(theForm.phone, "1px solid black");
		document.getElementById('result5').innerHTML = '';

	}

	function checkId() {
		var theForm = document.register;
		var id = theForm.id.value; //id값이 "id"인 입력란의 값을 저장
		$
				.ajax({
					url : 'idCheck.jsp', //Controller에서 요청 받을 주소
					type : 'post', //POST 방식으로 전달
					data : {
						id : id
					},
					success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
						const target = document
								.getElementById('registerButton');
						if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
							document.getElementById('result3').innerHTML = '<font color="green">사용가능한 아이디 입니다.</font>';
							setOutline(theForm.id, "2px solid green");
							target.disabled = false;
						} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
							document.getElementById('result3').innerHTML = '<font color="red">중복된 아이디 입니다.</font>';
							setOutline(theForm.id, "2px solid red");
							theForm.id.focus();
							target.disabled = true;
						}
					},
				});
	}
	$(document)
			.ready(
					function() {
						var theForm = document.register;
						const target = document
								.getElementById('registerButton');

						$("#passwordCheck")
								.keyup(
										function() {
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

						//이메일 유효성 검사
						$("#emailCheck")
								.keyup(
										function() {
											var email = theForm.email.value;
											var pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
											if (pattern.test(email) == false) {
												document
														.getElementById('result4').innerHTML = '<font color="red">올바른 이메일 형식이 아닙니다.</font>';
												theForm.email.focus();
												target.disabled = true;
											} else {
												document
														.getElementById('result4').innerHTML = '<font color="green">사용가능한 이메일입니다.</font>';
												target.disabled = false;
											}
										});
						$("#phoneCheck")
								.keyup(
										function() {
											var phone = theForm.phone.value;
											var pattern = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
											if (pattern.test(phone) == false) {
												document
														.getElementById('result5').innerHTML = '<font color="red">올바른 전화번호 형식이 아닙니다.</font>';
												theForm.phone.focus();
												target.disabled = true;
											} else {
												setOutline(theForm.phone,
														"1px solid black");
												document
														.getElementById('result5').innerHTML = '';
												target.disabled = false;
											}
										});
						$("#registerButton")
								.click(
										function() {
											if (!theForm.id.value) {
												setOutline(theForm.id,
														"2px solid red");
												theForm.id.placeholder = '아이디를 입력해주세요';
												theForm.id.focus();
												return;
											} else {
												setOutline(theForm.id,
														"1px solid black");
											}
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
											if (!theForm.nickname.value) {
												setOutline(theForm.nickname,
														"2px solid red");
												theForm.nickname.placeholder = '닉네임을 입력해주세요';
												theForm.nickname.focus();
												return;
											} else {
												setOutline(theForm.nickname,
														"1px solid black");
											}
											if (!theForm.year.value) {
												setOutline(theForm.year,
														"2px solid red");
												document
														.getElementById('result2').innerHTML = '<font color="red">연도를 선택해주세요.</font>';
												theForm.year.focus();
												return;
											} else {
												setOutline(theForm.year,
														"1px solid black");
												document
														.getElementById('result2').innerHTML = '';
											}

											if (!theForm.month.value) {
												setOutline(theForm.month,
														"2px solid red");
												document
														.getElementById('result2').innerHTML = '<font color="red">월을 선택해주세요.</font>';
												theForm.month.focus();
												return;
											} else {
												setOutline(theForm.month,
														"1px solid black");
												document
														.getElementById('result2').innerHTML = '';
											}

											if (!theForm.day.value) {
												setOutline(theForm.day,
														"2px solid red");
												document
														.getElementById('result2').innerHTML = '<font color="red">일을 선택해주세요.</font>';
												theForm.day.focus();
												return;
											} else {
												setOutline(theForm.day,
														"1px solid black");
												document
														.getElementById('result2').innerHTML = '';
											}

											if (!theForm.email.value) {
												setOutline(theForm.email,
														"2px solid red");
												theForm.email.placeholder = '이메일을 입력해주세요';
												theForm.email.focus();
												return;
											} else {
												setOutline(theForm.email,
														"1px solid black");
											}
											if (!theForm.phone.value) {
												setOutline(theForm.phone,
														"2px solid red");
												theForm.phone.placeholder = '전화번호를 입력해주세요';
												theForm.phone.focus();
												return;
											} else {
												setOutline(theForm.phone,
														"1px solid black");
											}
											theForm.submit();
										});

						$(document).ready(function() {
							setDateBox();
						});

						// select box 연도 , 월 표시
						function setDateBox() {
							var dt = new Date();
							var year = "";
							var com_year = dt.getFullYear();

							// 발행 뿌려주기
							$("#year").append("<option value=''>년도</option>");

							// 올해 기준으로 -50년부터 +1년을 보여준다.
							for (var y = (com_year - 50); y <= (com_year + 1); y++) {
								$("#year").append(
										"<option value='" + y + "'>" + y
												+ "</option>");
							}

							// 월 
							var month;
							$("#month").append("<option value=''>월</option>");

							for (var i = 1; i <= 12; i++) {
								$("#month").append(
										"<option value='" + i + "'>" + i
												+ "</option>");
							}
							// 일 
							var day;
							$("#day").append("<option value=''>일</option>");
							for (var i = 1; i <= 31; i++) {
								$("#day").append(
										"<option value='" + i + "'>" + i
												+ "</option>");
							}
						}

						//날짜

						//계좌입력

					});
</script>
</head>
<body>
<div align="center" style="margin-top:150px;">
<a  href="main.jsp">
	<img src="images/pklogo.png">
</a>
</div>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3 align="center">회원가입</h3>
				</div>
			<div class="card-body">
			<form action="main.jsp" name="register" id="register">
					<div class="input-group form-group">
					<input type="text" name="id" placeholder="아이디" style="width:400px;" oninput = "checkId()">
					<div id="result3"></div>
					</div>
					<div class="input-group form-group">
					<input type="password" name="password" placeholder="비밀번호" style="width:400px;">
					</div>
					<div class="input-group form-group" >
					<input type="password" name="repassword" placeholder="비밀번호확인" style="width:400px;" id="passwordCheck" >
					<div id="result"></div>
					</div>
					<div class="input-group form-group">
					<input type="text" name="nickname" placeholder="닉네임" style="width:400px;">
					</div>
					<font size="2">생년월일</font>
					<div class="input-group form-group">
					<select name="yy" id="year" style="width:120px;" name="year">
					</select>-
					<select name="mm" id="month" name="month"></select> -
					<select name="dd" id="day" name="day"></select>
					<div id="result2"></div>
					</div>
					<div class="input-group form-group">
					<input type="text" name="email" placeholder="이메일" style="width:400px;" id="emailCheck" >
					<div id="result4"></div>
					</div>
					<div class="input-group form-group">
					<input type="text" name="phone" placeholder="전화번호를 -없이 입력해주세요." style="width:400px;" id="phoneCheck">
					<div id="result5"></div>
					</div>
					<div class="form-group">
						<input type="button" id="registerButton" value="회원가입" class="btn float-left login_btn" >
						<input type="reset" onClick="formReset()" value="취소" class="btn float-right login_btn">						
					</div>
			</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>