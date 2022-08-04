<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-ui.min.js"></script>

<title>Mother</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="grid1.css">
<link rel="stylesheet" type="text/css" href="main1.css">
<link rel="stylesheet" type="text/css" href="prods.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
%>
<script>
	function ctProduct() {
		theForm.submit();
	}
	$(document).ready(function() {
		$("#showCategory").mouseenter(function() {
			$("#result1").show();
		});
		$("#category").mouseleave(function() {
			$("#result1").hide();
		});
		// TOP 버튼 누르면 페이지 맨 위로 가는 스크립트
		$(".top").click(function() {
			//$('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
		});
	});

	// 슬라이드 배너 ==> 이동시키는 버튼이 있으면 카테고리에 마우스 올렸을때
	// 그 버튼만 보여서 버튼을 없애고 오토 슬라이드로 변경했습니다(준규)
	// 버튼가리는거를 찾아보다가 못찾았어여...
	$(document).ready(function() {
		$('.slider').bxSlider({
			controls : false,
			auto : true,
			mode : 'horizontal',
		});
	});

	//chat
	$(function() {
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

	function login() {
		window.location.href = 'login.jsp';
	}
	function register() {
		window.location.href = 'registerAgree.jsp';
	}
	function main() {
		window.location.href = 'main.jsp';
	}
	function mypage() {
		window.location.href = 'mypage.jsp';
	}
</script>
</head>
<body>
	<div class="row wrap">

		<div class="grid_2 ad"></div>
		<div class="container_12">
			<%@include file="header.jsp"%>

			<div class="grid_12 nav">
				<div class="nafix">
					<div class="grid_3 loca">
						<div class="grid_3 logo">
							<img src="images/pklogo.png" onclick="main()">
						</div>

						<div class="category_btn">
							<button id="showCategory">
								<img src="images/category_button.png">
							</button>
						</div>

					</div>
					<div class="grid_5 search">
						<div class="search_text">
							<input type="text" placeholder="상품명, 지역명, @상점명 입력"><a>검색</a>
						</div>
					</div>
					<div class="grid_4 bts">
						<div class="row grid_4 bts">

							<div class="nav_btn">
								<a class="mystore" href="myProductCart.jsp"> <img
									src="./images/mystore.png" width="23" height="24">상점
								</a>
							</div>
							<div class="nav_btn">
								<button class="chat">
									<img src="./images/chatting.png" width="23" height="24">파프리톡
								</button>
							</div>
							<div class="nav_btn">
								<a class="sell_btn"><img src="./images/sell_list.png"
									width="23" height="24">판매하기</a>
							</div>

						</div>


					</div>
				</div>
			</div>

			<div class="grid_12 fakenav"></div>

			<div class="grid_12">
				<hr id="mainLine">
			</div>

			<div class="grid_12 article">
				<div id="category">
					<div id="categories">
						<form action="product.jsp" name="category">
							<ul id="result1">
								<li><button onclick="ctProduct()" name="product"
										value="디지털기기">
										<img src="images/ct_icon/digital.png" />디지털기기/가전
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="가구/인테리어">
										<img src="images/ct_icon/interior.png" />가구/인테리어
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="유아동/유아도서">
										<img src="images/ct_icon/baby.png" />유아동/유아도서
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="생활/가공식품">
										<img src="images/ct_icon/life.png" />생활/가공식품
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="스포츠/레저">
										<img src="images/ct_icon/sport.png" />스포츠/레저
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="여성잡화">
										<img src="images/ct_icon/waccessories.png" />여성잡화
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="여성의류">
										<img src="images/ct_icon/wclothes.png" />여성의류
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="남성패션/잡화">
										<img src="images/ct_icon/mclothes.png" />남성패션/잡화
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="게임/취미">
										<img src="images/ct_icon/game.png" />게임/취미
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="뷰티/미용">
										<img src="images/ct_icon/beauty.png" />뷰티/미용
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="반려동물용품">
										<img src="images/ct_icon/pet.png" />반려동물용품
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="도서/티켓/음반">
										<img src="images/ct_icon/ticket.png" />도서/티켓/음반
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="기타 중고물품">
										<img src="images/ct_icon/etc.png" />기타 중고물품
									</button>
								<li><button onclick="ctProduct()" name="product"
										value="삽니다">
										<img src="images/ct_icon/buyproduct.png" />삽니다
									</button>
							</ul>
						</form>
					</div>
				</div>
				<div class="productPage">
					<div class="slider">
						<div>
							<img src="./images/slider1.jpg">
						</div>
						<div>
							<img src="./images/slider2.jpg">
						</div>
						<div>
							<img src="./images/slider3.jpg">
						</div>
					</div>
				</div>

				<div class="products">
					<%
					for (int i = 0; i < 20; i++) {
					%>

					<a href="prodpage.jsp">

						<div class="row grid_3 products">
							<div class="pic"></div>
							<div class="text">
								<div class="title">
									<h3>상품명 : 선풍기</h3>
								</div>
								<div class="location">지역 : 부천시</div>
								<div class="price">가격 : 0000원</div>
								<div class="time">3분전</div>
								<div class="wish">♡ 1</div>
							</div>
						</div>

					</a>

					<%
					}
					%>
				</div>
 

 

				<%@include file="footer1.jsp"%>


			</div>



		</div>
		<div class="grid_2 ban">
			<div class="banner">
				<div class="wishlist">
					찜한 상품<br> <a href="jjim_cart.jsp"> ♥ 2</a>
				</div>
				<div class="recent">
					최근본상품<br> ........<br> <span class="recent_product">최근
						본 상품<br>이<br> 없습니다.
					</span>
				</div>
				<div class="add">
					앱 다운로드<br> <img src="./images/jjim_icon/qr_code.png"
						width="70px" height="70px">
				</div>
				<div class="top" style="cursor: pointer">TOP</div>
			</div>


		</div>
		<!-- chat -->
		<div class="ui-dialog" id="chatting">
			<iframe src="chatpage.jsp"></iframe>
		</div>
	</div>

</body>
</html>