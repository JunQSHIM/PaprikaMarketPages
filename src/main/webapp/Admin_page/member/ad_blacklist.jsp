<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="/myweb/Admin_page/plugins/fontawesome-free/css/all.min.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/myweb/Admin_page/dist/css/adminlte.min.css">
<link rel="stylesheet" href="/myweb/Admin_page/ad.css" type="text/css">
</head>
<!--
`body` tag options:

  Apply one or more of the following classes to to the body tag
  to get the desired effect

  * sidebar-collapse
  * sidebar-mini
-->
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- 상단네비바 -->
		<%@include file="/Admin_page/layout/ad_nav.jsp"%>
		<!-- 사이드네비바 -->
		<%@include file="/Admin_page/layout/ad_sidebar.jsp"%>


		<!-- 콘텐츠 jsp 삽입구간 -->
		<%@include file="ad_c_blacklist.jsp"%>
		<!-- 콘텐츠 jsp 삽입구간 -->
		
		
		
		<!-- 푸터 -->
		<%@include file="/Admin_page/layout/ad_footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->


<!-- overlayScrollbars -->
<script src="/myweb/Admin_page/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>


<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="/myweb/Admin_page/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="/myweb/Admin_page/plugins/raphael/raphael.min.js"></script>
<script src="/myweb/Admin_page/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="/myweb/Admin_page/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="/myweb/Admin_page/plugins/chart.js/Chart.min.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="/myweb/Admin_page/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/myweb/Admin_page/dist/js/pages/dashboard2.js"></script>
</body>
</html>