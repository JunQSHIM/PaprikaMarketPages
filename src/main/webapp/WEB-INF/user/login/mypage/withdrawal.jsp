<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>



<title>회원탈퇴</title>
</head>


<body>
	<section id="container">
		<form action="withdrawal.do" method="post">
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
		
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
		<div>
			<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
		</div>
	</section>

	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/myweb/mypage.do";
			})
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userPass2").val()==""){
					alert("비밀번호 확인을 입력해주세요.");
					$("#userPass2").focus();
					return false;
				}
				if ($("#userPass").val() != $("#userPass2").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPass").focus();
					 
					return false;
					}
				
			});
			
		})
	</script>
</body>

</html>