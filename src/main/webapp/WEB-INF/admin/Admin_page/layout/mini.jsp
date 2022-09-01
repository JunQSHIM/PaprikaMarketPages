<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li>      제목 : <input type="text" id="new_card_title">
	          	<button id="create_btn">카드 생성</button></li>
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
</div>
    	
<div class="row">
	<div class="col-lg-3 col-6">
		<!-- small box -->
		<div class="small-box bg-info">
			<div class="inner">
				<h3>150</h3>

				<p>게시물</p>
			</div>
			<div class="icon">
				<i class="ion ion-bag"></i>
			</div>
			<a href="#" class="small-box-footer">More info <i
				class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
		<!-- small box -->
		<div class="small-box bg-success">
			<div class="inner">
				<h3>
					53
				</h3>

				<p>오늘의 방문자수 </p>
			</div>
			<div class="icon">
				<i class="ion ion-stats-bars"></i>
			</div>
			<a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
		<!-- small box -->
		<div class="small-box bg-warning">
			<div class="inner">
				<h3>44</h3>

				<p>오늘의 최고 매출 상품</p>
			</div>
			<div class="icon">
				<i class="ion ion-person-add"></i>
			</div>
			<a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
		<!-- small box -->
		<div class="small-box bg-danger">
			<div class="inner">
				<h3>65</h3>

				<p>새로운 신고</p>
			</div>
			<div class="icon">
				<i class="ion ion-pie-graph"></i>
			</div>
			<a href="#" class="small-box-footer">More info<i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
</div>
<!-- /.row -->

<body class="hold-transition sidebar-mini">

	<div class="wrapper">
		<!-- Main content -->
		<section class="content">
		
			<div class="container-fluid">
				<div class="row">
					<section class="col-lg-7 connectedSortable">



					</section>
					<!-- /.col (LEFT) -->


					<section class="col-lg-5 connectedSortable" id="cre_page">

					</section>
					<!-- /.col (RIGHT) -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
<script>
$("#create_btn").on("click", function() {
	var new_title = $('#new_card_title').val();
	var card_layout1 =`
		<div class="card card-info">
			<div class="card-header">
				<h3 class="card-title">`
	var card_layout2= `
				</h3>
				<div class="card-tools">
				<button type="button" class="btn btn-tool" id="cre_chart">
					생성
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="collapse">
					<i class="fas fa-minus"></i>	
				</button>
				<button type="button" class="btn btn-tool"
					data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
				</div>
			</div>
			<div class="card-body">
				<div id="place"></div>
			</div>
		</div>`
		console.log(new_title);
		$("#cre_page").append(card_layout1 + new_title + card_layout2);
});
</script>