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

	function ctProduct() {
		theForm.submit();
	}
	$(document).ready(function() {
		$("#showCategory").mouseenter(function() {
			$("#result1").show();
		});
		$("#category").mouseleave(function() {
			$("#result1").hide();
		});
		// TOP 버튼 누르면 페이지 맨 위로 가는 스크립트
		$(".top").click(function() {
			//$('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
		});
	});

	// 슬라이드 배너 ==> 이동시키는 버튼이 있으면 카테고리에 마우스 올렸을때
	// 그 버튼만 보여서 버튼을 없애고 오토 슬라이드로 변경했습니다(준규)
	// 버튼가리는거를 찾아보다가 못찾았어여...
	$(document).ready(function() {
		$('.slider').bxSlider({
			controls : false,
			auto : true,
			mode : 'horizontal',
		});
	});

	//chat
	$(function(){
		$(".ui-dialog").dialog({
			autoOpen : false,
			height : 450,
			width : 400,
			position : {
				my : "center center",
				at : "right buttom",
				of : window
			},
			show : {
				effect : "slide",
				duration : 1000
			},
			hide : {
				effect : "slide",
				duration : 1000
			}
		});
		$(".chat").on("click", function() {
			$("#chatting").dialog("open");
		});
	});
	
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
	
	function login() {
		window.location.href = 'login.jsp';
	}
	function register() {
		window.location.href = 'registerAgree.jsp';
	}
	function main() {
		window.location.href = 'main.jsp';
	}
	function mypage() {
		window.location.href = 'mypage.jsp';
	}
	function sell() {
		window.location.href = 'sellpage.jsp';
	}