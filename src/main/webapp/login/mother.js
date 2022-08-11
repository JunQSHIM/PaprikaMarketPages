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
		window.location.href = 'mother.jsp';
	}
	function mypage() {
		window.location.href = 'mypage.jsp';
	}
	function sell() {
		window.location.href = 'sellpage.jsp';

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
	}
}

//  intMax : 최대 글자수, objMsg : textarea name {Object} st : 글자수뿌릴곳
function chkMsgLength(intMax, objMsg, st) {
	var length = lengthMsg(objMsg.value);
	st.innerHTML = length;//현재 byte수를 넣는다
	if (length > intMax) {
		alert("현재 " + length + " 로  최대 글자수" + intMax
			+ "자 입니다.\n최대 글자수를 넘어선 내용은 삭제됩니다.\n");
		objMsg.value = objMsg.value.replace(/\r\n$/, "");
		objMsg.value = assertMsg(intMax, objMsg.value, st);
	}
}
function lengthMsg(objMsg) {
	var nbytes = 0;
	for (i = 0; i < objMsg.length; i++) {
		var ch = objMsg.charAt(i);
		if (escape(ch).length > 4) {
			nbytes += 2;
		} else if (ch == '\n') {
			if (objMsg.charAt(i - 1) != '\r') {
				nbytes += 1;
			}
		} else if (ch == '<' || ch == '>') {
			nbytes += 4;
		} else {
			nbytes += 1;
		}
	}
	return nbytes;
}
function assertMsg(intMax, objMsg, st) {
	var inc = 0;
	var nbytes = 0;
	var msg = "";
	var msglen = objMsg.length;
	for (i = 0; i < msglen; i++) {
		var ch = objMsg.charAt(i);
		if (escape(ch).length > 4) {
			inc = 2;
		} else if (ch == '\n') {
			if (objMsg.charAt(i - 1) != '\r') {
				inc = 1;
			}
		} else if (ch == '<' || ch == '>') {
			inc = 4;
		} else {
			inc = 1;
		} 
		if ((nbytes + inc) > intMax) {
			break;
		}
		nbytes += inc;
		msg += ch;
	}
	st.innerHTML = nbytes; //현재 byte수를 넣는다
	return msg;
}
