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
		var page = $(this).find(".page").text();
		var content = $(this).find(".content").text();
		
		$("#singo_id").text(singoId);
		$("#suspect_id").text(suspectId);
		$("#singo_page").text(page);
		$("#singo_content").text(content);
		
		if(isNaN(page)){
			console.log("1");
			$(".btns").toggleClass("hide");
		}
	});
	
	$("#home").hover(function(){
		$(this).css({"color": "#ff8955", "font-weight":"bold"});
	});
	$("#home").mouseleave(function(){
		$(this).css({"color": "black", "font-weight":"normal"});
	});
	
	$(function() {
		$('#example1').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : false,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false,
			"responsive" : true,
		});
	});
	
});
