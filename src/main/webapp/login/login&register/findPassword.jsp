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
<title>register</title>
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
			<div class="card" style="width:600px;">
				<div class="card-header">
					<h3 align="center">비밀번호 찾기</h3>
				</div>
				<div class="card-body">
					<input type="text" name="id" id="id" placeholder="아이디" style="width: 500px;">
					<button onclick="check()">확인</button>
					
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
							const target = document
									.getElementById('check_btn');
							if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 없는 아이디 
								document.getElementById('result').innerHTML = '<font color="red">입력하신 아이디를 찾을수 없습니다.</font>';
							} else { // cnt가 1일 경우 -> 존재하는 아이디
								document.getElementById('result').innerHTML = `
									<div class="input-group form-group">
										<div>전화번호 : <input type="text"><button onc="send()">인증번호 전송</button></div>
										<div id="check_user">
											<input type="text" ><button>인증번호 확인</button>
										</div>
									</div>
								</form>
								<div class="form-group">
									<input type="button" id="findButton" value="찾기"
										class="btn float-left login_btn"> <input type="reset"
										onClick="formReset()" value="취소"
										class="btn float-right login_btn">
								</div>
								`;
							}
						},
					});
		}
		
		function send(){
				console.log("1");
				document.myForm.action="/sendSms.do";
				document.myForm.method="post";
				document.myForm.submit();
				}

		</script>
</body>
</html>