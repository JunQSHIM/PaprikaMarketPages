<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<%
	request.setCharacterEncoding("UTF-8");
	session.setAttribute("register_agreement", request.getParameter("register_agreement"));
	session.setAttribute("pInfo_agreement",request.getParameter("pInfo_agreement"));
%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
<link rel="stylesheet" type="text/css" href="admins.css">
<link rel="stylesheet" href="qna_list.css" type="text/css">
<link rel="stylesheet" href="agreement.css" type="text/css">
<script>
function update(){
	 window.location.href ='edit_agreement.mdo';
}

</script>
</head>
<body>
<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>약관동의</h1>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<div style="float: right;">
									<button onclick="update()">수정</button>
								</div>
							</div>
							<div class="card-body">
								<h4 align="left">회원가입 약관 동의</h4>
								<div id="register_agreement">
								<c:if test="${newest.register_agreement ne null }">
									<textarea id="register_agreement" readonly>${newest.register_agreement }</textarea>
								</c:if>
								<c:if test=${newest.register_agreement eq null }">
									<textarea id="register_agreement" readonly>회원가입 약관 등록이 필요합니다!</textarea>
								</c:if>
								</div>
								<h4 align="left">개인정보 수집 동의</h4>
								<div id="pInfo_agreement">
								<c:if test="${newest.pInfo_agreement ne null }">
									<textarea id="pInfo_agreement" readonly>${newest.pInfo_agreement }</textarea>
								</c:if>
								<c:if test=${newest.pInfo_agreement eq null }">
									<textarea id="register_agreement" readonly>개인정보 수집 약관 등록이 필요합니다!</textarea>
								</c:if>
								</div>
							</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col -->
	</div>
	<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
	</section>
		<!-- /.content -->
	</div>
</body>
</html>	
