<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 차트</title>
<link rel="stylesheet" href="ad_prodChart.css">

</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


							<div class="product_category">
							
						<div class="product_category_1">
							<div class="product_category_2">
								카테고리 선택
								<img src="/myweb/login/images/jjim_icon/category_arrow.png" width="10" height="6" alt="카테고리 화살표 아이콘">
							</div>
							<div class="product_category_3">
								<a class="all_category">카테고리 선택</a>
								<a class="category">디지털기기/가전</a>
								<a class="category">가구/인테리어</a>
								<a class="category">스포츠/레저</a>
								<a class="category">게임/취미</a>
								<a class="category">뷰티/미용</a>
							</div>
						</div>
					</div>
<canvas id="bar-chart-horizontal" width="600" height="250"></canvas>

<script type="text/javascript">
new Chart(document.getElementById("bar-chart-horizontal"), {
    type: 'horizontalBar',
    data: {
      labels: ["디지털기기/가전", "가구/인테리어", "스포츠/레저", "게임/취미", "뷰티/미용"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#fd7e14", "#fd7e14","#fd7e14","#fd7e14","#fd7e14"],
          data: [2478,5267,734,784,433]
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
      legend: { display: false },
      title: {
        display: true,
        text: '카테고리별 구매 수',
        fontSize: 30
      }
    }
});
</script>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript" src="ad_prodChart.js"></script>
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->

</body>
</html>