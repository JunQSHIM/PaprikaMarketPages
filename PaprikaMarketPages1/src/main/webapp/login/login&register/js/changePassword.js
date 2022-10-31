function setOutline(objFormElement, color) {
		if (objFormElement.style)
			objFormElement.style.outline = color;
	}
	function formReset() {
		var theForm = document.change;
		document.getElementById('result').innerHTML = '';
		setOutline(theForm.password, "1px solid black");
		setOutline(theForm.repassword, "1px solid black");
	}
	$(document).ready(function() {
		var theForm = document.change;
		const target = document.getElementById('changeButton');
		$("#passwordCheck").keyup(function() {
							var password = theForm.password.value;
							
							var repassword = theForm.repassword.value;
							if (repassword == password) {
								setOutline(theForm.repassword,
										"2px solid green");
								document
										.getElementById('result').innerHTML = '<font color="green">비밀번호가 일치합니다.</font>';
								target.disabled = false;
							} else if (!theForm.repassword.value
									|| repassword != password) {
								setOutline(theForm.repassword,
										"2px solid red");
								document
										.getElementById('result').innerHTML = '<font color="red">비밀번호가 일치하지 않습니다.</font>';
								theForm.repassword.focus();
								target.disabled = true;
							}
						});

		
		$("#changeButton").click(function() {

							if (!theForm.password.value) {
								setOutline(theForm.password,
										"2px solid red");
								theForm.password.placeholder = '비밀번호를 입력해주세요';
								theForm.password.focus();
								return;
							} else {
								setOutline(theForm.password,
										"1px solid black");
							}
							if (!theForm.repassword.value) {
								setOutline(theForm.repassword,
										"2px solid red");
								theForm.repassword.placeholder = '비밀번호를 확인해주세요';
								theForm.repassword.focus();
								return;
							} else {
								setOutline(theForm.repassword,
										"1px solid black");
							}
							
							theForm.submit();
						});
	});