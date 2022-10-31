function fregister_submit(f) {
	if (!f.agree.checked) {
		alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
		f.agree.focus();
		return false;
	}

	if (!f.agree2.checked) {
		alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
		f.agree2.focus();
		return false;
	}
	return true;
}
//체크박스 선택 자바스크립트
$(document).ready(function(){
	//전체 체크 클릭 시, 나머지 체크 
	$("#chk_all").click(function(){
	var order2Chk=$("#chk_all").prop("checked");

	    if(order2Chk){
	        $(".agreeBtn").prop("checked",true);
	    }
	    else{
	        $(".agreeBtn").prop("checked",false);
	    }
	});
	// 모든 체크박스를 클릭하면 버튼 활성화시키기
	$('.agreeBtn').click(function(){
	    var tmpp = $(this).prop('checked'); 
	    
	    //자식 체크 전체 체크시, 부모 체크박스 체크 됨
	    var tt = $(".agreeBtn").length;
	    var ss = $(".agreeBtn:checked").length;
	   
	    // 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
	    if(tt == ss){
	    	$("#chk_all").css({"backgroundColor":"#ff8955","cursor":"pointer","color":"#fff"}).prop("checked",true);
	    }else{
	    	$("#chk_all").css({"backgroundColor":"white","cursor":"auto","color":"rgb(136, 136, 136)"}).prop("checked",false);
	    	
	    }
	    
		});
	}); // 체크박스 제이쿼리
