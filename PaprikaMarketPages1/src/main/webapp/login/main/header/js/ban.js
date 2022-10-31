
 // TOP 버튼 누르면 페이지 맨 위로 가는 스크립트
 $(document).ready(function() {
	$(".top").click(function() {
	$('html, body').scrollTop(0);
	});
});