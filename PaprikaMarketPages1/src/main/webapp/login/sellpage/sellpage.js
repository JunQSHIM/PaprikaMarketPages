/**
 * 
 */
$(document).ready(function() {
	$("#sell-list").hide();
	$("#sell-control").hide();
	$("#submit").css('border-bottom', '3px solid #ff8955');

});

function removeCheck() {

	if (confirm("정말 삭제하시겠습니까??") == true) { //확인

		document.removefrm.submit();

	} else { //취소

		return false;
	}
}

//sellpage
$(function() {
	$("#submit").click(function() {
		$("#sell-submit").show();
		$("#sell-list").hide();
		$("#sell-control").hide();
		$(this).css('border-bottom', '3px solid #ff8955');
		$("#control").css('border-bottom', 'none');
		$("#list").css('border-bottom', 'none');
	});
	$("#control").click(function() {
		$("#sell-submit").hide();
		$("#sell-list").hide();
		$("#sell-control").show();
		$(this).css('border-bottom', '3px solid #ff8955');
		$("#submit").css('border-bottom', 'none');
		$("#list").css('border-bottom', 'none');
	});
	$("#list").click(function() {
		$("#sell-submit").hide();
		$("#sell-control").hide();
		$("#sell-list").show();
		$(this).css('border-bottom', '3px solid #ff8955');
		$("#control").css('border-bottom', 'none');
		$("#submit").css('border-bottom', 'none');
	});

});