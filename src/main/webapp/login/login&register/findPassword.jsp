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
	<div align="center" style="margin-top: 40px;">
		<a href="/myweb/login/main/mother.jsp"> <img
			src="/myweb/login/images/dklogo.png" width="26%">
		</a>
	</div>
	
		<div>
			<div class="card" style="width:400px;">
				<div class="card-header">
					<h3 align="center">비밀번호 찾기</h3>
				</div>
				<div class="card-body">
					<input type="text" name="id" id="id" placeholder="아이디" style="width: 250px;">
					<button onclick="check()">확인</button>
					<br><br>
					<div id=result></div>
				</div>
			</div>
		</div>
		<script>
		
		function check() {
			
			var id = document.getElementById('id').value; //id값이 "id"인 입력란의 값을 저장
			console.log(id);
			$
					.ajax({
						url : 'idCheck.jsp', //Controller에서 요청 받을 주소
						type : 'post', //POST 방식으로 전달
						data : {
							id : id
						},
						success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
							if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 없는 아이디 
								document.getElementById('result').innerHTML = '<font color="red">입력하신 아이디를 찾을수 없습니다.</font>';
							} else { // cnt가 1일 경우 -> 존재하는 아이디
								document.getElementById('result').innerHTML = `
									<div>
										<div class="ch"><input type="text" placeholder="전화번호"><button id="send" style="width:105px;">인증번호 전송</button></div>
										<br>
										<div class="ch">
											<input type="text" id="sms" placeholder="인증번호"><button onclick="check_sms()" style="width:105px;">인증번호 확인</button>
										</div>
										<div id="timer"></div><div id="result1"></div>
									</div>
								</form>
								<div id="result2"></div>
								<input type="reset" onClick="" value="취소" class="btn float-right login_btn">
								`;
								
								
							}
						},
					});
		}
		var flag = false;
		$(document).on("click", "#send", function() {
				console.log("1");
				location.href="sendSms.do";
				var time = 180;
				var min = "";
				var sec = "";
				
				var x = setInterval(function(){
					min = parseInt(time/60);
					sec = time%60;
					
					document.getElementById("timer").innerHTML = min + "분" + sec + "초";
					time--;
					
					if(time<0){
						clearInterval(x);
						document.getElementById("timer").innerHTML = "시간초과";
					}
					if(flag){
						clearInterval(x);						
					}
				}, 1000);
		});
		$(document).on("click", "#check_btn", function() {
			console.log("2");
			location.href="check_random.do";
		});
		
		function check_sms() {
			
			var sms = document.getElementById('sms').value; //sms값이 "sms"인 입력란의 값을 저장
			$
					.ajax({
						url : 'smsCheck.jsp', //Controller에서 요청 받을 주소
						type : 'post', //POST 방식으로 전달
						data : {
							sms : sms
						},
						success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
							if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 인증번호 틀림 
								document.getElementById('result1').innerHTML = '<font color="red">인증번호가 틀렸습니다.</font>';
							} else { // cnt가 1일 경우 -> 인증번호 맞음
								
								document.getElementById('result1').innerHTML = '<font color="green">인증성공.</font>';
								document.getElementById('result2').innerHTML = '<input type="button" id="change_btn" value="변경" class="btn float-left login_btn">';
								document.getElementById('timer').remove();
								flag = true;
							}
						},
					});
		}
		
		$(document).on("click", "#change_btn", function() {
			console.log("1");
			location.href="changePassword.jsp";
		});
		
		
		
		
		
		</script>
</body>
</html>