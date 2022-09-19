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

		<%@include file="/WEB-INF/admin/Admin_page/layout/ad_layout.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content">
			<%@include file="/WEB-INF/admin/Admin_page/admin_banner/regi_banner.jsp"%>
			</section>
			<!-- /.content -->
		</div>
		<%@include file="/WEB-INF/admin/Admin_page/layout/ad_footer.jsp"%>
	</div>
	
</body>
</html>