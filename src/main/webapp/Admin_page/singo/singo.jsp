<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="singo.css">
<script src="singo.js"></script>
<title>DataTable</title>
</head>
<body>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>신고 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item" id="home">신고 리스트</li>
						<li class="breadcrumb-item active" id="tree">신고 내용</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">

					<div class="card" id="singo_list">
						<div class="card-header">
							<h3 class="card-title">신고 리스트</h3>
						</div>
						<div class="card-body">
							<%@ include file="singo_list.jsp" %>
						</div>
					</div>
					
					
					<div id="singo_card">
						<%@include file="singo_control.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
<script>
	$(function() {
		$('#example1').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : false,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false,
			"responsive" : true,
		});
	});
</script>
</html>