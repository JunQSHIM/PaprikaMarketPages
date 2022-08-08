<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-ui.min.js"></script>
<title>jjim Page</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./jjim_cart_css/jjim_cart.css">
<script type="text/javascript" src="./jjim_cart_js/jjim_cart.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
%>
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
					 	<a class="sell_product" href="myProductCart.jsp">상품 <span class="sell_product_span">3</span></a>
					 	<a class="review_product" href="review_product.jsp">상품후기 <span class="review_product_span">5</span></a>
					 	<a class="jjim_product" >찜 <span class="jjim_product_span">2</span></a>
					 </div>
				</div>
			</div>
			<div class="jjim_list_2">
				<div class="jjim_list_3">
					<div class=jjim_list_4>
						<div>
							찜
							<span class="jjim_list_4_span">1</span>
						</div>
					</div>
					
				</div>
				<div>
				<div class="jjim_board">
					<div class="jjim_delete">
						<div class="jjim_delete_1">
							<div>
							<input type="checkbox" id="jjim_delete_btn">
							</div>
							<div>
							<button class="select_delete_btn" disabled="disabled" onclick="delete_btn()">선택삭제</button>
							</div>
						</div>
						<div class="array">
							<a class="select_array">
								최신순
							</a>
							<a class="non_select_array">
								인기순
							</a>
							<a class="non_select_array">
								저가순
							</a>
							<a class="non_select_array">
								고가순
							</a>
							
						</div>
					</div>
						
					</div>
				<div class="jjim_board_body">
					<div class="jjim_board_list">
						<a class="jjim_board_article" href="#">
							<div class="article_select">
								<input type="checkbox"  class="article_select1">
								
							</div>
						<div class="jjim_image">
							<img src="./images/jjim_icon/travis.png" alt="상품 이미지">
							<div class="delivery_charge">배송비 포함</div>
							<div class="inner_jjim_image"></div>
						</div>
					<div class="jjim_detail">
							<div class="jjim_detail_1">
								<div class="jjim_title">에어 조던 1 로우 OG SP 트래비스 스캇 프라그먼트 밀리터리 블루</div>
								<div class="jjim_price">
									<div>
										17,000
									</div>
								</div>
								<div class="jjim_day">4일 전</div>
							</div>
						<div class="jjim_location">
							<img src="./images/jjim_icon/location.png" width="15" height="17" alt="위치 아이콘">
							서울특별시 성북구 석관동
						</div>
					</div>
					</a>
					</div>
					
										<div class="jjim_board_list">
						<a class="jjim_board_article" href="#">
							<div class="article_select">
								<input type="checkbox" class="article_select1">
								
							</div>
						<div class="jjim_image">
							<img src="./images/jjim_icon/travis.png" alt="상품 이미지">
							<div class="delivery_charge">배송비 포함</div>
							<div class="inner_jjim_image"></div>
						</div>
					<div class="jjim_detail">
							<div class="jjim_detail_1">
								<div class="jjim_title">에어 조던 1 로우 OG SP 트래비스 스캇 프라그먼트 밀리터리 블루</div>
								<div class="jjim_price">
									<div>
										17,000
									</div>
								</div>
								<div class="jjim_day">4일 전</div>
							</div>
						<div class="jjim_location">
							<img src="./images/jjim_icon/location.png" width="15" height="17" alt="위치 아이콘">
							서울특별시 성북구 석관동
						</div>
					</div>
					</a>
					</div>
				</div>
			</div>
			</div>
			
 			</div>
			</div>
			
			<div id="footer_page">
			<footer>
				<%@include file="footer.jsp" %>
			</footer>
		</div>
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