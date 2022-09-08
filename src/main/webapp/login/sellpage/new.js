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

// 사진 업로드
jQuery(document)
		.ready(
				function() {

					var storedFiles = [];
					// $('.cvf_order').hide();

					// Apply sort function
					function cvf_reload_order() {
						var order = $('.cvf_uploaded_files').sortable(
								'toArray', {
									attribute : 'item'
								});
						$('.cvf_hidden_field').val(order);
					}

					function cvf_add_order() {
						$('.cvf_uploaded_files li').each(function(n) {
							$(this).attr('item', n);
						});
						console.log('test');
					}

					$(function() {
						$('.cvf_uploaded_files').sortable({
							cursor : 'move',
							placeholder : 'highlight',
							start : function(event, ui) {
								ui.item.toggleClass('highlight');
							},
							stop : function(event, ui) {
								ui.item.toggleClass('highlight');
							},
							update : function() {
								// cvf_reload_order();
							},
							create : function() {
								var list = this;
								resize = function() {
									$(list).css('height', 'auto');
									$(list).height($(list).height());
								};
								$(list).height($(list).height());
								$(list).find('img').load(resize).error(resize);
							}
						});
						$('.cvf_uploaded_files').disableSelection();
					});

					$('body')
							.on(
									'change',
									'.user_picked_files',
									function() {

										var files = this.files;
										var i = 0;

										for (i = 0; i < files.length; i++) {
											var readImg = new FileReader();
											var file = files[i];

											if (file.type.match('image.*')) {
												storedFiles.push(file);
												readImg.onload = (function(file) {
													return function(e) {
														$('.cvf_uploaded_files')
																.append(
																		"<li file = '"
																				+ file.name
																				+ "'>"
																				+ "<img class = 'img-thumb' src = '"
																				+ e.target.result
																				+ "' />"
																				+ "<a href = '#' class = 'cvf_delete_image' title = 'Cancel'><img class = 'delete-btn' src = '/myweb/login/images/delete-btn.png' /></a>"
																				+ "</li>");
													};
												})(file);
												readImg.readAsDataURL(file);

											} else {
												alert('the file '
														+ file.name
														+ ' is not an image<br/>');
											}

											if (files.length === (i + 1)) {
												setTimeout(function() {
													cvf_add_order();
												}, 1000);
											}
										}
									});

					// Delete Image from Queue
					$('body').on('click', 'a.cvf_delete_image', function(e) {
						e.preventDefault();
						$(this).parent().remove('');

						var file = $(this).parent().attr('file');
						for (var i = 0; i < storedFiles.length; i++) {
							if (storedFiles[i].name == file) {
								storedFiles.splice(i, 1);
								break;
							}
						}

						// cvf_reload_order();

					});

					// AJAX Upload
					$('body').on('click', '.cvf_upload_btn', function(e) {

						e.preventDefault();
						cvf_reload_order();

						// $(".cvf_uploaded_files").html('<p><img src =
						// "loading.gif" class = "loader" /></p>');
						var data = new FormData();

						var items_array = $('.cvf_hidden_field').val();
						var items = items_array.split(',');
						for ( var i in items) {
							var item_number = items[i];
							data.append('files' + i, storedFiles[item_number]);
						}

						$.ajax({
							url : 'upload.php',
							type : 'POST',
							contentType : false,
							data : data,
							processData : false,
							cache : false,
							success : function(response, textStatus, jqXHR) {
								// $(".cvf_uploaded_files").html('');
								// bootbox.alert('<br /><p class =
								// "bg-success">File(s) uploaded
								// successfully.</p>');
								alert(jqXHR.responseText);
							}
						});

					});
				});

// 폼 유효성 검사
$(document).ready(function() {
	// 문자열 검사를 시작합니다
	$("form").on("submit", function() {

		if (post.origin_file_name.value == "") {
			post.origin_file_name.focus();
			alert("이미지를 선택하세요.");
			return false;
		}
		
		if (post.post_title.value == "") {
			alert("제목을 입력하세요.");
			post.post_title.focus();
			return false;
		}
		if ($("#selectbox").val() == "") {
			alert("카테고리를 입력하세요.");
			$("#selectbox").focus();
			return false;
		}
//		if (post.category_seq.value == "") {
//			post.category_seq.focus();
//			alert("카테고리를 선택하세요.");
//			return false;
//
//		}
		if (post.post_title.value.length < 2) {
			alert("제목을 2자 이상 입력하세요.");
			post.post_title.focus();
			return false;
		}
		

		if (post.price.value == "") {
			post.price.focus();
			alert("가격을 입력하세요.");
			return false; 
		}

		if (post.post_content.value == "") {
			post.post_content.focus();
			alert("내용을 입력하세요.");
			return false;
		} else {
			return true;
		}

	});
});

// 판매하기 제목 글자 수 제한
function titleChk() {
	var obj = document.post;
	if (obj.post_title.value.length < 2 || obj.post_title.value.length > 40) {
		document.getElementById("titlebox").style.borderColor = "red";
		document.getElementById("titleChk").innerHTML = ('<span style="color: red;">제목은 2자 이상 입력하세요.</span>');
		return;
	} else {
		document.getElementById("titlebox").style.borderColor = "#a7a7a7a7";
		document.getElementById("titleChk").innerHTML = ('<span></span>');
	}
}
// 숫자만 입력되게 하기
function chkNum() {
	if (!((event.keyCode >= 48 && event.keyCode <= 57)
			|| (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8)) {
		alert("숫자만 입력하세요.")
		event.returnValue = false;
	}
}

$("#price").on('input', function() {
	$(this).val($(this).val().replace(/[^0-9]/g, ""));
});

// 글자수 실시간 카운팅
$('#prod_title').keyup(function(e) {
	var content = $(this).val();
	$('#counter').html(content.length + " / 40");
});

function handleOnChange(e) {
	const value = $("#selectbox option:selected").text();

	document.getElementById("result_category").innerText = value;
}

// 이미지만 넣을 수 있게
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
		upload = confirm('bmp 파일은 웹상에서 사용하기엔 적절한 포맷이 아닙니다.\n 드래도 계속 하시겠습니까?');
		if (!upload)
			return false;
	}
}


