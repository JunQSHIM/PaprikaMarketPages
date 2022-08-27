<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<canvas id="doughnut-chart" width="100" height="50"></canvas>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript">
new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["광고 (상점 및 타사이트 홍보, 상품도배)", "상품 정보 부정확(상품명, 이미지, 가격, 태그 등)", "거래 금지 품목", "안전결제 허위매울(안전결제 표시 상품 안전결제 거부)", "사기의심(외부채널 유도)", "기타(사유)"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#f00020"],
          data: [2478,5267,734,784,433,223]
        }
      ]
    },
    options: {
    	
      title: {
        display: true,
        text: '신고 사유',
        fontSize:30
      },
      legend:{
    	  position:'right',
      }
    }
});
</script>
</body>
</html>