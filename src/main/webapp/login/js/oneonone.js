function textarea() {
	var chk = confirm('문의하시겠습니까?');
	var text = document.getElementById("reportText");
	if(!chk){
		alert('취소되었습니다.');
		location.replace("/myweb/main.do");
		return false;
	}
	$.ajax({
		url : "/myweb/oneOnOne.do",
		type : 'post',
		data :{
			user_seq : $('#user_seq').val(),
			content : text.value,
		},
		success : function(data){
			console.log(text.value);
			if(data != null){
				alert("문의 되었습니다.");
				location.replace("/myweb/main.do");
			} else {
				alert("에러!");
			}
			
		}, error : function(data){
			console.log("에러" + data);
		}
	});
};
