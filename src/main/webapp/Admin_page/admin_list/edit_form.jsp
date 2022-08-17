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
<script>
function editComp(){
	document.getElementById('edit').submit();
}
function goToAdd(){
	 window.location.href ='/myweb/Admin_page/admin_list/add.jsp';
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
						<h1>관리자목록</h1>
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
							<!-- /.card-header -->
							<div class="card-header">
								<b>Super Admin(수퍼 관리자, 최고 관리자)</b>–사이트 네트워크관리 기능과 모든 기능에 접근 가능<br>
								<b>Administrator(관리자)</b>–단일 사이트 내의 모든 관리 기능에 접근가능<br>
								<b>Editor(편집자)</b>–글(다른 사용자 글 포함)을 게시/관리할 수 있는 사용자
								<div style="float:right;">
									<button onclick="editComp()">수정완료</button>
									<button onclick="goToAdd()">신규등록</button>
								</div>
							</div>
							<div class="card-body">
								<form id="edit" action="admin_list.jsp" method="post">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>이름</th>
											<th>사번</th>
											<th>아이디</th>
											<th>비밀번호</th>
											<th>이메일</th>
											<th>전화번호</th>
											<th>생년월일</th>
											<th>닉네임</th>
											<th>직급</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>김유신</td>
											<td>00001</td>
											<td>00001</td>
											<td>00001</td>
											<td>usin@naver.com</td>
											<td>01012314124</td>
											<td>1998.08.15</td>
											<td>부산사람</td>
											<td>
												<select name="role">
													<option value="Super Admin">Super Admin</option>
													<option value="Administrator">Administrator</option>
													<option value="Editor">Editor</option>													
												</select>
											</td>
										</tr>
										<tr>
											<td>장문기</td>
											<td>00002</td>
											<td>00002</td>
											<td>00002</td>
											<td>moonknight@naver.com</td>
											<td>01015325234</td>
											<td>1993.01.01</td>
											<td>부천인</td>
											<td>
												<select name="role">
													<option value="Super Admin">Super Admin</option>
													<option value="Administrator">Administrator</option>
													<option value="Editor">Editor</option>													
												</select>
											</td>
										</tr>
										<tr>
											<td>박예솔</td>
											<td>00003</td>
											<td>00003</td>
											<td>00003</td>
											<td>yesol@naver.com</td>
											<td>01016438454</td>
											<td>1996.03.03</td>
											<td>서울사람</td>
											<td>
												<select name="role">
													<option value="Super Admin">Super Admin</option>
													<option value="Administrator">Administrator</option>
													<option value="Editor">Editor</option>													
												</select>
											</td>
										</tr>
										<tr>
											<td>심준규</td>
											<td>00004</td>
											<td>00004</td>
											<td>00004</td>
											<td>junq@naver.com</td>
											<td>01014833424</td>
											<td>1997.03.07</td>
											<td>인천사람</td>
											<td>
												<select name="role">
													<option value="Super Admin">Super Admin</option>
													<option value="Administrator">Administrator</option>
													<option value="Editor">Editor</option>													
												</select>
											</td>
										</tr>
										<tr>
											<td>임승택</td>
											<td>00005</td>
											<td>00005</td>
											<td>00005</td>
											<td>lst@naver.com</td>
											<td>01012235756</td>
											<td>1997.04.04</td>
											<td>빵맨</td>
											<td>
												<select name="role">
													<option value="Super Admin">Super Admin</option>
													<option value="Administrator">Administrator</option>
													<option value="Editor">Editor</option>													
												</select>
											</td>
										</tr>
										<tr>
											<td>임홍</td>
											<td>00006</td>
											<td>00006</td>
											<td>00006</td>
											<td>leemong486@naver.com</td>
											<td>01098762341</td>
											<td>1992.01.01</td>
											<td>시드니매콤주먹</td>
											<td>
												<select name="role">
													<option value="Super Admin">Super Admin</option>
													<option value="Administrator">Administrator</option>
													<option value="Editor">Editor</option>													
												</select>
											</td>
										</tr>
									</tbody>
								</table>
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







