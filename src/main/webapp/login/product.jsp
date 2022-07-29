<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category_product</title>
<script src="../js/jquery-3.6.0.min.js"></script>
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
		
	var ctButton = document.getElementsByClassName("result1");
		$(ctButton).mouseenter(function(){
			ctButton.style.color = "red";
		});
		$(ctButton).mouseleave(function(){
			ctButton.style.color = "black";
		});
	});
	
	var check = true;
	$("#category").on("click",function(){
		if(check){
			$("#result1").show();
			check=false;
		}else{
			$("#result1").hide();			
			check=true;
		}
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
			<%=p %>의 추천상품
			</div>
		</div>
		<div id="function">
			<div id="wishlist">
			찜한 상품
			</div>
			<div id="recent">
			최근본상품
			</div>
			<div id="add">
			+상품올리기
			</div>
			여백
		</div>
	<div id="footer">
		&lt;1 2 3 4 5&gt;
	</div>
</div>
</body>
</html>