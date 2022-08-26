<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<title>가입자 수</title>
 

<body>


<div class="myCanvas">
    <canvas id="myChart" width="100" height="50"></canvas>
</div>
<script type="text/javascript">
$(function(){
    let ctx = document.getElementById('myChart').getContext('2d');
    let chart = new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: chartOptions
    })
})

// chart data and options
let chartData = {
    labels: ['월요일', '화요일', '수요일'],
    datasets: [
        {
            label: '가입자 수',
            yAxisID: 'y-left',
            data: [10, 20, 30],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',

            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
            ],
            borderWidth: 1
        },
        {
            label: '탈퇴자 수',
            yAxisID: 'y-left',
            data: [10, 20, 30],
            backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
            ],
            borderColor: [
                'rgba(75, 192, 192, 1)',
            ],
            borderWidth: 1
        }
    ]
}

let chartOptions = {
    responsive:true,
    // maintainAspectRatio: false,
    scales: {
        x: {
            title: {
                display: true,
                text: '요일'
            }
        },
        'y-left': {
            type: 'linear',
            position: 'left',
            title: {
                display: true,
                text: '가입/탈퇴자 수'
            },
            grid: {
                display: false
            }
        }
       
    }
}
</script>

	<!-- ./wrapper -->
	<script src="/myweb/Admin_page/plugins/jquery/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>