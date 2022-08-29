//앱키 바꿔줘야함
	Kakao.init('8890a67c089173194979845f9389950d'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
	//카카오로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
	function setOutline(objFormElement, color) {
		if (objFormElement.style)
			objFormElement.style.outline = color;
	}
	//아이디 비밀번호
	$(document).ready(function() {
		var theForm = document.login;
		$("#loginButton").click(function() {
			if (!theForm.id.value) {
				setOutline(theForm.id, "2px solid red");
				theForm.id.placeholder = '아이디를 입력해주세요';
				theForm.id.focus();
				return;
			}

			if (!theForm.password.value) {
				setOutline(theForm.password, "2px solid red");
				theForm.password.placeholder = '비밀번호를 입력해주세요';
				theForm.password.focus();
				if (theForm.id.value != "") {
					setOutline(theForm.id, "1px solid black");
				}
				return;
			}
			theForm.submit();
		});
	});