<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>

<script type="text/javascript">

	function prodel() {
		window.location.href = 'prodel.mdo?prod_seq=${board.prod_seq }';
	}
</script>

<link rel="stylesheet" href="/myweb/Admin_page/member/prodpage.css">

</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2"></div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">상품 상세</h3>
					</div>
					<!-- ./card-header -->
					<div class="prodread">
						<div class="grid_10 read">
							<div class="grid_4 pics">

								<img class="grid_4" src="anya.jpg">

							</div>
							<div class="grid_6 texts">

								<div class="innertext">
									<div class="row grid_5 user">
										<div class="grid_1 psa">
											<img class="grid_1" src="anya.jpg">
										</div>
										<div class="grid_2 name">
											<h3>
												<a href="ad_memde.jsp">${board.nickname}</a>
											</h3>
											<div class="grid_2 location">부천시 상동</div>
										</div>
										<div class="grid_2 mannertemp">45도</div>
									</div>
									<div class="proinfo_1">

										<div class="cate">카테고리 : ${board.category }</div>
										<div class="title">${board.prod_title }</div>
										<div class="price">3,000원</div>

										<hr>
									</div>
									<div class="proinfo_2">

										<div class="clear row delbtn">
											<button class="grid_1" id="prodel" onclick="prodel()">삭제</button>

										</div>

									</div>

								</div>



							</div>

							<div class="prodinfo">
								상품정보
								<hr>
							</div>


							<div class="feature">${board.prod_content }</div>


						</div>

					</div>
					<!-- /.card -->
				</div>
			</div>

		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->







</body>
</html>

