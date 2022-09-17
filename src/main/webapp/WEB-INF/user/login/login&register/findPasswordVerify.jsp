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
					<h3 align="center">가입하신 이메일로 임시비밀번호를 발송했습니다.</h3>
					<h4 align="center">임시비밀번호로 로그인 후 마이페이지에서 비밀번호를 변경해주세요!!</h4>
				</div>
				<button onclick="main()">메인페이지로 이동</button>
			</div>
		</div>
<script>
function main(){
	location.href = "main.do";
}

</script>
</body>
</html>