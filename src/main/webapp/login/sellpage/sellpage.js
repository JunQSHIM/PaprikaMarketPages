/**
 * 
 */

//sellpage
$(function() {
	$("#submit").click(function() {
		$("#sell-submit").show();
		$("#sell-list").hide();
		$("#sell-control").hide();
	});
	$("#control").click(function() {
		$("#sell-submit").hide();
		$("#sell-list").hide();
		$("#sell-control").show();
	});
	$("#list").click(function() {
		$("#sell-submit").hide();
		$("#sell-control").hide();
		$("#sell-list").show();
	});

});