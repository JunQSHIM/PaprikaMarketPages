<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/myweb/Admin_page/plugins/chart.js/Chart.js"></script>
<title>AdminLTE 3 | ChartJS</title>
</head>
<body class="hold-transition sidebar-mini">

<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
          		<input type="text" value="제목" id="new_card_title">
	          	<button id="create_btn">통계 생성</button>
	          	<select id="type">
	          		<option value="post">상품</option>
	          		<option value="board">게시판</option>
	          		<option value="reg">가입자</option>
	          		<option value="quit">탈퇴자</option>
	          		<option value="security">안전 거래 사용</option>
	          		<option value="complete">거래완료</option>
	          		<option value="loginHistory">접속자 수</option>
	          	</select>
	          	
	          	<select id="time" name="time">
	          		<option value="today">이번주</option>
	          		<option value="lastweek">지난주</option>
	          		<option value="lasttwoweek">2주전</option>
	          		<option value="lasttreeweek">3주전</option>
	          		<option value="year">올해</option>
	          	</select>

	          	<select id="chartType" name="chartType">
	          		<option value="line">선</option>
	          		<option value="bar">막대</option>
	          	</select>
	          	
	          	<select id="idn">
	          		<option>선택안함</option>
	          		<option>카테고리별</option>
	          		<option>탈퇴사유</option>
	          	</select>
	          	
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
</div>

	<div class="wrapper">
		<!-- Main content -->
		<section class="content">
		
			<div class="container-fluid">
				<div class="row">
					<section class="col-lg-12 connectedSortable" id="cre_page">
						

					</section>
					<!-- /.col (LEFT) -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>

	<script>
	var a  = 1; //동적 id 생성
	
		$("#create_btn").on("click", function() {
	
			var new_title = $('#new_card_title').val();
			var card_layout1 =`
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">`
			var card_layout2= `
						</h3>
						<div class="card-tools">
						<button type="button" class="btns btn-tool">
							통계 보기
						</button>
						<button type="button" class="btn btn-tool" data-card-widget="collapse">
							<i class="fas fa-minus"></i>	
						</button>
						<button type="button" class="delete btn btn-tool" id="delete">
							<i class="fas fa-times"></i>
						</button>
						</div>
					</div>
					<div class="card-body">
						<div id="place"></div>
					</div>
				</div>`
				$("#cre_page").append(card_layout1 + new_title + card_layout2);
		});
		
		$(document).on("click", ".delete", function(e) {
			  const div = $(e.target).parents(".card");
			  div.remove();
		});
		
		
		$(document).on("click", ".btns", function() {
			
			var typeInt = document.getElementById("type").options.selectedIndex;
			var type;
			if(typeInt == 0){
				type = "post";
			}else if (typeInt ==1){
				type = "board";
			}else if (typeInt ==2){
				type = "user";
			}else if (typeInt ==3){
				type="withdrawal";
			}else if (typeInt ==4){
				type="post_pay";
			}else if (typeInt == 5){
				type="post_complete";
			}else if (typeInt == 6){
				type="loginHistory";
			}
			
			
			var new_chart = `<canvas id="prodChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>`
			var newid = $("#place").attr('id', "place"+a);
			newid.after(new_chart);
			$("#prodChart").attr('id', "prodChart"+a);
			
			var idnidx=document.getElementById("idn").options.selectedIndex;
			if( idnidx == 1){
				getcategoryGraph();
			}else if (idnidx == 2){
				getquitGraph();
			}else{
				if(document.getElementById("time").options.selectedIndex ==4){
					getmonthGraph(type);
				}else{
					getweekGraph(type);
				}
			}
		});
		function getweekGraph(type){
			var idx = document.getElementById("time").options.selectedIndex
			var chartInt = document.getElementById("chartType").options.selectedIndex;
			var charType;
			if (chartInt == 0){
				charType = "line";
			}else if (chartInt == 1){
				charType = "bar";
			}
			
			let timeList =[];
			let url = "/myweb/chart"+type+".mdo";
			$.ajax({
				url : url,
				type:"post",
				data: {time : idx},
				success:function(data){
					
					for(let i=0 ; i < data.length ; i++){
						timeList.push(data[i]);
					}
					
					var dayChartCanvas = $('#prodChart' + a).get(0).getContext('2d')
					a++;
					var dayChartData = {
						labels : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
						datasets : [ {
							data : timeList,
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
							type : charType,
							data : dayChartData,
							options : dayChartOptions
							})
			}
		})//ajax
	}//getGraph()
	
function getmonthGraph(type){
		var idx = document.getElementById("time").options.selectedIndex
		var chartInt = document.getElementById("chartType").options.selectedIndex;
		var charType;
		if (chartInt == 0){
			charType = "line";
		}else if (chartInt == 1){
			charType = "bar";
		}
		
		let timeList =[];
		let url = "/myweb/charty"+type+".mdo";
		$.ajax({
			url : url,
			type:"post",
			data: {time : idx},
			success:function(data){
				
				for(let i=0 ; i < data.length ; i++){
					timeList.push(data[i]);
				}
				console.log(timeList);
				
				var dayChartCanvas = $('#prodChart' + a).get(0).getContext('2d')
				a++;
				var dayChartData = {
					labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
					datasets : [ {
						data : timeList,
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
						type : charType,
						data : dayChartData,
						options : dayChartOptions
						})
		}
	})//ajax
}//getmonthGraph()

function getcategoryGraph(){
			var chartInt = document.getElementById("chartType").options.selectedIndex;
			var charType;
			if (chartInt == 0){
				charType = "line";
			}else if (chartInt == 1){
				charType = "bar";
			}
			
			let categoryList =[];
			let countList=[];
			let url = "/myweb/chartcategory.mdo";
			$.ajax({
				url : url,
				type:"post",
				success:function(data){
					
					for(let i=0 ; i < data.length ; i++){
						categoryList.push(data[i].name);
						countList.push(data[i].cnt);
					}
					console.log(countList);
					
					var dayChartCanvas = $('#prodChart' + a).get(0).getContext('2d')
					a++;
					var dayChartData = {
						labels : categoryList ,
						datasets : [ {
							data : countList,
							label : categoryList,
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
							type : charType,
							data : dayChartData,
							options : dayChartOptions
							})
			}
		})//ajax
	}//getCategoryGraph()


function getquitGraph(){
			var chartInt = document.getElementById("chartType").options.selectedIndex;
			var charType;
			if (chartInt == 0){
				charType = "line";
			}else if (chartInt == 1){
				charType = "bar";
			}
			
			let quitList =[];
			let countList=[];
			let url = "/myweb/chartquit.mdo";
			$.ajax({
				url : url,
				type:"post",
				success:function(data){
					
					for(let i=0 ; i < data.length ; i++){
						quitList.push(data[i].name);
						countList.push(data[i].cnt);
					}
					console.log(countList);
					
					var dayChartCanvas = $('#prodChart' + a).get(0).getContext('2d')
					a++;
					var dayChartData = {
						labels : quitList ,
						datasets : [ {
							data : countList,
							label : quitList,
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
							type : charType,
							data : dayChartData,
							options : dayChartOptions
							})
			}
		})//ajax
	}//getquitGraph()
	
</script>
</body>
</html>