<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
<link rel="stylesheet" type="text/css" href="admins.css">
<link rel="stylesheet" href="qna_list.css" type="text/css">
<link rel="stylesheet" href="agreement.css" type="text/css">
<script>
function updateComp(){
	document.getElementById("agreement").action = "agreement.jsp";
	document.getElementById("agreement").submit();
}

</script>
</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>약관동의</h1>
					</div>
				</div>
			</div>
		</section>
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<div style="float: right;">
									<button onclick="updateComp()">수정완료</button>
								</div>
							</div>
							<div class="card-body">
							<form id="agreement" action="#" method="post">
							<c:forEach var="agreement" items="${newest}">
							<h4 align="left">회원가입 약관 동의</h4>
								<div id="register_agreement">
									<textarea id="register_agreement" name="register_agreement">${agreement.register_agreement}</textarea>
								</div>
								<h4 align="left">개인정보 수집 동의</h4>
								<div id="pInfo_agreement">
									<textarea id="pInfo_agreement" name="pInfo_agreement">${agreement.p_agreement}</textarea>
								</div>
							</c:forEach>
							</form>
							</div>
				</div>
			</div>
	</div>
	</div>
	</section>
	</div>
</body>
</html>	
