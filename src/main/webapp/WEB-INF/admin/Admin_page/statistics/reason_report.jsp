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
		<div class="content-wrapper" style="background-color: white;">
			<!-- Main content -->
			<section class="content">
		<div style="display: block; align-content: center; margin: 50px 50px 100px; ">
		<%@include file="/Admin_page/statistics/ad_reason_report.jsp"%>
		</div>
			</section>
			<!-- /.content -->
		</div>
		<%@include file="/Admin_page/layout/ad_footer.jsp"%>
	</div>
	
</body>
</html>