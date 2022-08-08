function ctProduct(){
	theForm.submit();
}
	$(document).ready(function(){
		$("#showCategory").mouseenter(function(){
			$("#result1").show();
		});
		$("#category").mouseleave(function(){
			$("#result1").hide();
		});
		
		// 체크박스 선택 자바스크립트
		$(document).ready(function(){
			//전체 체크 클릭 시, 나머지 체크 
			$("#jjim_delete_btn").click(function(){
			var order2Chk=$("#jjim_delete_btn").prop("checked");

			    if(order2Chk){
			        $(".article_select1").prop("checked",true);
			        $(".jjim_delete_1 button").css({"backgroundColor":"#ff8955","cursor":"pointer","color":"#fff"}).prop("disabled",false);
			    }
			    else{
			        $(".article_select1").prop("checked",false);
			        $(".jjim_delete_1 button").css({"backgroundColor":"white","cursor":"auto","color":"rgb(136, 136, 136)"}).prop("disabled",true);
			    }
			});
			// 모든 체크박스를 클릭하면 버튼 활성화시키기
			$('.article_select1').click(function(){
			    var tmpp = $(this).prop('checked'); 
			    
			    //자식 체크 전체 체크시, 부모 체크박스 체크 됨
			    var tt = $(".article_select1").length;
			    var ss = $(".article_select1:checked").length;
			    
			    //선택한 체크박스 값이 true 이거나 체크박스 1개 이상 체크시 버튼 활성화시키기
			    if(tmpp==true || ss>0){
			    $(".jjim_delete_1 button").css({"backgroundColor":"#ff8955","cursor":"pointer","color":"#fff"}).prop("disabled",false);
			    }
			    else{
			    $(".jjim_delete_1 button").css({"backgroundColor":"white","cursor":"auto","color":"rgb(136, 136, 136)"}).prop("disabled",true);
			    	
			    }
			   
			    // 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
			    if(tt == ss){
			    	$("#jjim_delete_btn").css({"backgroundColor":"#ff8955","cursor":"pointer","color":"#fff"}).prop("checked",true);
			    }else{
			    	$("#jjim_delete_btn").css({"backgroundColor":"white","cursor":"auto","color":"rgb(136, 136, 136)"}).prop("checked",false);
			    	
			    }
			    
				});
			}); // 체크박스 제이쿼리
		
		// TOP 버튼 누르면 페이지 맨 위로 가는 스크립트
		$(".top").click(function() {
			//$('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
		});
		
	});
	
	//chat
	$(function(){
		$(".ui-dialog").dialog({
			autoOpen : false,
			height : 450,
			width : 400,
			position : {
				my : "center center",
				at : "right buttom",
				of : window
			},
			show : {
				effect : "slide",
				duration : 1000
			},
			hide : {
				effect : "slide",
				duration : 1000
			}
		});
		$(".chat").on("click", function() {
			$("#chatting").dialog("open");
		});
	});
	
	
function login()  {
	 window.location.href ='login.jsp';
}	
function register()  {
	 window.location.href ='registerAgree.jsp';
}
function main(){
	window.location.href = 'main.jsp';
}
function mypage(){
	window.location.href = 'mypage.jsp';
}
function myProductCart()  {
	 window.location.href ='myProductCart.jsp';
}	
function jjimCart()  {
	 window.location.href ='jjim_cart.jsp';
}
function reviewProduct()  {
	 window.location.href ='review_product.jsp';
}
function delete_btn(){
    alert('삭제 되었습니다.');
}