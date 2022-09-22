 $(document).ready(function(){
	$("#panel1").hide();
	$("#panel2").hide();
	$("#panel3").hide();
	$("#panel4").hide();
	$("#panel5").hide();
	$("#panel6").hide();
	  $("#btn1").click(function(){
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
		    if ($("#panel5")[0].style.display != "none") {
		        $("#panel5").slideToggle();
		    }
		    if ($("#panel6")[0].style.display != "none") {
		        $("#panel6").slideToggle();
		    }
		  });
		  $("#btn2").click(function(){
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
			    if ($("#panel5")[0].style.display != "none") {
			        $("#panel5").slideToggle();
			    }
			    if ($("#panel6")[0].style.display != "none") {
			        $("#panel6").slideToggle();
			    }
		  });
		  $("#btn3").click(function(){
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
			    if ($("#panel5")[0].style.display != "none") {
			        $("#panel5").slideToggle();
			    }
			    if ($("#panel6")[0].style.display != "none") {
			        $("#panel6").slideToggle();
			    }
		  });
		  
		  $("#btn4").click(function(){
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
			    if ($("#panel5")[0].style.display != "none") {
			        $("#panel5").slideToggle();
			    }
			    if ($("#panel6")[0].style.display != "none") {
			        $("#panel6").slideToggle();
			    }
		  });
		  $("#btn5").click(function(){
			    $("#panel5").slideToggle("slow");
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
			    if ($("#panel6")[0].style.display != "none") {
			        $("#panel6").slideToggle();
			    }
		  });
		  $("#btn6").click(function(){
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
			    if ($("#panel5")[0].style.display != "none") {
			        $("#panel5").slideToggle();
			    }
			    if ($("#panel3")[0].style.display != "none") {
			        $("#panel3").slideToggle();
			    }
		  });
	});

//신고하기 내용 보내기
$(".report_content").click(function(){
	var report_content = $(this).val();
	report(report_content);
});

function report(report_content) {
	var chk = confirm('신고하시겠습니까?');
	var user = $('#user_seq').val();
	var post = $('#post_seq').val();
	if(!chk){
		alert('취소되었습니다.');
		location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq="+ user);
		return false;
	}
	$.ajax({
		url : "/myweb/report.do",
		type : 'post',
		data :{
			user_seq : $('#user_seq').val(),
			post_seq : $('#post_seq').val(),
			user_singo_seq : $('#user_singo_seq').val(),
			report_content : report_content,
		},
		success : function(data){
			console.log(report_content);
			if(data != null){
				alert("신고되었습니다.");
				location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq="+ user);
			} else {
				alert("에러!");
			}
			
		}, error : function(data){
			console.log("에러" + data);
		}
		
	});
};

function textarea() {
	var chk = confirm('신고하시겠습니까?');
	var user = $('#user_seq').val();
	var post = $('#post_seq').val();
	var text = document.getElementById("reportText");
	console.log(text.value);
	console.log(post);
	if(!chk){
		alert('취소되었습니다.');
		location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq="+ user);
		return false;
	}
	$.ajax({
		url : "/myweb/report.do",
		type : 'post',
		data :{
			user_seq : $('#user_seq').val(),
			post_seq : $('#post_seq').val(),
			user_singo_seq : $('#user_singo_seq').val(),
			report_content : text.value,
		},
		success : function(data){
			console.log(text.value);
			if(data != null){
				alert("신고되었습니다.");
				location.replace("/myweb/postDetail.do?post_seq=" + post + "&user_seq="+ user);
			} else {
				alert("에러!");
			}
			
		}, error : function(data){
			console.log("에러" + data);
		}
		
	});
};



