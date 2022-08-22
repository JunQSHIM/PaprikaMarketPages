<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>방문자 수</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<link rel="stylesheet" type="text/css" href="ad_visitor.css">

</head>
<body>
<ul class="tabs">
	<li class="tab-link" data-tab="tab-1"><b>오늘 방문자 수</b></li>
	<li class="tab-link current" data-tab="tab-2"><b>일주일 방문자 수</b></li>
	<li class="tab-link" data-tab="tab-3"><b>월간 방문자 수</b></li>
</ul>
<br>

<div id="tab-1" class="tab-content">
	<div id="today_visitor">
<canvas id="line-chart" style="width: 200px; height: 100px"></canvas>
<script type="text/javascript">
new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: [00,02,04,06,08,10,12,14,16,18,20,22],
	    datasets: [{ 
	        data: [86,114,106,106,107,111,133,221,783,2478,432,334],
	        label: "오늘 방문자 수",
	        borderColor: "#3e95cd",
	        fill: false
	      }
	    ]
	  },
	  options: {
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
	    title: {
	      display: true,
	      fontSize:30,
	      text: '방문자 수'
	    }
	  }
	});
</script>
</div>
</div>

<div id="tab-2" class="tab-content current">
	<div id="weekly_visitor">
<canvas id="bar-chart2" style="width: 300px; height: 150px;" ></canvas>
<script type="text/javascript">
new Chart(document.getElementById("bar-chart2"), {
    type: 'bar',
    data: {
      labels: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#3e95cd", "#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [2478,5267,734,784,433,555,999]
        }
      ]
    },
    options: {
      legend: { display: false },
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
      title: {
    	fontSize: 30,
        display: true,
        text: '방문자 수'
      }
    }
});
</script>
</div>
</div>

<div id="tab-3" class="tab-content">
	<div id="weekly_visitor">
<canvas id="bar-chart3" style="width: 300px; height: 150px;" ></canvas>
<script type="text/javascript">
new Chart(document.getElementById("bar-chart3"), {
    type: 'bar',
    data: {
      labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
      datasets: [
        {
          label: "Population (millions)",
         fontSize:30,
          backgroundColor: ["#3e95cd", "#3e95cd", "#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [2478,5267,734,784,433,555,999,2478,5267,734,784,433]
        }
      ]
    },
    options: {
      legend: { display: false },
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
      title: {
    	fontSize: 30,
        display: true,
        text: '방문자 수'
      }
    }
});
</script>
</div>
</div>

<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="ad_visitor.js"></script>
<script src="../plugins/jquery/jquery.min.js"></script>
</body>
</html>