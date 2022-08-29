<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>


<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/fontawesome-free/css/all.min.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="/myweb/Admin_page/dist/css/adminlte.min.css">
<link rel="stylesheet" href="/myweb/Admin_page/ad.css" type="text/css">
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<%@include file="/Admin_page/layout/ad_layout.jsp"%>


		<!-- 콘텐츠 jsp 삽입구간 -->
		<%@include file="ad_c_report.jsp"%>
		<!-- 콘텐츠 jsp 삽입구간 -->



		<!-- 푸터 -->
		<%@include file="/Admin_page/layout/ad_footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	

</body>
</html>