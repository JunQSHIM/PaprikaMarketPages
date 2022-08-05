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





$(document).ready(function() {
	$("#showCategory").mouseenter(function() {
		$("#result1").show();
	});
	$("#category").mouseleave(function() {
		$("#result1").hide();
	});

	$("#top").click(function() {
		//$('html, body').animate({scrollTop:0}, '1000');
		$('html, body').scrollTop(0);
	});

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



// TOP 버튼 누르면 페이지 맨 위로 가는 스크립트
$(".top").click(function() {
	//$('html, body').animate({scrollTop:0}, '1000');
	$('html, body').scrollTop(0);
});




// 슬라이드 배너
$(document).ready(function() {
	$('.slider').bxSlider({
		auto: true,
		mode: 'horizontal',
		minSlides: 1,
		maxSlides: 5,
		slideWidth: 155,
		slideMargin: 0,
		captions: true
	});
	$('.slider2').bxSlider({
		auto: true,
		mode: 'horizontal',
		minSlides: 1,
		maxSlides: 2,
		slideWidth: 130,
		slideMargin: 5,
		captions: true
	});
});


function zoom() {
	$("#picture").style.width = "800px";
}
function zoom(url) {
	var image = document.getElementById("image");
	var source = image.src;
	window.open(source, 'new', 'width=800, height=600, scrollbars=yes');
}
$(function() {
	let num = 0;
	let imageName = ["check.png", "uncheck.png"];
	$("#jjim").click(function() {
		if (num == 1) {
			$("#status").attr("src", "images/" + imageName[num]);
			$("#status").fadeIn(1200);
			$("#status").fadeOut(2000);
			$("#jjim").html('찜');
			num = 0;
		} else {
			$("#status").attr("src", "images/" + imageName[num]);
			$("#status").fadeIn(1200);
			$("#status").fadeOut(2000);
			$("#jjim").html('♥찜');
			num++;
		}
	});
});


/** 결제 **/
// 결제 금액, 구매자의 이름, 이메일
const priceAmount = "100000";
const buyerMemberEmail = "uusin@gmail.com";
const buyerMemberName = "김유신(부산)";
// const form = document.getElementById("payment");

console.log(priceAmount);
console.log(buyerMemberName);
console.log(buyerMemberEmail);
const IMP = window.IMP;
IMP.init('imp62063820');

function requestPay() {
	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ // param
		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid: 'cart_' + new Date().getTime(),
		name: "자석펫",
		amount: priceAmount,
		buyer_email: buyerMemberEmail,
		buyer_name: buyerMemberName,

	}, function(rsp) { // callback

		/** 결제 검증 **/
		$.ajax({
			type: 'POST',
			url: '/verifyIamport/' + rsp.imp_uid,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			}
		}).done(
			function(result) {
				// rsp.paid_amount와 result.response.amount(서버 검증) 비교 후 로직 실행
				if (rsp.paid_amount === result.response.amount) {
					alert("결제가 완료되었습니다.");
					$.ajax({
						type: 'POST',
						url: '/lecture/payment',
						beforeSend: function(xhr) {
							xhr.setRequestHeader(header, token);
						}
					}).done(function() {
						window.location.reload();
					}).fail(function(error) {
						alert(JSON.stringify(error));
					})
				} else {
					alert("결제에 실패했습니다." + "에러코드 : " + rsp.error_code
						+ "에러 메시지 : " + rsp.error_message);

				}
			})
	});
};
















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

function toMannerEval() {
	window.location.href = 'mannerEval.jsp';
}
function toMyReview() {
	window.location.href = 'myReview.jsp';
}
function toProfileEdit() {
	window.location.href = 'profileEdit.jsp';
}
function ctProduct() {
	theForm.submit();
}
function upload() {
	let myPic = document.getElementById("my_pic");
	myPic.click();
}
















//mannerEval

$(document).ready(function() {
	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})
})


//mypage
$(function() {
	$("#innerTempBar").css({
		"width": "30%"
	});
});







//profileEdit

function setThumbnail(event) {
	var reader = new FileReader();
	console.log('hi');
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("height", '100%');

		if (document.getElementById("profile_pic").childNodes.length != 0) {
			removeAllchild(document.getElementById("profile_pic"));
		}
		document.getElementById("profile_pic").appendChild(img).setAttribute('width', '100%');
	};

	reader.readAsDataURL(event.target.files[0]);
}

function removeAllchild(div) {
	while (div.hasChildNodes()) {
		div.removeChild(div.firstChild);
	}
}





