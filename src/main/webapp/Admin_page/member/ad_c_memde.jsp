<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/mypage/mypage.css">
</head>
<body>


	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">

				<div class="col-sm-6"></div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">


					<div class="card">
						<div class="card-header">
							<h3 class="card-title">회원 목록</h3>
						</div>
						
						<article class="container_12">

		<div class="card">
			
			<div id="profile">
				<div id="profile_pic"></div>
				<div id="nickname_and_button">
					<div id="nickName">닉네임</div>
					<div id="function">	
						<button type="button" id="sell" onclick=move()></button>
						<button type="button" id="buy" onclick=move()></button>
						<button type="button" id="wishlist" onclick=move()></button>
					</div>
				</div>
				<div id="temperature">
					<div id="mannerTitle">매너온도</div>
					<div id="mannerTemp">123</div>
					<div class="outterTempBar">
						<div id="innerTempBar"></div>
					</div>
					<div id="redeal_and_answer">
						<div id="redeal">
							<b>🧡재거래희망율 -%</b><br/>
							-명 중 -명이 만족
						</div>
						<div id="answer">
							<b>💬응답율 -%</b><br/>
							보통 -분 이내 응답
						</div>
					</div>
					<div id="myLoc">
						<b>내 동네</b>
						
					</div>
				</div>
			</div>
			<div id="profile_edit">
				<div id="edit_button">
					<button type="button" onclick=toProfileEdit()>프로필 수정</button>
					<button type="button" onclick=verifyLoc()>동네 인증하기</button>
				</div>
			</div>
			<div id="eval_and_review">
				<div id="manner_eval">
					<div id="manner_eval_head"><b onclick=toMannerEval()>받은 매너 평가 ></b></div>
					<div id="manner_eval_list">받은 매너 칭찬이 아직 없어요</div>
				</div>
				<div id="purchase_review">
					<div id="review_list_head"><b onclick=toMyReview()>받은 거래 후기 ></b></div>
					<div id="review_list">받은 거래 후기가 아직 없어요</div>
				</div>
			</div>
		</div>
		</article>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->





	<!-- Page specific script -->
	<script>
	
	
	
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
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
</body>
</html>
