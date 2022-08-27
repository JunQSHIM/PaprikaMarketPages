<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminPage</title>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<%@include file="/Admin_page/layout/ad_layout.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content">
			
		<%@include file="/Admin_page/admin_board/admin_board.jsp"%>
			
			</section>
			<!-- /.content -->
		</div>
		<%@include file="/Admin_page/layout/ad_footer.jsp"%>
	</div>
	<!-- PAGE PLUGINS -->
	<script src="/myweb/Admin_page/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery -->
<script src="/myweb/Admin_page/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/myweb/Admin_page/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
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


</body>
</html>