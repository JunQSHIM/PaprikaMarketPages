<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/myweb/Admin_page/dist/css/adminlte.min.css">
<link rel="stylesheet" href="/myweb/Admin_page/ad.css" type="text/css">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- 상단네비바 -->
		<%@include file="/WEB-INF/admin/Admin_page/layout/ad_nav.jsp"%>
		<!-- 사이드네비바 -->
		<%@include file="/WEB-INF/admin/Admin_page/layout/ad_sidebar.jsp"%>

		<!-- 콘텐츠 jsp 삽입구간 -->
		<%@include file="/WEB-INF/admin/Admin_page/admin_list/editAgreement_form.jsp"%>
		<!-- 콘텐츠 jsp 삽입구간 -->
		
		<!-- 푸터 -->
		<%@include file="/WEB-INF/admin/Admin_page/layout/ad_footer.jsp"%>
	</div>

</body>
</html>