<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category_product</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="ctProduct.css">
<link rel="stylesheet" type="text/css" href="product_detail.css">
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String p = request.getParameter("product");
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
		
		$("#top").click(function() {
			//$('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
		});
	});
	$(document).ready(function(){
		$('.slider').bxSlider({
		        auto: true, 
		        mode:'horizontal',
		        minSlides: 1,
		        maxSlides: 5,
		        slideWidth: 155,
		        slideMargin: 0,
		        captions:true
	    });
		$('.slider2').bxSlider({
	        auto: true, 
	        mode:'horizontal',
	        minSlides: 1,
	        maxSlides: 2,
	        slideWidth: 130,
	        slideMargin: 5,
	        captions:true
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
	function zoom(){
		$("#picture").style.width = "800px";
	}
	function zoom(url){
		var image = document.getElementById("image");
		var source = image.src;
	    window.open(source,'new','width=800, height=600, scrollbars=yes');
	}
	var checkStatus = true;
	$(function () {
		let num = 0;
		let imageName = ["check.png", "uncheck.png"];
		$("#jjim").click(function() {
			if(num == 1){
				$("#status").attr("src","images/"+ imageName[num]);
				$("#status").fadeIn(1200);
				$("#status").fadeOut(2000);
				num=0;
			}else{
				$("#status").attr("src","images/"+ imageName[num]);
				$("#status").fadeIn(1200);
				$("#status").fadeOut(2000);
				num++;	
			}
		});
	});	
</script>
</head>
<body>
<div class="container">
<%@include file="header.jsp"%>
<img src="images/pklogo.png" onclick="main()">
<div id="search">
<input onkeyup="mySend(this)" type="search" id="value" placeholder="상품명, 지역명, @상점명 입력"><button id="icon"><img src="./images/search.png" width="20px" height="20px"></button>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
		<a href="#"> <img src="./images/sell_list.png" class="search_list"> 판매하기</a>
		<span>|</span>
		<a href="#"> <img src="./images/mystore.png" class="search_list"> 내상점</a>
		<span>|</span>
		<a href="chatpage.jsp"> <img src="./images/chatting.png" class="search_list"> 파프리카톡 </a>	<div id="category_btn">
		<button id="showCategory" ><img src="images/category_button.png"></button>
	</div>
	</div>
	<hr id="mainLine">
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
			<div id="productPage">
			<div id="productList">
			홈 > 
			<select onchange="if(this.value) location.href=(this.value);">
				<option selected disabled>카테고리</option>
				<option value="product.jsp?product=디지털기기">디지털기기</option>
				<option value="product.jsp?product=생활가전">생활가전</option>
				<option value="product.jsp?product=가구/인테리어">가구/인테리어</option>
				<option value="product.jsp?product=유아동">유아동</option>
				<option value="product.jsp?product=유아도서">유아도서</option>
				<option value="product.jsp?product=생활/가공식품">생활/가공식품</option>
				<option value="product.jsp?product=스포츠/레저">스포츠/레저</option>
				<option value="product.jsp?product=여성잡화">여성잡화</option>
				<option value="product.jsp?product=여성의류">여성의류</option>
				<option value="product.jsp?product=남성패션/잡화">남성패션/잡화</option>
				<option value="product.jsp?product=게임/취미">게임/취미</option>
				<option value="product.jsp?product=뷰티/미용">뷰티/미용</option>
				<option value="product.jsp?product=반려동물용품">반려동물용품</option>
				<option value="product.jsp?product=도서/티켓/음반">도서/티켓/음반</option>
				<option value="product.jsp?product=식물">식물</option>
				<option value="product.jsp?product=기타 중고물품">기타 중고물품</option>
				<option value="product.jsp?product=삽니다">삽니다</option>
			</select>
			</div>
			<div class="container1">
				<div class="item" id="picture" onclick = "zoom()">
					<img src="images/camera.png" id="image">
					<button>+확대</button>
				</div>
				<div class="container2">
					<div class="item" id="detail">
						<div id="title">디지털 카메라<br>100000원<br></div>
						<hr style="border: 0.3px solid lightgray;">
					</div>
					<div class="item">
					<button>♥36</button> | <button>⊙70</button> | <button>⏲5일전</button> | <button>신고하기</button><br>
						<div id="info">
							<ul>
								<li>상품상태</li>
								<li>교환여부</li>
								<li>배송비</li>
								<li>거래지역</li>
							</ul>
						</div>
					</div>
					<div class="item">
						<div id="info_ans">
							<ul>
								<li>중고</li>
								<li>교환불가능</li>
								<li>배송비포함</li>
								<li>전국</li>
							</ul>
						</div>
					</div>
					<div class="item" id="func">
						<button id="jjim">찜</button>
						<button>연락하기</button>
						<button>바로구매</button>
					</div>
					<div><img id="status"></div>
				</div>
				<div class="item2">
					연관상품
					<div id="rt_product">
    					<div class="slider">
    					<div><img src="./images/1.png" title="1st"></div>
    					<div><img src="./images/2.png" title="2nd"></div>
    					<div><img src="./images/3.png" title="3rd"></div>
    					<div><img src="./images/4.png" title="4th"></div>
    					<div><img src="./images/5.png" title="5th"></div>
    					<div><img src="./images/5.png" title="1st"></div>
    					<div><img src="./images/4.png" title="1st"></div>
    					<div><img src="./images/3.png" title="1st"></div>
    					<div><img src="./images/2.png" title="1st"></div>
    					<div><img src="./images/1.png" title="1st"></div>
						</div>
				</div>
				<hr style="border:2px solid gray;">
				<div class="container3">
					<div class="container2">
						<div class="item" id="product_info">상품정보<hr style="border:1px solid gray;">
							<div id="product_desc">
								소니가 1985년에 발매한 최초의 핸디캠 캠코더입니다.
								SONY CCD-M8로 구글에 치면 자세한 정보가 나옵니다.
								80년대 일본을 상징하는 물건이기도 합니다.
								희소가치가 워크맨 급입니다.
								워크맨처럼 각이 져있다는점이 특징입니다.
								오래되었기때문에 소품용, 수집용으로 권장합니다.
								배터리는 방전되었기에 작동여부를 알수 없습니다.
								관심있으신분은 문자주세요.<br>
								제조: 1985, 일본
							</div>
						</div>
					</div>
					<div class="container4">
						<div class="item">상점정보<hr style="border:1px solid gray;">
							<div id="profile_pic">
								<img src="images/dklogo.png">
							</div>
							<div id="nickname">
								생각하는 연못
							</div>
							<div id="follow">
								<button>팔로우</button>
								<button onclick="location.href='myProductCart.jsp'">상점가기</button>
							</div>
							<div id="rt_img">
								<div class="slider2">
    								<div><img src="./images/test1.png" title="1st"></div>
    								<div><img src="./images/test2.png" title="2nd"></div>
    								<div><img src="./images/test3.png" title="3rd"></div>    								
    								<div><img src="./images/test4.png" title="4th"></div>
    								<div><img src="./images/test5.png" title="5th"></div>    								    								
								</div>
						</div>
						<div class="item">후기<hr style="border:1px solid gray;">
							<div class="review_container">
								sook315 ★★★★★
								<div style="background-color: rgb(0,0,0,0.08)">큘거래 감사합니다 유용하게 잘 쓰겠습니다</div>
							</div>
								<hr style="border: 1px solid rgb(0,0,0,0.07);">
							<div class="review_container">
								상점921호 ★★★★☆
								<div style="background-color: rgb(0,0,0,0.08)">어차피 수십년전 제품들이라 재생만이라도 잘 되면 좋은데 재생잘되요</div>
							</div>
							<div id="more_reivews"><button>후기더보기</button></div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		</div>
		<div id="function">
			<div id="wishlist">
			찜한 상품<br>
			<a href="jjim_cart.jsp"> ♥ 2</a>
			</div>
			<div id="recent">
			최근본상품<br>
			........<br>
			<span class="recent_product">최근 본 상품<br>이<br> 없습니다.</span>
			</div>
			<div id="add">
			앱 다운로드<br>
			<img src="./images/jjim_icon/qr_code.png" width="70px" height="70px">
			</div>
		<div id="top" style="cursor: pointer">TOP</div>
		</div>
	<div id="footer" style="float: bottom;">
	<%@include file="footer.jsp" %>
	</div>
</div>
</div>
</body>
</html>