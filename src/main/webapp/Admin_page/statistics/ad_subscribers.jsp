<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<title>가입자 수</title>
</head>
<body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="line-chart" style="width: 200px; height: 100px"></canvas>
<script type="text/javascript">
new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
	    datasets: [{ 
	        data: [86,114,106,106,107,111,133,221,783,2478],
	        label: "오늘 가입자 수",
	        borderColor: "#3e95cd",
	        fill: false
	      }, { 
	        data: [282,350,411,502,635,809,947,1402,3700,5267],
	        label: " 일주일 가입자 수",
	        borderColor: "#8e5ea2",
	        fill: false
	      }, { 
	        data: [168,170,178,190,203,276,408,547,675,734],
	        label: "한달 가입자 수",
	        borderColor: "#3cba9f",
	        fill: false
	      }, { 
	        data: [40,20,10,16,24,38,74,167,508,784],
	        label: "연간 가입자 수",
	        borderColor: "#e8c3b9",
	        fill: false
	      }, { 
	        data: [6,3,2,2,7,26,82,172,312,433],
	        label: "전체 가입자 수",
	        borderColor: "#c45850",
	        fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      fontSize:30,
	      text: '가입자 수'
	    }
	  }
	});
</script>

	<!-- ./wrapper -->
	<script src="/myweb/Admin_page/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/myweb/Admin_page/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script src="/myweb/Admin_page/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="/myweb/Admin_page/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="/myweb/Admin_page/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="/myweb/Admin_page/plugins/jszip/jszip.min.js"></script>
	<script src="/myweb/Admin_page/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="/myweb/Admin_page/plugins/pdfmake/vfs_fonts.js"></script>
	<script src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/myweb/Admin_page/dist/js/adminlte.min.js"></script>
</body>
</html>