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
	window.location.href = '/myweb/login/login&register/login.jsp';
}
function register() {
	window.location.href = '/myweb/login/login&register/registerAgree.jsp';
}
function main() {
	window.location.href = '/myweb/login/main/mother.jsp';
}
function mypage() {
	window.location.href = '/myweb/login/mypage/mypage.jsp';
}
function sell() {
	window.location.href = '/myweb/login/sellpage.jsp';
}