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
		        controls:false,
		        auto: true, 
		        mode:'horizontal',
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
</script>
</head>
<body>
<div class="container">
<%@include file="../parts/header.jsp"%>
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
				<div class="slider">
    			<div><img src="./images/slider1.jpg"></div>
    			<div><img src="./images/slider2.jpg"></div>
    			<div><img src="./images/slider3.jpg"></div>
    			</div>
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
			<font color="red"><%=p %></font>의 추천상품
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
		<div>
		</div>
	<div id="footer" style="float: bottom;">
	<%@include file="../parts/footer.jsp" %>
</div>
</body>
</html>