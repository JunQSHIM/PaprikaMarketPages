//칭찬매너
// 1. 해당 name과 동일한 모든 체크박스 루프 > 체크된 체크박스만 해당 value 값 콘솔
$("input[name='manner_compliment']").each(function() {
	if ($(this).is(":checked") == true) {
		var tmpVal = $(this).val();
		console.log(tmpVal);
	}
});

// 2. 해당 name과 동일한 체크박스 중 선택한 것들만 루프 > 해당 value 값 콘솔
$("input[name='manner_compliment']:checked").each(function() {
	var tmpVal = $(this).val();
	console.log(tmpVal);
});
$(document).ready(function() {
	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})
});

//비매너
// 1. 해당 name과 동일한 모든 체크박스 루프 > 체크된 체크박스만 해당 value 값 콘솔
$("input[name='bad_manner']").each(function() {
	if ($(this).is(":checked") == true) {
		var tmpVal = $(this).val();
		console.log(tmpVal);
	}
});

// 2. 해당 name과 동일한 체크박스 중 선택한 것들만 루프 > 해당 value 값 콘솔
$("input[name='bad_manner']:checked").each(function() {
	var tmpVal = $(this).val();
	console.log(tmpVal);
});
$(document).ready(function() {
	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})
});

//매너평가 체크박스 자바스크립트
function mannerArr() {
	var mannerArr = []; // 배열 초기화   
	var manner_eval;
	$("input[name='manner_compliment']:checked").each(function(i) {
		mannerArr.push($(this).val());
		console.log(mannerArr);
		// 체크된 것만 값을 뽑아서 배열에 push   
		manner_eval = mannerArr;
		$.ajax({
			url: '/myweb/evaluation.do',
			type: 'post',
			data: {
				manner_eval: manner_eval
			},
			success: function(data) {
				if (data != null) {
					location.href = "/myweb/main.do";

				}
			}
		})
	});
}

//비매너평가 체크박스 자바스크립트
function badArr() {
	var badArr = []; // 배열 초기화   
	var bad_manner;
	$("input[name='bad_manner']:checked").each(function(i) {
		badArr.push($(this).val());
		console.log(badArr);
		// 체크된 것만 값을 뽑아서 배열에 push   
		bad_manner = badArr;
		$.ajax({
			url: '/myweb/evaluation.do',
			type: 'post',
			data: {
				bad_manner: bad_manner
			},
			success: function(data) {
				if (data != null) {
					location.href = "/myweb/main.do";
				}
			}
		})
	});
}

//별점 체크박스 자바스크립트
function tempArr() {
	var tempArr = []; // 배열 초기화   
	var manner_temp;
	$("input[name='manner_temp']:checked").each(function(i) {
		tempArr.push($(this).val());
		console.log(tempArr);
		// 체크된 것만 값을 뽑아서 배열에 push   
		bad_manner = tempArr;
		$.ajax({
			url: '/myweb/evaluation.do',
			type: 'post',
			data: {
				manner_temp: manner_temp
			},
			success: function(data) {
				if (data != null) {
				}
			}
		})
	});
}

function review() {
	var chk = confirm('평가를 완료하시겠습니까?');
	var text = document.getElementById("review");
	if (!chk) {
		alert('취소되었습니다.');
		location.replace("/myweb/main.do");
		return false;
	}
	$.ajax({
<<<<<<< HEAD
		url: "/myweb/evaluation.do",
		type: 'post',
		data: {
			user_seq: $('#user_seq').val(),
			post_seq: $('#post_seq').val(),
			user_singo_seq: $('#sell_user_seq').val(),
			review: text.value,
=======
		url : "/myweb/evaluation.do",
		type : 'post',
		data : {
			user_seq : $('#user_seq').val(),
			post_seq : $('#post_seq').val(),
			sell_user_seq : $('#sell_user_seq').val(),
			review : text.value,
>>>>>>> 88a8bc6bbc3b7577a898b22b38b5b4727fbee5e3
		},
		success: function(data) {
			console.log(text.value);
			if (data != null) {
				alert("평가가 완료 되었습니다.");
				moveM();
			} else {
				alert("에러!");
			}
		},
		error: function(data) {
			console.log("에러" + data);
		}

	});
};

function noreview() {
	var chk = confirm("매너 평가를 하지 않으시겠습니까?");
	if (!chk) {
		location.href = "/myweb/main.do";
		return false;
	} else {
		location.href = "/myweb/main.do";
	}

}

// 매너평가 유효성 검사
$(document).ready(function() {
	$("form").on("submit", function() {
		if (purchase.manner_temp.value == "") {
			alert("매너 온도를 평가해주세요.");
			return false;
		}
		if (!$("input:checked[name='manner_compliment']").is(":checked")) {
			alert("하나 이상의 매너 칭찬해주세요.");
			return false;
		}
		if (!$("input:checked[name='bad_manner']").is(":checked")) {
			alert("하나 이상의 비매너를 평가해주세요.");
			return false;
		}
		else {
			var chk = confirm("매너 평가를 완료하셨습니까?");
			if (!chk) {
				moveM();
				moveM();
				return false;
			} else {
				alert("매너평가를 완료하였습니다.")
				moveM();
			}
			return true;
		}
	});
	
});
function moveM(){
	location.href="/myweb/main.do";
}

//function review1() {
//	var chk = confirm("매너 평가를 완료하셨습니까?");
//	var user_seq = $("#user_seq").val();
//	if (!chk) {
//		location.href = ("evaluationView.do?user_seq=" + user_seq);
//		return false;
//	} else {
//		alert("매너평가를 완료하였습니다.")
//		location.href = "redirect:main.do";
//	}
//}