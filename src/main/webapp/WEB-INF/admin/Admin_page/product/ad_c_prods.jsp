<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>

<link rel="stylesheet" href="/myweb/Admin_page/member/ad_prods.css">
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
										<th>닉네임</th>
										<th>구매자</th>
										<th>업로드시간</th>
										<th>신고받은횟수</th>

									</tr>
								</thead>
								<tbody>
  
									<c:forEach items="${list }" var="list" varStatus="status">
										<tr>
											<td><div class="pic">
													<a href="prod_de.mdo?prod_seq=${list.post_seq}"><img src="${photo[status.index] }"
														width="80px"></a>
												</div></td>
											<td><a href="prod_de.mdo?prod_seq=${list.post_seq}">${list.post_title }</a></td>
											<td id="seller"><a href="memde.mdo">${user.name }</a></td>
											<td id="buyer"><a href="memde.mdo">Null</a></td>
											<td><fmt:formatDate value="${list.create_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
											<td>152</td>

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
