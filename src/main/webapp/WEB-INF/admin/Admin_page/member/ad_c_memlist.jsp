<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/fontawesome-free/css/all.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="/myweb/Admin_page/dist/css/adminlte.min.css">
</head>
<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					
					<div class="col-sm-6">
						
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
								<h3 class="card-title">회원 목록</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>유저번호</th>
											<th>아이디</th>
											<th>이름</th>
											<th>닉네임</th>
											<th>생년월일</th>
											<th>이메일</th>
											<th>전화번호</th>
											<th>지역</th>
											<th>신고받은횟수</th>
											<th>회원가입경로</th>
											<th>수신동의</th>
											<th>차단관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${list }">
											<tr>
												<td>${user.user_seq }</td>
												<td>${user.id }</td>
												<td>${user.name }</td>
												<td>${user.nickname }</td>
												<td><fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/></td>
												<td>${user.email }</td>
												<td>${user.phone }</td>
												<td>
													<c:choose>
														<c:when test="${empty user.location1 }">
															동네인증이 필요한 회원입니다.
														</c:when>
														<c:otherwise>
															${user.location1 } / ${user.location2 }
														</c:otherwise>
													</c:choose>
												</td>
												<td>${user.rep_no }</td>
												<td>
													<c:choose>
														<c:when test="${user.join_type eq 0}">
															일반회원가입
														</c:when>
														<c:otherwise>
															SNS회원가입
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${user.msg_agree eq 0}">
															O
														</c:when>
														<c:otherwise>
															X
														</c:otherwise>
													</c:choose>
												</td>
												<td>
												<c:if test="${user.rep_no < 5 }">
													<button class="block">차단하기</button>
												</c:if>
												<c:if test="${user.rep_no ge 5 }">
													<button class="unblock">차단풀기</button>
												</c:if>
												</td>
											</tr>
										</c:forEach>

									</tbody>

								</table>
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
	<!-- ./wrapper -->
	<script src="/myweb/Admin_page/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="/myweb/Admin_page/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script
		src="/myweb/Admin_page/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="/myweb/Admin_page/plugins/jszip/jszip.min.js"></script>
	<script src="/myweb/Admin_page/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="/myweb/Admin_page/plugins/pdfmake/vfs_fonts.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/myweb/Admin_page/dist/js/adminlte.min.js"></script>

	<!-- Page specific script -->
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
	
		$(".block").click(function(){ 
			//현재 row의 정보 가져오기 
			var thisRow = $(this).closest('tr');
			//주소 input 값 가져오기
			var user_seq = thisRow.find('td:eq(0)').text();
			var id = thisRow.find('td:eq(1)').text();
			var email = thisRow.find('td:eq(5)').text();
			
			$.ajax({ // ajax 기본형태
				url : "/myweb/block.mdo",
				type : "post",
				data : {
					"user_seq" : user_seq,
					"id" : id,
					"email" : email
				}, //위와동일
				success : function(data){ // status, xhr 생략가능 
					alert("차단했습니다.")
					location.reload();
				},
				error : function() { // (파라미터 생략가능)
					alert("error");
				}
			});	

		});

		$(".unblock").click(function(){ 
			//현재 row의 정보 가져오기 
			var thisRow = $(this).closest('tr');
			//주소 input 값 가져오기
			var user_seq = thisRow.find('td:eq(0)').text();
			var id = thisRow.find('td:eq(1)').text();
			var email = thisRow.find('td:eq(5)').text();
			
			$.ajax({ // ajax 기본형태
				url : "/myweb/unblock.mdo",
				type : "post",
				data : {
					"user_seq" : user_seq,
					"id" : id,
					"email" : email
				}, //위와동일
				success : function(data){ // status, xhr 생략가능 
					alert("해제했습니다.")
					location.reload();
				},
				error : function() { // (파라미터 생략가능)
					alert("error");
				}
			});	

		});
	</script>
</body>
</html>
