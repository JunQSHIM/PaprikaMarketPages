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

// TOP 버튼 누르면 페이지 맨 위로 가는 스크립트
$(".top").click(function() {
	//$('html, body').animate({scrollTop:0}, '1000');
	$('html, body').scrollTop(0);
});

// TOP 버튼 누르면 페이지 맨 위로 가는 스크립트
$(".top").click(function() {
	//$('html, body').animate({scrollTop:0}, '1000');
	$('html, body').scrollTop(0);
});

function login() {
	window.location.href = '/testWeb/paprika/pages/login.jsp';
}
function register() {
	window.location.href = 'registerAgree.jsp';
}
function main() {
	window.location.href = '/testWeb/paprika/main/main.jsp';
}
function mypage() {
	window.location.href = 'mypage.jsp';
}
function sell() {
	window.location.href = 'sellpage.jsp';
}