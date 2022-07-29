<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.6.0.min.js"></script>
<title>Main Page</title>
<link rel="stylesheet" type="text/css" href="main.css">
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
	
	});
	
function login()  {
	 window.location.href ='login.jsp';
}	
function register()  {
	 window.location.href ='register.jsp';
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
<div class="header">
<c:choose>
<c:when test="${param.id ne null }"><button type="button" onclick="logout()">로그아웃</button><button type="button" onclick="mypage()">마이페이지</button></c:when>
<c:otherwise><button type="button" onclick="login()">로그인</button><button type="button" onclick="register()">회원가입</button></c:otherwise>
</c:choose>
</div>
	<img src="images/pklogo.png" onclick="main()">
	<div id="search">
		<input type="text" name="search" placeholder="상품명검색">
	<div id="category_btn">
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
				상품들
				<br><a href="chatpage.jsp">dd</a>
				<br>aaa<br>aaa<br>aaa<br>aaa<br>aaa<br>aaa<br>aaa<br>aaa<br>aaa
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
			<img src="./images/qr_code.png" width="70px" height="70px">
			</div>
		<div id="top" style="cursor: pointer">TOP</div>
			
		</div>
	<div id="footer">
		&lt;1 2 3 4 5&gt;
	</div>
</div>
</body>
</html>