<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("UTF-8");
%>
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
<link rel="stylesheet" type="text/css" href="/myweb/login/login&register/css/registerAgree.css">
<script type="text/javascript" src="/myweb/login/login&register/js/registerAgree.js"></script>

</head>
<body>
	<div align="center" style="margin-top: 40px;">
		<a href="/myweb/main.do"> <img
			src="/myweb/login/images/dklogo.png" width="26%">
		</a>
	</div>
	<div>
		<div>
			<div class="card">
				<div class="card-header">
					<h3 align="center">회원가입 약관 동의</h3>
				</div>
				<div id="register_agree">
					<form name="fregister" id="fregister" action="registerAgree.do"
						onsubmit="return fregister_submit(this);" method="POST"
						autocomplete="off">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div id="fregister_chkall" class="checks2">
							<input type="checkbox" name="chk_all" value="1"
								class="agreeBtnAll" id="chk_all"> <label for="chk_all">회원가입
								약관에 모두 동의합니다</label>
						</div>
						<section id="fregister_term">
							<div class="fregister_agree2 checks2">
								<input type="checkbox" name="agree" value="1" class="agreeBtn"
									id="agree11"> <label for="agree11">이용약관 동의<span>(필수)</span></label>
							</div>
							<textarea readonly>${newest.register_agreement }</textarea>

						</section>

						<section id="fregister_private">
							<fieldset class="fregister_agree2 checks2">
								<input type="checkbox" name="agree2" value="1" class="agreeBtn"
									id="agree21"> <label for="agree21">개인정보 수집 및 이용
									동의<span>(필수)</span>
								</label>
							</fieldset>
							<textarea readonly>${newest.p_agreement }</textarea>
						</section>
						<div class="btn_confirm">
							<input type="reset" value="취소"> <input type="submit"
								class="btn_submit" value="회원가입" id="btn_submit">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>