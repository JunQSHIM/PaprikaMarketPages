<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
<link rel="stylesheet" href="qna_list.css" type="text/css">
<link rel="stylesheet" href="/myweb/Admin_page/admin_list/agreement.css" type="text/css">
<script>
	function defaults(){
		location.href="admin_list.mdo?agreement_seq=2"
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
							<form action="edit_agreement.mdo?agreement_seq=1" method="post">
							<div class="card-header">
								<div style="float: right;">
									<button type="submit">수정</button>
									<button type="button" onclick="defaults()">기본 값 불러오기</button>
								</div>
							</div>
							<div class="card-body">
								<h4 align="left">회원가입 약관 동의</h4>
									<div id="register_agreement">
										<c:if test="${newest.register_agreement ne null }">
											<textarea name="register_agreement" id="register_agreement">${newest.register_agreement }</textarea>
										</c:if>
										<c:if test="${newest.register_agreement eq null }">
											<textarea name="register_agreement" id="register_agreement" >회원가입 약관 등록이 필요합니다!</textarea>
										</c:if>
										</div>
										<h4 align="left">개인정보 수집 동의</h4>
										<div id="pInfo_agreement">
										<c:if test="${newest.p_agreement ne null }">
											<textarea name="p_agreement" id="pInfo_agreement" >${newest.p_agreement }</textarea>
										</c:if>
										<c:if test="${newest.p_agreement eq null }">
											<textarea name="p_agreement" id="pInfo_agreement">개인정보 수집 약관 등록이 필요합니다!</textarea>
										</c:if>
									</div>
							</div>
							</form>
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
