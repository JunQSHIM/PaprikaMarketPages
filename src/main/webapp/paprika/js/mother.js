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
	// 체크박스 선택 자바스크립트
	$(document).ready(function() {
		//전체 체크 클릭 시, 나머지 체크 
		$("#jjim_delete_btn").click(function() {
			var order2Chk = $("#jjim_delete_btn").prop("checked");

			if (order2Chk) {
				$(".article_select1").prop("checked", true);
				$(".jjim_delete_1 button").css({
					"backgroundColor": "#ff8955",
					"cursor": "pointer",
					"color": "#fff"
				}).prop("disabled", false);
			} else {
				$(".article_select1").prop("checked", false);
				$(".jjim_delete_1 button").css({
					"backgroundColor": "white",
					"cursor": "auto",
					"color": "rgb(136, 136, 136)"
				}).prop("disabled", true);
			}
		});

		// 모든 체크박스를 클릭하면 버튼 활성화시키기
		$('.article_select1').click(function() {
			var tmpp = $(this).prop('checked');
			//자식 체크 전체 체크시, 부모 체크박스 체크 됨
			var tt = $(".article_select1").length;
			var ss = $(".article_select1:checked").length;

			//선택한 체크박스 값이 true 이거나 체크박스 1개 이상 체크시 버튼 활성화시키기
			if (tmpp == true || ss > 0) {
				$(".jjim_delete_1 button").prop("disabled", false);
			} else {
				$(".jjim_delete_1 button").prop("disabled", true);
			}

			// 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
			if (tt == ss) {
				$("#jjim_delete_btn").css({
					"backgroundColor": "#ff8955",
					"cursor": "pointer",
					"color": "#fff"
				}).prop("checked", true);
			} else {
				$("#jjim_delete_btn").css({
					"backgroundColor": "white",
					"cursor": "auto",
					"color": "rgb(136, 136, 136)"
				}).prop("checked", false);
			}

		});

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
		controls: false,
		auto: true,
		mode: 'horizontal',
	});
});

//chat
$(function() {
	$(".ui-dialog").dialog({
		autoOpen: false,
		height: 450,
		width: 400,
		position: {
			my: "center center",
			at: "right buttom",
			of: window
		},
		show: {
			effect: "slide",
			duration: 1000
		},
		hide: {
			effect: "slide",
			duration: 1000
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

function btn() {
	alert('삭제 되었습니다.');
}
function login() {
	window.location.href = 'login.jsp';
}
function register() {
	window.location.href = 'registerAgree.jsp';
}
function main() {
	window.location.href = 'mother.jsp';
}
function mypage() {
	window.location.href = 'mypage.jsp';
}
function sell() {
	window.location.href = 'sellpage.jsp';
}







