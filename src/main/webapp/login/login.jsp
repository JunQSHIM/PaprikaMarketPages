<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li> -->
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
//앱키 바꿔줘야함
Kakao.init('8890a67c089173194979845f9389950d'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
function setOutline(objFormElement, color) {
	  if (objFormElement.style)
	       objFormElement.style.outline = color;
}
//아이디 비밀번호
$(document).ready(function(){
	var theForm = document.login;
	$("#loginButton").click(function(){
		if(!theForm.id.value){
			setOutline(theForm.id, "2px solid red");
			theForm.id.placeholder = '아이디를 입력해주세요';
	        theForm.id.focus();
	        return;
		}
	
	   if(!theForm.password.value){
		   setOutline(theForm.password, "2px solid red");
		   theForm.password.placeholder = '비밀번호를 입력해주세요';
		   theForm.password.focus();
		   if(theForm.id.value!=""){
			   setOutline(theForm.id,"1px solid black");
			   
		   }
		   return;
	   }
	   theForm.submit();
	});
});
</script>
	<title>login</title>
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<div align="center" style="margin-top:150px;">
<a  href="main.jsp">
	<img src="images/pklogo.png">
</a></div>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
			<div align="center">
				<h3 align="center">로그인</h3>
			</div>
			<div class="card-body">
				<form action="main.jsp" name="login">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="아이디" name="id">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" placeholder="비밀번호" name="password" id="password">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">ID 기억하기
					</div>
					<div class="form-group">
						<input type="button" id="loginButton" value="로그인" class="btn float-right login_btn" >
					</div>
					<br><br>
					<div class="button-login" align="center">
							<a id="kakao-login-btn"> 
							<img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
								width="83%" height="50px" onclick="kakaoLogin();" />
							</a>
						</div>
				</form>
			</div>
			<div class="card-footer">
					<div class="btn float-left register_btn">
						<a href="register.jsp">회원가입</a>
					</div>
					<div class="btn float-right register_btn">
					<a href="#">비밀번호 찾기</a>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
</body>
</html>