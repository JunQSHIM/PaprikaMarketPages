<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
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
<link rel="stylesheet" type="text/css" href="admins.css">
<link rel="stylesheet" href="qna_list.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>

	var num = 7;
	function addComp() {
		window.location.href = '/myweb/Admin_page/admin_list/qna.jsp';
	}
	function update() {
		window.location.href = '/myweb/Admin_page/admin_list/editQna.jsp';
	}
	$(document).ready(function() {
		$(".flip").click(function() {
			$(".panel").slideToggle("slow");
		});
		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		});
		$('#addCategory').click(function(){
			const addValue = document.getElementById('category').value;
			$("#tabs").append("<li class='tab-link' data-tab='tab-"+num+"'><b>"+addValue+"</b></li>");
			console.log(num);
			num++;
		});
	});
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
						<h1>자주묻는 질문</h1>
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
									<button onclick="addComp()">추가완료</button>
								</div>
							</div>
							<div class="card-body">
								<ul class="tabs" id="tabs">
									<li class="tab-link" data-tab="tab-1"><b>운영정책</b></li>
									<li class="tab-link" data-tab="tab-2"><b>계정 / 인증</b></li>
									<li class="tab-link" data-tab="tab-3"><b>분쟁 및 이용제재</b></li>
									<li class="tab-link" data-tab="tab-4"><b>거래 및 환불 정책</b></li>
									<li class="tab-link" data-tab="tab-5"><b>판매 금지 물품</b></li>
									<li class="tab-link" data-tab="tab-6"><b>개인정보처리방침</b></li>
								</ul>
								<input type="text" id="category"> <input type="button"
									id="addCategory" value="카테고리추가">
								<form action="qna.jsp" method="post" id="qnaForm">
								<table id="qnaTable">
									<tr>
										<td>카테고리 선택</td>
										<td>
											<select name="category">
												<option value="운영정책">운영정책</option>
												<option value="계정/인증">계정/인증</option>
												<option value="분쟁 및 이용제재">분쟁 및 이용제재</option>
												<option value="거래 및 환불정책">거래 및 환불정책</option>
												<option value="판매금지물품">판매금지물품</option>
												<option value="개인정보처리방침">개인정보처리방침</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											질문추가
										</td>
										<td>
											<input type="text" name="Q">
										</td>
									</tr>
									<tr>
										<td>
											답변추가
										</td>
										<td>
											<input type="text" name="A">
										</td>
									</tr>
								</table>
								<button type="button" onclick="addA()">답변추가</button>
							</form>	

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
	<!-- ./wrapper -->

	<script>
	var tabId;
	var num = 7;
	function addComp() {
		document.getElementById("qnaForm").submit();
	}
	function update() {
		window.location.href = '/myweb/Admin_page/admin_list/editQna.jsp';
	}

	$(document).ready(function() {
		$(".flip").click(function() {
			$(".panel").slideToggle("slow");
		});
		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		});
	});
	function addCt(){
		const addValue = document.getElementById('category').value;
		$("#tabs").append("<li class='tab-link' data-tab='tab-"+num+"'><b>"+addValue+"</b></li>");
		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
			tabId = tab_id;
		});
		num++;
	}
	function addA(){
		
		var insertTr = "";

		insertTr += "<tr>";
		insertTr += "<td>답변추가</td>"
		insertTr += "<td><input type='text' name='A'></td>";
		insertTr += "</tr>";

		$("#qnaTable").append(insertTr);
	}
	</script>


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
</body>
</html>
