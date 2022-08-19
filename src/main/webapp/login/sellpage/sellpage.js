/**
 * 
 */
 
 //sellpage
$(function() {
	$("#control").click(function() {
		$("#sell-list").hide();
		$("#sell-control").show();
	});
	$("#list").click(function() {
		$("#sell-control").hide();
		$("#sell-list").show();
	});

});