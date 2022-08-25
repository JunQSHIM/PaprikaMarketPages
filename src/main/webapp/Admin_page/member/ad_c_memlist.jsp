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
										<td>부산</td>
										<td>usin@naver.com</td>
										<td>01012314124</td>
										<td>1998.08.15</td>
										<td>부산사람</td>
										<td>152</td>
										<td id="status">Blocked</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">장문기</a></td>
										<td>동네인증이 필요합니다.</td>
										<td>moonknight@naver.com</td>
										<td>01015325234</td>
										<td>1993.01.01</td>
										<td>부천인</td>
										<td>0</td>
										<td id="status">Active</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">박예솔</a></td>
										<td>서울</td>
										<td>yesol@naver.com</td>
										<td>01016438454</td>
										<td>1996.03.03</td>
										<td>서울사람</td>
										<td>1</td>
										<td id="status">Active</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">심준규</a></td>
										<td>인천</td>
										<td>junq@naver.com</td>
										<td>01014833424</td>
										<td>1997.03.07</td>
										<td>인천사람</td>
										<td>7</td>
										<td id="status">Active</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">임승택</a></td>
										<td>부천</td>
										<td>lst@naver.com</td>
										<td>01012235756</td>
										<td>1997.04.04</td>
										<td>빵맨</td>
										<td>157</td>
										<td id="status">Active</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button></td>
									</tr>
									<tr>
										<td><a href="ad_memde.jsp">임홍</a></td>
										<td>부천</td>
										<td>leemong486@naver.com</td>
										<td>01098762341</td>
										<td>92</td>
										<td>57</td>
										<td>57</td>
										<td id="status">Active</td>
										<td><button class="Block_btn" type="button">Block</button>
											&nbsp;&nbsp;
											<button class="Active_btn" type="button">Active</button></td>
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
