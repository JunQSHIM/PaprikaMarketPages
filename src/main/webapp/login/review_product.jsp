<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-ui.min.js"></script>
<title>my store Page</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="review_product.css">
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
%>
<script>
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
</script>
</head>
<body>
<div class="container">
<%@include file="header.jsp"%>
	
	<div class="search">
			<div class="logo"><img src="images/pklogo.png" onclick="main()"></div>
	
	
	<div class="search_bar">
		<div class="search_text" >
			<input type="text" placeholder="상품명, 지역명, @상점명 입력"><a>검색</a>
		</div>
	</div>
	<div class="header_list">
	<button class="chat" ><img src="./images/chatting.png" width="23" height="24">파프리카톡</button>
	<a class="mystore" href="myProductCart.jsp"><img src="./images/mystore.png" width="23" height="24">내상점</a>
	<a class="sell_btn"><img src="./images/sell_list.png" width="23" height="24">판매하기</a>
	</div>
	</div>
	<hr class="mainLine">
		<div id="category_btn">
			<button id="showCategory"><img src="images/category_button.png"></button>
		</div>
		<div id="product">
			<div id="category">
			<div id="categories">
			<form action="product.jsp" name="category">
			<ul id="result1">
				<li><button onclick="ctProduct()" name="product" value="디지털기기"><img src="images/ct_icon/digital.png"/>디지털기기/가전</button>
				<li><button onclick="ctProduct()" name="product" value="가구/인테리어"><img src="images/ct_icon/interior.png"/>가구/인테리어</button>
				<li><button onclick="ctProduct()" name="product" value="유아동/유아도서"><img src="images/ct_icon/baby.png"/>유아동/유아도서</button>
				<li><button onclick="ctProduct()" name="product" value="생활/가공식품"><img src="images/ct_icon/life.png"/>생활/가공식품</button>
				<li><button onclick="ctProduct()" name="product" value="스포츠/레저"><img src="images/ct_icon/sport.png"/>스포츠/레저</button>
				<li><button onclick="ctProduct()" name="product" value="여성잡화"><img src="images/ct_icon/waccessories.png"/>여성잡화</button>
				<li><button onclick="ctProduct()" name="product" value="여성의류"><img src="images/ct_icon/wclothes.png"/>여성의류</button>
				<li><button onclick="ctProduct()" name="product" value="남성패션/잡화"><img src="images/ct_icon/mclothes.png"/>남성패션/잡화</button>
				<li><button onclick="ctProduct()" name="product" value="게임/취미"><img src="images/ct_icon/game.png"/>게임/취미</button>
				<li><button onclick="ctProduct()" name="product" value="뷰티/미용"><img src="images/ct_icon/beauty.png"/>뷰티/미용</button>
				<li><button onclick="ctProduct()" name="product" value="반려동물용품"><img src="images/ct_icon/pet.png"/>반려동물용품</button>
				<li><button onclick="ctProduct()" name="product" value="도서/티켓/음반"><img src="images/ct_icon/ticket.png"/>도서/티켓/음반</button>
				<li><button onclick="ctProduct()" name="product" value="기타 중고물품"><img src="images/ct_icon/etc.png"/>기타 중고물품</button>
				<li><button onclick="ctProduct()" name="product" value="삽니다"><img src="images/ct_icon/buyproduct.png"/>삽니다</button>
			</ul>
			</form>
			</div>
			</div>
			  
			<div class="productPage">
			<div class="favorite_body">
				<div class="jjim_list">
					<div class="jjim_list_1">
					 	<a class="sell_product"  href="myProductCart.jsp">상품 <span class="sell_product_span">3</span></a>
					 	<a class="review_product">상품후기 <span class="review_product_span">5</span></a>
					 	<a class="jjim_product"  href="jjim_cart.jsp">찜 <span class="jjim_product_span">2</span></a>
					 </div>
				</div>
			</div>
			<div class="jjim_list_2">
				<div class="jjim_list_3">
					<div class=jjim_list_4>
						<div>
							상점후기
							<span class="jjim_list_4_span">5</span>
						</div>
				</div>
				<div class="review_board">
				<div class="none">
					<div class="review_1">
						<a class="other_store" href="#">
							<img src="./images/jjim_icon/store.svg" width="60" height="60" alt="리뷰어 이미지">
						</a>
						<div class="review_board">
							<div class="reviewer_title">
								<div class="reviewer_name">
									<a class="reviewer_name_1">
										준귀염둥이규
									</a>
									<div class="review_date">2주 전</div>
								</div>
								<a class="review_scores" href="#">
									<div class="review_score">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
									</div>
								</a>
							</div>
							<a class="purchase_product" href="#">
								<button class="purchase_name">트레비스 스캇 x 나이키 (정품)
								<img src="./images/jjim_icon/arrow2.png" width="6" height="10" alt="화살표">
								</button>
							</a>
							<div class="review_content">잘 신겠습니다. 감사합니다.</div>
							<div class="report_body">
								<a class="report_btn">
									<img src="./images/jjim_icon/report.png" width="14" height="14" alt="신고하기">
									신고하기
								</a>
							</div>
						</div>
					</div>
					</div>
					<div class="none">
					<div class="review_1">
						<a class="other_store" href="#">
							<img src="./images/jjim_icon/store.svg" width="60" height="60" alt="리뷰어 이미지">
						</a>
						<div class="review_board">
							<div class="reviewer_title">
								<div class="reviewer_name">
									<a class="reviewer_name_1">
										임스응태액
									</a>
									<div class="review_date">3주 전</div>
								</div>
								<a class="review_scores" href="#">
									<div class="review_score">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
									</div>
								</a>
							</div>
							<a class="purchase_product" href="#">
								<button class="purchase_name">레고 21336 오피스 아이디어 팝니다.
								<img src="./images/jjim_icon/arrow2.png" width="6" height="10" alt="화살표">
								</button>
							</a>
							<div class="review_content">TEST 리뷰 작성입니다!!!</div>
							<div class="report_body">
								<a class="report_btn">
									<img src="./images/jjim_icon/report.png" width="14" height="14" alt="신고하기">
									신고하기
								</a>
							</div>
						</div>
					</div>
					</div>
					<div class="none">
						<div class="review_1">
						<a class="other_store" href="#">
							<img src="./images/jjim_icon/store.svg" width="60" height="60" alt="리뷰어 이미지">
						</a>
						<div class="review_board">
							<div class="reviewer_title">
								<div class="reviewer_name">
									<a class="reviewer_name_1">
										준귀염둥이규
									</a>
									<div class="review_date">2주 전</div>
								</div>
								<a class="review_scores" href="#">
									<div class="review_score">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
									</div>
								</a>
							</div>
							<a class="purchase_product" href="#">
								<button class="purchase_name">트레비스 스캇 x 나이키 (정품)
								<img src="./images/jjim_icon/arrow2.png" width="6" height="10" alt="화살표">
								</button>
							</a>
							<div class="review_content">잘 신겠습니다. 감사합니다.</div>
							<div class="report_body">
								<a class="report_btn">
									<img src="./images/jjim_icon/report.png" width="14" height="14" alt="신고하기">
									신고하기
								</a>
							</div>
						</div>
					</div>
					</div>
					<div class="none">
						<div class="review_1">
						<a class="other_store" href="#">
							<img src="./images/jjim_icon/store.svg" width="60" height="60" alt="리뷰어 이미지">
						</a>
						<div class="review_board">
							<div class="reviewer_title">
								<div class="reviewer_name">
									<a class="reviewer_name_1">
										준귀염둥이규
									</a>
									<div class="review_date">2주 전</div>
								</div>
								<a class="review_scores" href="#">
									<div class="review_score">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
									</div>
								</a>
							</div>
							<a class="purchase_product" href="#">
								<button class="purchase_name">트레비스 스캇 x 나이키 (정품)
								<img src="./images/jjim_icon/arrow2.png" width="6" height="10" alt="화살표">
								</button>
							</a>
							<div class="review_content">잘 신겠습니다. 감사합니다.</div>
							<div class="report_body">
								<a class="report_btn">
									<img src="./images/jjim_icon/report.png" width="14" height="14" alt="신고하기">
									신고하기
								</a>
							</div>
						</div>
					</div>
					</div>
					<div class="none">
						<div class="review_1">
						<a class="other_store" href="#">
							<img src="./images/jjim_icon/store.svg" width="60" height="60" alt="리뷰어 이미지">
						</a>
						<div class="review_board">
							<div class="reviewer_title">
								<div class="reviewer_name">
									<a class="reviewer_name_1">
										준귀염둥이규
									</a>
									<div class="review_date">2주 전</div>
								</div>
								<a class="review_scores" href="#">
									<div class="review_score">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="./images/jjim_icon/score.png" width="15" height="14" alt="별">
									</div>
								</a>
							</div>
							<a class="purchase_product" href="#">
								<button class="purchase_name">트레비스 스캇 x 나이키 (정품)
								<img src="./images/jjim_icon/arrow2.png" width="6" height="10" alt="화살표">
								</button>
							</a>
							<div class="review_content">잘 신겠습니다. 감사합니다.</div>
							<div class="report_body">
								<a class="report_btn">
									<img src="./images/jjim_icon/report.png" width="14" height="14" alt="신고하기">
									신고하기
								</a>
							</div>
						</div>
					</div>
					</div>
				</div>
				<div class="more_review">
					<button class="more_review_btn">
						<div class="more_review_text">
							상점후기 더보기
						</div>
					</button>
				</div>
		
			</div>
			</div>
			
 			</div>
 			
			</div>
			<footer>
				<%@include file="footer.jsp" %>
			</footer>
			
			
		</div>
		
		
		<div class="function">
			<div class="wishlist">
			찜한 상품<br>
			<a href="jjim_cart.jsp"> ♥ 2</a>
			</div>
			<div class="recent">
			최근본상품<br>
			........<br>
			<span class="recent_product">최근 본 상품<br>이<br> 없습니다.</span>
			</div>
		<div class="top" style="cursor: pointer"><div class="top_btn">TOP</div></div>
		</div>
		
<!-- chat -->
<div class="ui-dialog" id="chatting">
		<iframe src="chatpage.jsp"></iframe>
	</div>
</body>
</html>