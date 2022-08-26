<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | ChartJS</title>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<section class="col-lg-7 connectedSortable">
						<!-- AREA CHART -->
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">방문자수</h3>

								<div class="card-tools">
									<ul class="nav nav-pills ml-auto">
										<li class="nav-item"><a class="nav-link active"
											href="#day-chart" data-toggle="tab">Day</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#week-chart" data-toggle="tab">Week</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#month-chart" data-toggle="tab">Month</a></li>
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
										<div>오늘 방문자</div>
										<br>
										<canvas id="dayChart"
											style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
									</div>

									<div class="chart tab-pane" id="week-chart"
										style="position: relative; height: 300px;">
										<div>이번주 방문자</div>
										<br>
										<canvas id="weekChart"
											style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
									</div>

									<div class="chart tab-pane" id="month-chart"
										style="position: relative; height: 300px;">
										<div>이번달 방문자</div>
										<br>
										<canvas id="monthChart"
											style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->

						<!-- 카테고리별 품목 CHART -->
						<div class="card card-info">
							<div class="card-header">
								<h3 class="card-title">가입자/탈퇴자</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body">
								<canvas id="prodChart"
									style="min-height: 300px; height: 250px; max-height: 300px; max-width: 100%;"></canvas>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->


						<!-- 가입/탈퇴 CHART -->
						<div class="card card-danger">
							<div class="card-header">
								<h3 class="card-title">가입자/탈퇴자</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body">
								<canvas id="subscribersChart"
									style="min-height: 300px; height: 250px; max-height: 300px; max-width: 100%;"></canvas>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->




					</section>
					<!-- /.col (LEFT) -->


					<section class="col-lg-5 connectedSortable">
						<!-- LINE CHART -->
						<div class="card card-danger">
							<div class="card-header">
								<h3 class="card-title">탈퇴 사유</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body">
								<div class="chart">
									<canvas id="quitChart"
										style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->

						<!-- 신고 CHART -->
						<div class="card card-danger">
							<div class="card-header">
								<h3 class="card-title">신고사유</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body">
								<canvas id="singoChart"
									style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->

						<!-- STACKED BAR CHART -->
						<div class="card card-success">
							<div class="card-header">
								<h3 class="card-title">Stacked Bar Chart</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
									<button type="button" class="btn btn-tool"
										data-card-widget="remove">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
							<div class="card-body">
								<div class="chart">
									<canvas id="stackedBarChart"
										style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->

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
		$(function() {
			/* ChartJS
			 * -------
			 * Here we will create a few charts using ChartJS
			 */

			//--------------
			//- day CHART -
			//--------------
			// Get context with jQuery - using jQuery's .get() method.
			var dayChartCanvas = $('#dayChart').get(0).getContext('2d')

			var dayChartData = {
				labels : [ 00, 02, 04, 06, 08, 10, 12, 14, 16, 18, 20, 22 ],
				datasets : [ {
					data : [ 86, 114, 106, 106, 107, 111, 133, 221, 783, 2478,
							432, 334 ],
					label : "오늘 방문자 수",
					borderColor : "#3e95cd",
					fill : false
				} ]
			}

			var dayChartOptions = {
				maintainAspectRatio : false,
				responsive : true,
				legend : {
					display : false
				},
				scales : {
					xAxes : [ {
						ticks : {
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 20
						},
					} ],
					yAxes : [ {
						ticks : {
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 20
						}
					} ]
				}

			}

			// This will get the first returned node in the jQuery collection.
			new Chart(dayChartCanvas, {
				type : 'line',
				data : dayChartData,
				options : dayChartOptions
			})
			//-------------
			//- week CHART -
			//-------------
			var weekChartCanvas = $('#weekChart').get(0).getContext('2d')
			var weekChartData = {
				labels : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
				datasets : [ {
					label : "Population (millions)",
					backgroundColor : [ "#3e95cd", "#3e95cd", "#3e95cd",
							"#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850" ],
					data : [ 2478, 5267, 734, 784, 433, 555, 999 ]
				} ]
			}

			var weekChartOptions = {
				responsive : true,
				maintainAspectRatio : false,
				datasetFill : false,
				legend : {
					display : false
				},
				scales : {
					xAxes : [ {
						ticks : {
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 20
						},
					} ],

					yAxes : [ {
						ticks : {
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 20
						},
					} ]
				}

			}

			new Chart(weekChartCanvas, {
				type : 'bar',
				data : weekChartData,
				options : weekChartOptions
			})

			//-------------
			//- month CHART -
			//-------------

			var monthChartCanvas = $('#monthChart').get(0).getContext('2d')
			var monthChartData = {
				labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				datasets : [ {
					label : "Population (millions)",
					fontSize : 30,
					backgroundColor : [ "#3e95cd", "#3e95cd", "#3e95cd",
							"#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850",
							"#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9",
							"#c45850" ],
					data : [ 2478, 5267, 734, 784, 433, 555, 999, 2478, 5267,
							734, 784, 433 ]
				} ]
			}

			var monthChartOptions = {
				responsive : true,
				maintainAspectRatio : false,
				datasetFill : false,
				legend : {
					display : false
				},
				scales : {
					xAxes : [ {
						ticks : {
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 20
						},
					} ],

					yAxes : [ {
						ticks : {
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 20
						},
					} ]
				}

			}

			new Chart(monthChartCanvas, {
				type : 'bar',
				data : monthChartData,
				options : monthChartOptions
			})

			//-------------
			//- Singo CHART -
			//-------------
			var singoChartCanvas = $('#singoChart').get(0).getContext('2d')
			var singoData = {
				labels : [ "광고 (상점 및 타사이트 홍보, 상품도배)",
						"상품 정보 부정확(상품명, 이미지, 가격, 태그 등)", "거래 금지 품목",
						"안전결제 허위매울(안전결제 표시 상품 안전결제 거부)", "사기의심(외부채널 유도)",
						"기타(사유)" ],
				datasets : [ {
					label : "Population (millions)",
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#3cba9f",
							"#e8c3b9", "#c45850", "#f00020" ],
					data : [ 2478, 5267, 734, 784, 433, 223 ]
				} ]
			}
			var singoOptions = {
				maintainAspectRatio : false,
				responsive : true,
				title : {
					display : true,
					text : '신고 사유',
					fontSize : 30
				},
				legend : {
					position : 'right',
				}
			}

			new Chart(singoChartCanvas, {
				type : 'doughnut',
				data : singoData,
				options : singoOptions
			})

			//-------------
			//- 가입 탈퇴자 CHART -
			//-------------
			// Get context with jQuery - using jQuery's .get() method.
			var subscribersChartCanvas = $('#subscribersChart').get(0)
					.getContext('2d')

			var subscribersChartData = {
				labels : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
				datasets : [ {
					label : '가입자 수',
					backgroundColor : 'rgba(255, 99, 132, 0.2)',
					borderColor : 'rgba(255, 99, 132, 1)',
					pointRadius : false,
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data : [ 28, 48, 40, 19, 86, 27, 90 ]
				}, {
					label : '탈퇴자수',
					backgroundColor : 'rgba(75, 192, 192, 0.2)',
					borderColor : 'rgba(75, 192, 192, 1)',
					pointRadius : false,
					pointColor : 'rgba(210, 214, 222, 1)',
					pointStrokeColor : '#c1c7d1',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(220,220,220,1)',
					data : [ 65, 59, 80, 81, 56, 55, 40 ]
				}, ]
			}

			var subscribersChartOptions = {
				responsive : true,
				scales : {
					x : {
						title : {
							display : true,
							text : '요일'
						}
					},
					'y-left' : {
						type : 'linear',
						position : 'left',
						title : {
							display : true,
							text : '가입/탈퇴자 수'
						},
						grid : {
							display : false
						}
					}
				}
			}

			new Chart(subscribersChartCanvas, {
				type : 'bar',
				data : subscribersChartData,
				options : subscribersChartOptions
			})

			//---------------------
			//- 탈퇴 사유 CHART -
			//---------------------

			var quitChartCanvas = $('#quitChart').get(0).getContext('2d')
			var quitData = {
				labels : [ "서비스불만족", "장기미사용", "타 플랫폼 이용", "개인정보노출우려",
						"상품의 다양성부족", "기타" ],
				datasets : [ {
					label : '회원탈퇴사유',
					data : [ 12, 11, 10, 8, 19, 3 ],
					backgroundColor : [ 'rgb(255, 99, 132)',
							'rgb(255, 159, 64)', 'rgb(255, 205, 86)',
							'rgb(75, 192, 192)', 'rgb(54, 162, 235)',
							'rgb(153, 102, 255)' ]
				} ]
			}
			var quitOptions = {
				maintainAspectRatio : false,
				responsive : true,
				title : {
					display : true,
					text : "회원탈퇴사유",
					fontSize : 30,
					fontColor : "black"
				},
				legend : {
					position : 'right',
				}
			}

			new Chart(quitChartCanvas, {
				type : 'doughnut',
				data : quitData,
				options : quitOptions
			})

			//---------------------
			//- STACKED BAR CHART -
			//---------------------
			var prodChartCanvas = $('#prodChart').get(0).getContext('2d')
			var prodChartData = {
				labels: ["디지털기기/가전", "가구/인테리어", "스포츠/레저", "게임/취미", "뷰티/미용"],
			      datasets: [
			        {
			          label: "Population (millions)",
			          backgroundColor: ["#dc3545", "#20c997","#007bff","#ffc107","#6f42c1"],
			          data: [2478,5267,734,784,433]
			        }
			      ]
			}
			var prodChartOptions = {
				responsive : true,
				maintainAspectRatio : false,
				scales: {
					xAxes: [{
						ticks:{
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 20
						},
					}],
				
					yAxes: [{
						ticks:{
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 20
						},
					}]
				},
				 legend: { display: false },
			      title: {
			        display: true,
			        text: '카테고리별 구매 수',
			        fontSize: 30
			      }
			}

			new Chart(prodChartCanvas, {
				type : 'horizontalBar',
				data : prodChartData,
				options : prodChartOptions
			})
		})
	</script>
</body>
</html>
