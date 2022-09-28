
//글자수가 넘어서면 메시지를 뿌리고 최대 문자수만큼 글자를 자른다

function chkMsgLength(intMax, objMsg, st) {
	var length = lengthMsg(objMsg.value);
	st.innerHTML = length;// 현재 byte수를 넣는다
	if (length > intMax) {
		alert("최대 " + intMax + "byte이므로 초과된 글자수는 자동으로 삭제됩니다.\n");
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
	st.innerHTML = nbytes; // 현재 byte수를 넣는다
	return msg;
}

// 폼 유효성 검사
$(document).ready(function() {
	// 문자열 검사를 시작합니다
	$("#submit").on("click", function() {

		if (board.title.value == "") {
			board.title.focus();
			alert("제목을 입력하세요.");
			return false;
		}
		if (board.content.value == "") {
			board.content.focus();
			alert("내용을 입력 하세요.");
			return false;
		} if (board.file.value == "") {
			alert("이미지를 선택하세요.");
			return false;
		}
		else {
			document.getElementById('board_form').submit()
			return true;
		}

	});
});

//이미지만 넣을 수 있게
function fileCheck(obj) {
	pathpoint = obj.value.lastIndexOf('.');
	filepoint = obj.value.substring(pathpoint + 1, obj.length);
	filetype = filepoint.toLowerCase();
	if (filetype == 'jpg' || filetype == 'jpeg' || filetype == 'png'
			|| filetype == 'bmp') {

	} else {
		alert('이미지 파일만 선택할 수 있습니다.')
		parentObj = obj.parentNode
		node = parentObj.replaceChild(obj.cloneNode(true), obj);
		return false;
	}
	if (filetype == 'bmp') {
		upload = confirm('bmp 파일은 웹상에서 사용하기엔 적절한 포맷이 아닙니다.\n 그래도 계속 하시겠습니까?');
		if (!upload)
			return false;
	}
}