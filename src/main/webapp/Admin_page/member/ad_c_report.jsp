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

</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2"></div>
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
								<h3 class="card-title">신고 목록</h3>
							</div>
							<!-- ./card-header -->
							<div class="card-body">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>

											<th>#</th>
											<th>신고자</th>
											<th>피신고자</th>
											<th>날짜</th>
											<th>상태</th>

										</tr>
									</thead>
									<tbody>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>1</td>
											<td>심준규</td>
											<td>이승재</td>
											<td>11-7-2014</td>
											<td>Approved</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>구매할때 프사에는 정상인 사진이었는데 막상 직거래로 만났더니 상대방이 대머리인거 있죠... 너무
													혐오스러워서 보자마자 토했습니다. 이승재 사용자를 신고합니다.</p>
											</td>
										</tr>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td>2</td>
											<td>김유신</td>
											<td>심준규</td>
											<td>11-7-2014</td>
											<td>Pending</td>

										</tr>
										<tr class="expandable-body">
											<td colspan="5">
												<p>거래하고싶어서 채팅으로 물어봤더니 부산사투리 쓴다고 욕하네요. 이런 지역감정 유발자는 최고의
													마켓인 파프리카 마켓을 사용하면 안됩니다.</p>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>


	</div>
	<!-- ./wrapper -->


	<!-- Bootstrap 4 -->
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
</body>
</html>