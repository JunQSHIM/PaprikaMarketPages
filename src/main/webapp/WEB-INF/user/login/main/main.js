/**
 * 
 */
//네비바 상단고정
$(document).ready(function() {
	var jbOffset = $('.nav').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > jbOffset.top) {
			$('.nav').addClass('jbFixed');
		} else {
			$('.nav').removeClass('jbFixed');
		}
	});
});
function login() {
	window.location.href = 'login.do';
}
function register() {
	window.location.href = 'insert.do';
}
function logout() {
	window.location.href = 'logout.do';
}
function main() {
	window.location.href = 'main.do';
}
function mypage() {
	window.location.href = 'mypage.do';
}
function sell() {
	window.location.href = '/myweb/login/sellpage.jsp';
}