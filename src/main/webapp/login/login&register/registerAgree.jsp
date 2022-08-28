<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
<script>
function fregister_submit(f) {
	if (!f.agree.checked) {
		alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
		f.agree.focus();
		return false;
	}

	if (!f.agree2.checked) {
		alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
		f.agree2.focus();
		return false;
	}
	return true;
}
//체크박스 선택 자바스크립트
$(document).ready(function(){
	//전체 체크 클릭 시, 나머지 체크 
	$("#chk_all").click(function(){
	var order2Chk=$("#chk_all").prop("checked");

	    if(order2Chk){
	        $(".agreeBtn").prop("checked",true);
	    }
	    else{
	        $(".agreeBtn").prop("checked",false);
	    }
	});
	// 모든 체크박스를 클릭하면 버튼 활성화시키기
	$('.agreeBtn').click(function(){
	    var tmpp = $(this).prop('checked'); 
	    
	    //자식 체크 전체 체크시, 부모 체크박스 체크 됨
	    var tt = $(".agreeBtn").length;
	    var ss = $(".agreeBtn:checked").length;
	   
	    // 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
	    if(tt == ss){
	    	$("#chk_all").css({"backgroundColor":"#ff8955","cursor":"pointer","color":"#fff"}).prop("checked",true);
	    }else{
	    	$("#chk_all").css({"backgroundColor":"white","cursor":"auto","color":"rgb(136, 136, 136)"}).prop("checked",false);
	    	
	    }
	    
		});
	}); // 체크박스 제이쿼리

</script>
</head>
<body>
<div align="center" style="margin-top:150px;">
<a  href="/myweb/login/main/mother.jsp">
	<img src="/myweb/login/images/pklogo.png">
</a>
</div>
<div class="container">
	<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3 align="center">회원가입 약관 동의</h3>
				</div>
				<div id="register_agree">
					<form name="fregister" id="fregister" action="register.jsp"
						onsubmit="return fregister_submit(this);" method="POST"
						autocomplete="off">

						<div id="fregister_chkall" class="checks2">
							<input type="checkbox" name="chk_all" value="1" id="chk_all">
							<label for="chk_all">회원가입 약관에 모두 동의합니다</label>
						</div>

						<section id="fregister_term">
							<div class="fregister_agree2 checks2">
								<input type="checkbox" name="agree" value="1" class="agreeBtn" id="agree11">
								<label for="agree11">이용약관 동의<span>(필수)</span></label>
							</div>
							<textarea readonly>${register_agreement }</textarea>

						</section>

						<section id="fregister_private">
							<fieldset class="fregister_agree2 checks2">
								<input type="checkbox" name="agree2" value="1" class="agreeBtn" id="agree21">
								<label for="agree21">개인정보 수집 및 이용 동의<span>(필수)</span></label>
							</fieldset>
							<textarea readonly>${pInfo_agreement }</textarea>
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