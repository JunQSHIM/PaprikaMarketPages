<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <body>
        <canvas id="myChart" style="width:40px; height:40px;"></canvas>
        <script>
              var ctx = document.getElementById("myChart");
              var myChart = new Chart(ctx, {
                  type: 'pie',
                  data: {
                      labels: ["서비스불만족", "장기미사용", "타 플랫폼 이용", "개인정보노출우려", "상품의 다양성부족" ,"기타"],
                      datasets: [{
                          label: '회원탈퇴사유',
                          data: [12, 11, 10, 8, 19, 3],
                          backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
                      }]
                  },
                  options: {
                	    title: {
                	      display: true,
                	      text: "회원탈퇴사유",
                	      fontSize: 30,
                	      fontColor: "black"
                	    },
                  }
              });
        </script>
    </body>
</html>