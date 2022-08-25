<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>

<link rel="stylesheet" href="ad_prods.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

</head>
<body>


	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">

				<div class="col-sm-6"></div>
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
							<h3 class="card-title">상품 목록</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>사진</th>
										<th>상품명</th>
										<th>판매자</th>
										<th>업로드시간</th>
										<th>닉네임</th>
										<th>신고받은횟수</th>
										<th></th>
									</tr>
								</thead>
								<tbody>


									<tr>
										<td><div class="pic">
												<img src="anya.jpg" width="80px">
											</div></td>
										<td>아냐</td>
										<td><a href="ad_memde.jsp">장문기</a></td>
										<td>2022.9.30</td>
										<td>아냐남친</td>
										<td>152</td>
										<td><a href="ad_prod_de.jsp">상세</a></td>
									</tr>
									<tr>
										<td><div class="pic">
												<img src="anya.jpg" width="80px">
											</div></td>
										<td>아냐</td>
										<td><a href="ad_memde.jsp">임승택</a></td>
										<td>2022.9.30</td>
										<td>아냐남친</td>
										<td>152</td>
										<td><a href="ad_prod_de.jsp">상세</a></td>
									</tr>
									<tr>
										<td><div class="pic">
												<img src="anya.jpg" width="80px">
											</div></td>
										<td>아냐</td>
										<td><a href="ad_memde.jsp">임홍</a></td>
										<td>2022.9.30</td>
										<td>아냐남친</td>
										<td>152</td>
										<td><a href="ad_prod_de.jsp">상세</a></td>
									</tr>
									<tr>
										<td><div class="pic">
												<img src="anya.jpg" width="80px">
											</div></td>
										<td>아냐</td>
										<td><a href="ad_memde.jsp">장문기</a></td>
										<td>2022.9.30</td>
										<td>아냐남친</td>
										<td>152</td>
										<td><a href="ad_prod_de.jsp">상세</a></td>
									</tr>
									<tr>
										<td><div class="pic">
												<img src="anya.jpg" width="80px">
											</div></td>
										<td>아냐</td>
										<td><a href="ad_memde.jsp">장문기</a></td>
										<td>2022.9.30</td>
										<td>아냐남친</td>
										<td>152</td>
										<td><a href="ad_prod_de.jsp">상세</a></td>
									</tr>
									<tr>
										<td><div class="pic">
												<img src="anya.jpg" width="80px">
											</div></td>
										<td>아냐</td>
										<td><a href="ad_memde.jsp">장문기</a></td>
										<td>2022.9.30</td>
										<td>아냐남친</td>
										<td>152</td>
										<td><a href="ad_prod_de.jsp">상세</a></td>
									</tr>

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


	<!-- Page specific script -->
	<script>
		$(function() {
			$("#example1").DataTable({
				"responsive" : true,
				"lengthChange" : false,
				"autoWidth" : false,
				"buttons" : [ "colvis" ]
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
