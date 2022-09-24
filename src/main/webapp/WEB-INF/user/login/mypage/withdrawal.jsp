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
						<input type="radio" id="service" name="withdrawal_content" value="1"><label for="service">서비스불만족</label>
						<input type="radio" id="unused" name="withdrawal_content" value="2"><label for="unused" >장기미사용</label>
						<input type="radio" id="platform"name="withdrawal_content" value="3"><label for="platform">타 플랫폼 이용</label>
						<input type="radio" id="private" name="withdrawal_content" value="4"><label for="private">개인정보노출우려</label>
						<input type="radio" id="prod"name="withdrawal_content" value="5"><label for="prod">상품의 다양성 부족</label>
						<input type="radio" id="etc" name="withdrawal_content" value="6"><label for="etc">기타</label>
					</div>
				</div>
			</div>
		
			<div class="form-group has-feedback">
				<button class="btn login_btn" type="submit" id="submit" onclick="Arr()">회원탈퇴</button>
				<button class="btn login_btn" type="button">취소</button>
			</div>
			
			
		</form>
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
// 탈퇴사유 라디오버튼 자바스크립트
	function Arr() {   
		var radioArr = [];     // 배열 초기화   
		var withdrawal_content;
		$("input[name='withdrawal_content']:checked").each(function(i){     
			var chk = confirm("탈퇴하시겠습니까?")
			if(!chk){
				alert('취소하였습니다.')
				return false;
			}
			radioArr.push($(this).val());  
			
			console.log(radioArr);
			// 체크된 것만 값을 뽑아서 배열에 push   
			
			withdrawal_content = radioArr;
			 $.ajax({    
				url: '/myweb/reason.do',
				type: 'post',
				data: {
					withdrawal_content : withdrawal_content
					},
				success : function(data) {
					console.log('dd');
					if(data == 1){
						alert("이용해주셔서 감사합니다.");
					}
				}
			})
			});
			}
	</script>
</body>

</html>