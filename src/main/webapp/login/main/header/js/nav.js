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
}); //네비바 상단고정

function post_check(){ 
	
   // var uid = sessionStorage.getItem("us//er");
   // console.log(uid);

   //  if(uid == null){ 
   //     alert("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
    // }
}   
