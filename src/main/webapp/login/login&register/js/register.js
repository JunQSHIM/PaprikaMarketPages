function setOutline(objFormElement, color) {
	if (objFormElement.style)
		objFormElement.style.outline = color;
}
function formReset() {
	var theForm = document.register;
	document.getElementById('result').innerHTML = '';
	document.getElementById('result2').innerHTML = '';
	document.getElementById('result3').innerHTML = '';
	document.getElementById('result4').innerHTML = '';
	setOutline(theForm.id, "1px solid black");
	setOutline(theForm.name, "1px solid black");
	setOutline(theForm.password, "1px solid black");
	setOutline(theForm.repassword, "1px solid black");
	setOutline(theForm.nickname, "1px solid black");
	setOutline(theForm.phone, "1px solid black");
	setOutline(theForm.email, "1px solid black");
	setOutline(theForm.phone, "1px solid black");
	document.getElementById('result5').innerHTML = '';
}
function checkId() {
	var theForm = document.register;
	var id = theForm.id.value.trim(); //id값이 "id"인 입력란의 값을 저장
	$.ajax({
				url : '/myweb/idCheck.do', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					id : id
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					const target = document.getElementById('registerButton');
					if (cnt == 1) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
						document.getElementById('result3').innerHTML = '<font color="green">사용가능한 아이디 입니다.</font>';
						setOutline(theForm.id, "2px solid green");
						target.disabled = false;
					} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
						document.getElementById('result3').innerHTML = '<font color="red">중복된 아이디 입니다.</font>';
						setOutline(theForm.id, "2px solid red");
						theForm.id.focus();
						target.disabled = true;
					}
				},
			});
}
var emailCheck = false;
function checkEmail() {
	var theForm = document.register;
	var email = theForm.email.value.trim(); 
	$.ajax({
				url : '/myweb/emailCheck.do', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					email : email
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					const target = document.getElementById('registerButton');
					if (cnt == 0 && emailCheck == true){ 
						if(email != ""){
							document.getElementById('result6').innerHTML = '<font color="green">사용가능한 이메일입니다.</font>';
							setOutline(theForm.email, "2px solid green");
							target.disabled = false;
						}
					} else if(cnt !=0){ // cnt가 0일 경우 -> 이미 존재하는 아이디
						if(email != ""){
							document.getElementById('result6').innerHTML = '<font color="red">중복된 이메일입니다.</font>';
							setOutline(theForm.email, "2px solid red");
							theForm.email.focus();
							target.disabled = true;
						}
					} else if(email == ""){
						document.getElementById('result6').innerHTML = '<font color="red"></font>';
						setOutline(theForm.email, "2px solid red");
						theForm.email.focus();
						target.disabled = true;
					}
				},
			});
}
function checkNickname() {
	var theForm = document.register;
	var nickname1 = theForm.nickname.value; 
	var nickname = nickname1.trim();
	$.ajax({
				url : '/myweb/nicknameCheck.do', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					nickname : nickname
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					const target = document.getElementById('registerButton');
					if (cnt == 0){ 
							document.getElementById('result7').innerHTML = '<font color="green">사용가능한 닉네입니다.</font>';
							setOutline(theForm.nickname, "2px solid green");
							target.disabled = false;
					} else{ // cnt가 0일 경우 -> 이미 존재하는 아이디
							document.getElementById('result7').innerHTML = '<font color="red">중복된 닉네임입니다.</font>';
							setOutline(theForm.nickname, "2px solid red");
							theForm.nickname.focus();
							target.disabled = true;
					} 
				},
			});
}
function checkPhone() {
	var theForm = document.register;
	var phone = theForm.phone.value.trim(); 
	$.ajax({
				url : '/myweb/phoneCheck.do', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					phone : phone
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					const target = document.getElementById('registerButton');
					if (cnt == 0){ 
							document.getElementById('result8').innerHTML = '<font color="green"></font>';
							setOutline(theForm.phone, "2px solid green");
							target.disabled = false;
					} else{ // cnt가 0일 경우 -> 이미 존재하는 아이디
							document.getElementById('result8').innerHTML = '<font color="red">중복된 전화번호입니다.</font>';
							setOutline(theForm.phone, "2px solid red");
							theForm.phone.focus();
							target.disabled = true;
					} 
				},
			});
}
$(document)
		.ready(
				function() {
					var theForm = document.register;
					const target = document
							.getElementById('registerButton');
					$("#passwordCheck")
							.keyup(
									function() {
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
					//이메일 유효성 검사
					$("#emailCheck")
							.keyup(
									function() {
										var email = theForm.email.value;
										var pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
										if (pattern.test(email) == false) {
											document.getElementById('result4').innerHTML = '<font color="red">올바른 이메일 형식이 아닙니다.</font>';
											emailCheck = false;
											theForm.email.focus();
											target.disabled = true;
										} else {
											document.getElementById('result4').innerHTML = '<font color="green"></font>';
											emailCheck = true;
											target.disabled = false;
										}
									});
					$("#phoneCheck")
							.keyup(
									function() {
										var phone = theForm.phone.value;
										var pattern = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
										if (pattern.test(phone) == false) {
											document
													.getElementById('result5').innerHTML = '<font color="red">올바른 전화번호 형식이 아닙니다.</font>';
											theForm.phone.focus();
											target.disabled = true;
										} else {
											setOutline(theForm.phone,
													"1px solid black");
											document
													.getElementById('result5').innerHTML = '';
											target.disabled = false;
										}
									});
					$("#registerButton")
							.click(
									function() {
										if (!theForm.id.value) {
											setOutline(theForm.id,
													"2px solid red");
											theForm.id.placeholder = '아이디를 입력해주세요';
											theForm.id.focus();
											return;
										} else {
											setOutline(theForm.id,
													"1px solid black");
										}
										if (!theForm.name.value) {
											setOutline(theForm.name,
													"2px solid red");
											theForm.name.placeholder = '이름을 입력해주세요';
											theForm.name.focus();
											return;
										} else {
											setOutline(theForm.nickname,
													"1px solid black");
										}
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
										if (!theForm.nickname.value) {
											setOutline(theForm.nickname,
													"2px solid red");
											theForm.nickname.placeholder = '닉네임을 입력해주세요';
											theForm.nickname.focus();
											return;
										} else {
											setOutline(theForm.nickname,
													"1px solid black");
										}

										if (!theForm.email.value) {
											setOutline(theForm.email,
													"2px solid red");
											theForm.email.placeholder = '이메일을 입력해주세요';
											theForm.email.focus();
											return;
										} else {
											setOutline(theForm.email,
													"1px solid black");
										}
										if (!theForm.phone.value) {
											setOutline(theForm.phone,
													"2px solid red");
											theForm.phone.placeholder = '전화번호를 입력해주세요';
											theForm.phone.focus();
											return;
										} else {
											setOutline(theForm.phone,
													"1px solid black");
										}
										theForm.submit();
									});

					$(document).ready(function() {
						setDateBox();
					});

					// select box 연도 , 월 표시
					function setDateBox() {
						var dt = new Date();
						var year = "";
						var com_year = dt.getFullYear();

						// 발행 뿌려주기
						$("#year").append("<option value=''>년도</option>");

						// 올해 기준으로 -50년부터 +1년을 보여준다.
						for (var y = (com_year - 50); y <= (com_year + 1); y++) {
							$("#year").append(
									"<option value='"+y+"'>" + y
											+ "</option>");
						}

						// 월 
						var month;
						$("#month").append("<option value=''>월</option>");

						for (var i = 1; i <= 12; i++) {
							$("#month").append(
									"<option value='"+i+"'>" + i
											+ "</option>");
						}
						// 일 
						var day;
						$("#day").append("<option value=''>일</option>");
						for (var i = 1; i <= 31; i++) {
							$("#day").append(
									"<option value='"+i+"'>" + i
											+ "</option>");
						}
					}
				});
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });