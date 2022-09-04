$(document).ready(function(){
	$("#singo_card").hide();
	$("#tree").hide();
});

$(function(){
	$("#home").click(function(){
		$("#singo_card").hide();
		$("#singo_list").show();
		$("#tree").hide();
	});
	
	$(".singo_btn").click(function(){
		$("#singo_list").hide();
		$("#singo_card").show();
		$("#tree").show();
		
		var suspectId = $(this).children(".suspect_id").text();
		var singoId = $(this).children(".singo_id").text();
		
		$("#singo_id").text(singoId);
		$("#suspect_id").text(suspectId);
		
	});
	
	$("#home").hover(function(){
		$(this).css({"color": "#ff8955", "font-weight":"bold"});
	});
	$("#home").mouseleave(function(){
		$(this).css({"color": "black", "font-weight":"normal"});
	});
	
});
