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
		
		$(".product_category_1").mouseenter(function(){
			$(".product_category_3").show();
		});
		$(".product_category_1").mouseleave(function(){
			$(".product_category_3").hide();
		});
		
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
	// 상품후기 더보기 
$(function(){
	$(".none").slice(0, 2).show(); // 최초 2개 선택
	$(".more_review").click(function(e){ // .more_review를 위한 클릭 이벤트e
	e.preventDefault();
	if($(".none:hidden").length == 0){ // 숨겨진 .more_review가 있는지 체크
		alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
	}
	$(".none:hidden").slice(0, 2).show(); // 숨김 설정된 다음 2개를 선택하여 표시
	});
	});