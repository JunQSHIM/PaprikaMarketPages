<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
</div>
    	
<div class="row">
	<div class="col-lg-3 col-6">
		<!-- small box -->
		<div class="small-box bg-info">
			<div class="inner">
				<h3>${p }</h3>

				<p>오늘 등록된 상품</p>
			</div>
			<div class="icon">
				<i class="ion ion-bag"></i>
			</div>
			<a href="prods.mdo" class="small-box-footer">More info <i
				class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
		<!-- small box -->
		<div class="small-box bg-success">
			<div class="inner">
				<h3>${b }</h3>

				<p>오늘의 등록된 게시판 </p>
			</div>
			<div class="icon">
				<i class="ion ion-stats-bars"></i>
			</div>
			<a href="board.mdo" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
		<!-- small box -->
		<div class="small-box bg-warning">
			<div class="inner">
				<h3>${l }</h3>

				<p>오늘의 회원 방문횟수</p>
			</div>
			<div class="icon">
				<i class="ion ion-person-add"></i>
			</div>
			<a href="chart.mdo" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
		<!-- small box -->
		<div class="small-box bg-danger">
			<div class="inner">
				<h3>${s }</h3>

				<p>오늘 들어온 신고</p>
			</div>
			<div class="icon">
				<i class="ion ion-pie-graph"></i>
			</div>
			<a href="singo.mdo" class="small-box-footer">More info<i class="fas fa-arrow-circle-right"></i></a>
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
					<section class="col-lg-12 connectedSortable">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">오늘 방문자수</h3>

								<div class="card-tools">
									<ul class="nav nav-pills ml-auto">
										<li>
											<button type="button" class="btn btn-tool"
												data-card-widget="collapse">
												<i class="fas fa-minus"></i>
											</button>
										</li>
									</ul>
								</div>
							</div>
							<div class="card-body">
								<div class="tab-content p-0">
									<div class="chart tab-pane active" id="day-chart"
										style="position: relative; height: 300px;">
										<canvas id="dayChart"
											style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
									</div>

								</div>
							</div>
							<!-- /.card-body -->
						</div>
					</section>
					<!-- /.col (RIGHT) -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
<script type="text/javascript" src="/myweb/Admin_page/plugins/chart.js/Chart.js"></script>
<script type="text/javascript" src="/myweb/Admin_page/chart/mini.js"></script>