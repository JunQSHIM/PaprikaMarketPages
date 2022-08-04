<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="mother.js"></script>

<title>Mother</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="grid1.css">
<link rel="stylesheet" type="text/css" href="main1.css">
<link rel="stylesheet" type="text/css" href="prods.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
%>

</head>
<body>
	<div class="row wrap">
		<div class="grid_2 ad"></div>
		<div class="container_12">
			<%@include file="header.jsp"%>
			<%@include file="nav.jsp"%>
			<div class="grid_12 article">
				<%@include file="category.jsp"%>