$(document).ready(function() {
	$("#panel1").hide();
	$("#panel2").hide();
	$("#panel3").hide();
	$("#panel4").hide();
	$("#panel6").hide();
	$("#btn1").click(function() {
		$("#panel1").slideToggle("slow");
		if ($("#panel2")[0].style.display != "none") {
			$("#panel2").slideToggle();
		}
		if ($("#panel3")[0].style.display != "none") {
			$("#panel3").slideToggle();
		}
		if ($("#panel4")[0].style.display != "none") {
			$("#panel4").slideToggle();
		}

		if ($("#panel6")[0].style.display != "none") {
			$("#panel6").slideToggle();
		}
	});
	$("#btn2").click(function() {
		$("#panel2").slideToggle("slow");
		if ($("#panel1")[0].style.display != "none") {
			$("#panel1").slideToggle();
		}
		if ($("#panel3")[0].style.display != "none") {
			$("#panel3").slideToggle();
		}
		if ($("#panel4")[0].style.display != "none") {
			$("#panel4").slideToggle();
		}

		if ($("#panel6")[0].style.display != "none") {
			$("#panel6").slideToggle();
		}
	});
	$("#btn3").click(function() {
		$("#panel3").slideToggle("slow");
		if ($("#panel1")[0].style.display != "none") {
			$("#panel1").slideToggle();
		}
		if ($("#panel2")[0].style.display != "none") {
			$("#panel2").slideToggle();
		}
		if ($("#panel4")[0].style.display != "none") {
			$("#panel4").slideToggle();
		}

		if ($("#panel6")[0].style.display != "none") {
			$("#panel6").slideToggle();
		}
	});

	$("#btn4").click(function() {
		$("#panel4").slideToggle("slow");
		if ($("#panel1")[0].style.display != "none") {
			$("#panel1").slideToggle();
		}
		if ($("#panel3")[0].style.display != "none") {
			$("#panel3").slideToggle();
		}
		if ($("#panel2")[0].style.display != "none") {
			$("#panel2").slideToggle();
		}

		if ($("#panel6")[0].style.display != "none") {
			$("#panel6").slideToggle();
		}
	});
	
	$("#btn6").click(function() {
		$("#panel6").slideToggle("slow");
		if ($("#panel1")[0].style.display != "none") {
			$("#panel1").slideToggle();
		}
		if ($("#panel2")[0].style.display != "none") {
			$("#panel2").slideToggle();
		}
		if ($("#panel4")[0].style.display != "none") {
			$("#panel4").slideToggle();
		}

		if ($("#panel3")[0].style.display != "none") {
			$("#panel3").slideToggle();
		}
	});
});

//???????????? ?????? ?????????
$(".report_content").click(function() {
	var report_content = $(this).val();
	report(report_content);
});

function report(report_content) {
	var chk = confirm('?????????????????????????');
	var user = $('#user_seq').val();
	var post = $('#post_seq').val();
	if (!chk) {
		alert('?????????????????????.');
		location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq=" + user);
		return false;
	}
	$.ajax({
		url: "/myweb/report.do",
		type: 'post',
		data: {
			user_seq: $('#user_seq').val(),
			post_seq: $('#post_seq').val(),
			user_singo_seq: $('#user_singo_seq').val(),
			report_content: report_content,
		},
		success: function(data) {
			console.log(report_content);
			if (data != null) {
				alert("?????????????????????.");
				sendReport();
				location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq=" + user);
			} else {
				alert("??????!");
			}

		}, error: function(data) {
			console.log("??????" + data);
		}

	});
};

var user = $('#user_seq').val();
var post = $('#post_seq').val();
function textarea1() {
	var chk = confirm('?????????????????????????');
	var text = document.getElementById("reportText1");
	console.log("1");
	if (!chk) {
		alert('?????????????????????.');
		location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq=" + user);
		return false;
	}
	$.ajax({
		url: "/myweb/report.do",
		type: 'post',
		data: {
			user_seq: $('#user_seq').val(),
			post_seq: $('#post_seq').val(),
			user_singo_seq: $('#user_singo_seq').val(),
			report_content: text.value,
		},
		success: function(data) {
			console.log(text.value);
			alert(data);
			if (data != null) {
				alert("?????????????????????.");
				sendReport();
				location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq=" + user);
			} else {
				alert("??????!");
			}

		}, error: function(data) {
			console.log("??????" + data);
		}

	});
};

function textarea2() {
	var chk = confirm('?????????????????????????');
	var text = document.getElementById("reportText2");
	if (!chk) {
		alert('?????????????????????.');
		location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq=" + user);
		return false;
	}
	$.ajax({
		url: "/myweb/report.do",
		type: 'post',
		data: {
			user_seq: $('#user_seq').val(),
			post_seq: $('#post_seq').val(),
			user_singo_seq: $('#user_singo_seq').val(),
			report_content: text.value,
		},
		success: function(data) {
			console.log(text.value);
			alert(data);
			if (data != null) {
				alert("?????????????????????.");
				sendReport();
				location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq=" + user);
			} else {
				alert("??????!");
			}

		}, error: function(data) {
			console.log("??????" + data);
		}

	});
};


function sendReport(){
   		console.log("report");
   		var cmd = 'report';
		$.ajax({
			url: '/myweb/sendReport.do',
			type: 'post',
			data: { 
				'cmd': cmd
			},
			success: function(data) {
				if(sock){
					sock.send(data);
				}
			},
			error: function (e) {
		      	console.log(e.responseText);
			}
		});
   	}
