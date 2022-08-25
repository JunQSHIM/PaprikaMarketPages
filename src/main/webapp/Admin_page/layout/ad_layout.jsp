<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/a75c39dc66.js"
	crossorigin="anonymous"></script>
<!-- Theme style -->
<link rel="stylesheet" href="/myweb/Admin_page/layout/css/adminlte.light.css">

<!-- DataTables -->
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
	
	<!-- jQuery -->
	<script src="/myweb/Admin_page/plugins/jquery/jquery.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/myweb/Admin_page/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="/myweb/Admin_page/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/myweb/Admin_page/layout/js/adminlte.js"></script>
		<!-- DataTables  & Plugins -->
	<script	src="/myweb/Admin_page/plugins/datatables/jquery.dataTables.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="/myweb/Admin_page/plugins/jszip/jszip.min.js"></script>
	<script src="/myweb/Admin_page/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="/myweb/Admin_page/plugins/pdfmake/vfs_fonts.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	
	
	
</head>
<body>
	<!-- Preloader -->
	<div class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="/myweb/login/images/paplogo.png" alt="paprikaLogo"  height="60" width="60">
		</div>
	
	<%@include file="ad_nav.jsp"%>
	<%@include file="ad_sidebar.jsp"%>
</body>
</html>