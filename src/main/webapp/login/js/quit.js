		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/myweb/mypage.do";
			})
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userPass2").val()==""){
					alert("비밀번호 확인을 입력해주세요.");
					$("#userPass2").focus();
					return false;
				}
				if ($("#userPass").val() != $("#userPass2").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPass").focus();
					 
					return false;
					}
			});
			
		})
// 탈퇴사유 라디오버튼 자바스크립트
	function Arr() {   
		var radioArr = [];     // 배열 초기화   
		var withdrawal_content;
		$("input[name='withdrawal_content']:checked").each(function(i){     
			var chk = confirm("탈퇴하시겠습니까?")
			if(!chk){
				alert('취소하였습니다.')
				return false;
			}
			radioArr.push($(this).val());  
			
			console.log(radioArr);
			// 체크된 것만 값을 뽑아서 배열에 push   
			
			withdrawal_content = radioArr;
			 $.ajax({    
				url: '/myweb/reason.do',
				type: 'post',
				data: {
					withdrawal_content : withdrawal_content
					},
				success : function(data) {
					console.log('dd');
					if(data == 1){
						alert("이용해주셔서 감사합니다.");
					}
				}
			})
			});
			}