<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
<link rel="stylesheet" href="/myweb/Admin_page/ad.css" type="text/css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<%@include file="/WEB-INF/admin/Admin_page/layout/ad_layout.jsp"%>


		<!-- 콘텐츠 jsp 삽입구간 -->
		<%@include file="/WEB-INF/admin/Admin_page/admin_list/agreement_form.jsp"%>
		<!-- 콘텐츠 jsp 삽입구간 -->
		
		
		<!-- 푸터 -->
		<%@include file="/WEB-INF/admin/Admin_page/layout/ad_footer.jsp"%>
	</div>
</body>
</html>