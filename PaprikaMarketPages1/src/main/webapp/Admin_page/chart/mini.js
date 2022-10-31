$(document).ready(function(){
	getGraph();
});

function getGraph(type){
			
			let timeList =[];
			let countList=[];
			let url = "/myweb/charLogin.mdo";
			$.ajax({
				url : url,
				type:"post",
				success:function(data){
					for(let i=0 ; i < data.length ; i++){
						timeList.push(data[i].time);
						countList.push(data[i].cnt);
					}
					console.log(data);
					var dayChartCanvas = $('#dayChart').get(0).getContext('2d')

			var dayChartData = {
				labels : timeList,
				datasets : [ {
					data : countList,
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
								}
		})//ajax
}//getgraph				
					




