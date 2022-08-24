<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
											<th>이름</th>
											<th>지역</th>
											<th>이메일</th>
											<th>전화번호</th>
											<th>생년월일</th>
											<th>닉네임</th>
											<th>신고받은횟수</th>
											<th></th>
										</tr>
									</thead>
									<tbody>

										<%
										for (int i = 0; i < 20; i++) {
										%>
										<tr> 
											<td>김유신</td>
											<td>부산</td>
											<td>usin@naver.com</td>
											<td>01012314124</td>
											<td>1998.08.15</td>
											<td>부산사람</td>
											<td>152</td>
											<td><button class="black_btn" type="button">차단</button></td>
										</tr>
										<tr>
											<td>장문기</td>
											<td>동네인증이 필요합니다.</td>
											<td>moonknight@naver.com</td>
											<td>01015325234</td>
											<td>1993.01.01</td>
											<td>부천인</td>
											<td>0</td>
											<td><button class="black_btn" type="button">차단</button></td>
										</tr>
										<tr>
											<td>박예솔</td>
											<td>서울</td>
											<td>yesol@naver.com</td>
											<td>01016438454</td>
											<td>1996.03.03</td>
											<td>서울사람</td>
											<td>1</td>
											<td><button class="black_btn" type="button">차단</button></td>
										</tr>
										<tr>
											<td>심준규</td>
											<td>인천</td>
											<td>junq@naver.com</td>
											<td>01014833424</td>
											<td>1997.03.07</td>
											<td>인천사람</td>
											<td>7</td>
											<td><button class="black_btn" type="button">차단</button></td>
										</tr>
										<tr>
											<td>임승택</td>
											<td>부천</td>
											<td>lst@naver.com</td>
											<td>01012235756</td>
											<td>1997.04.04</td>
											<td>빵맨</td>
											<td>157</td>
											<td><button class="black_btn" type="button">차단</button></td>
										</tr>
										<tr>
											<td>임홍</td>
											<td>부천</td>
											<td>leemong486@naver.com</td>
											<td>01098762341</td>
											<td>92</td>
											<td>57</td>
											<td>57</td>
											<td><button class="black_btn" type="button">차단</button></td>
										</tr>
										<%
										}
										%>

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


	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
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
	</script>
</body>
</html>
