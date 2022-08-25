<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
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
							<h3 class="card-title">후기 목록</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>판매자</th>
										<th>구매자</th>										
										<th>거래지역</th>
										<th>상품</th>
										<th>작성시간</th>
										<th>후기내용</th>
										<th>상태</th>
										<th></th>
									</tr>
								</thead>
								<tbody>

									<%
									for (int i = 0; i < 20; i++) {
									%>
									<tr>
										<td><a href="ad_memde.jsp">김유신</a></td>
										<td><a href="ad_memde.jsp">심준규</a></td>
										<td>부산</td>
										<td><div class="pic">
													<a href="ad_prod_de.jsp"><img src="anya.jpg" width="80px"></a>
											</div></td>
										<td>2022.9.30</td>
										<td>잘쓰겠습니다 감사합니다.</td>

										<td id="status">Blocked</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button>&nbsp;&nbsp;
											<button class="Delete_btn" type="button">Delete</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">장문기</a></td>
										<td><a href="ad_memde.jsp">심준규</a></td>
										<td>부산</td>
										<td><div class="pic">
													<a href="ad_prod_de.jsp"><img src="anya.jpg" width="80px"></a>
											</div></td>
										<td>2022.9.30</td>
										<td>잘쓰겠습니다 감사합니다.</td>

										<td id="status">Blocked</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button>&nbsp;&nbsp;
											<button class="Delete_btn" type="button">Delete</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">박예솔</a></td>
										<td><a href="ad_memde.jsp">심준규</a></td>
										<td>부산</td>
										<td><div class="pic">
												<a href="ad_prod_de.jsp"><img src="anya.jpg" width="80px"></a>
											</div></td>
										<td>2022.9.30</td>
										<td>잘쓰겠습니다 감사합니다.</td>

										<td id="status">Blocked</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button>&nbsp;&nbsp;
											<button class="Delete_btn" type="button">Delete</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">임홍</a></td>
										<td><a href="ad_memde.jsp">심준규</a></td>
										<td>부산</td>
										<td><div class="pic">
												<a href="ad_prod_de.jsp"><img src="anya.jpg" width="80px"></a>
											</div></td>
										<td>2022.9.30</td>
										<td>잘쓰겠습니다 감사합니다.</td>

										<td id="status">Blocked</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button>&nbsp;&nbsp;
											<button class="Delete_btn" type="button">Delete</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">임승택</a></td>
										<td><a href="ad_memde.jsp">심준규</a></td>
										<td>부산</td>
										<td><div class="pic">
												<a href="ad_prod_de.jsp"><img src="anya.jpg" width="80px"></a>
											</div></td>
										<td>2022.9.30</td>
										<td>잘쓰겠습니다 감사합니다.</td>

										<td id="status">Blocked</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button>&nbsp;&nbsp;
											<button class="Delete_btn" type="button">Delete</button></td>
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
