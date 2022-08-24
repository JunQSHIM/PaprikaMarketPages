$(document).ready(function(){
		
		// 체크박스 선택 자바스크립트
		$(document).ready(function(){
			//전체 체크 클릭 시, 나머지 체크 
			$("#adminAllBtn").click(function(){
			var order2Chk=$("#adminAllBtn").prop("checked");

			    if(order2Chk){
			        $(".adminArticleBtn").prop("checked",true);
			        $("#deleteBtn").css({"backgroundColor":"#ff8955","cursor":"pointer","color":"#fff"}).prop("disabled",false);
			    }
			    else{
			        $(".adminArticleBtn").prop("checked",false);
			        $("#deleteBtn").css({"backgroundColor":"white","cursor":"auto","color":"rgb(136, 136, 136)"}).prop("disabled",true);
			    }
			});
			// 모든 체크박스를 클릭하면 버튼 활성화시키기
			$('.adminArticleBtn').click(function(){
			    var tmpp = $(this).prop('checked'); 
			    
			    //자식 체크 전체 체크시, 부모 체크박스 체크 됨
			    var tt = $(".adminArticleBtn").length;
			    var ss = $(".adminArticleBtn:checked").length;
			    
			    //선택한 체크박스 값이 true 이거나 체크박스 1개 이상 체크시 버튼 활성화시키기
			    if(tmpp==true || ss>0){
			    $("#deleteBtn").css({"backgroundColor":"#ff8955","cursor":"pointer","color":"#fff"}).prop("disabled",false);
			    }
			    else{
			    $("#deleteBtn").css({"backgroundColor":"white","cursor":"auto","color":"rgb(136, 136, 136)"}).prop("disabled",true);
			    	
			    }
			   
			    // 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
			    if(tt == ss){
			    	$("#adminAllBtn").css({"backgroundColor":"#ff8955","cursor":"pointer","color":"#fff"}).prop("checked",true);
			    }else{
			    	$("#adminAllBtn").css({"backgroundColor":"white","cursor":"auto","color":"rgb(136, 136, 136)"}).prop("checked",false);
			    	
			    }
			    
				});
			}); // 체크박스 제이쿼리
		
	});