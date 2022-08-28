$(document).ready(function() {
	$("#showCategory").mouseenter(function() {
		$("#result1").show();
	});
	$("#categories").mouseleave(function() {
		$("#result1").hide();
	});

	$("#top").click(function() {
		//$('html, body').animate({scrollTop:0}, '1000');
		$('html, body').scrollTop(0);
	});

});