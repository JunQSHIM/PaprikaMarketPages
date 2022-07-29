<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<title>Main Page</title>
<link href="jjim_cart.css" rel="stylesheet" type="text/css">
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
		
		$(".aa").mouseover(function(){
			$(this).css("background","gray");
			
		})
		.mouseout(function(){
			$(this).css("background","#f5f5f0");
			
		});
		$(".list1 thead input:checkbox[id=check]").click(function(){
			var bool =$(this).prop("checked");
			$(".list1 tbody input:checkbox[name=checkbox]").prop("checked", bool);
		});
		$(".list1 tbody input:checkbox[name=checkbox]").click(function(){
			var flag = false;
			$(".list1 tbody input:checkbox[name=checkbox]").each(function(){
				var bool = $(this).prop("checked");
				
				if(!bool){
					$(".list1 thead input:checkbox[id=check]").prop("checked",false);
					flag = true;
					return false;
				}
			});
			if(!flag){
				$(".list1 thead input:checkbox[id=check]").prop("checked",true);
			}
		
		});
		
		// TOP 버튼 누르면 페이지 맨 위로 가는 스크립트
		$("#top").click(function() {
			//$('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
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
<div class="app">
<a href="app_download.jsp" id="app_download"><img src="./images/app_logo.svg">앱 다운로드</a>
&nbsp;&nbsp;&nbsp;<span onclick="alert('Ctrl+D 키를 누르면 즐겨찾기에 추가하실 수 있습니다.')" id="favorite">
<img src="./images/favorite.svg"> 즐겨찾기</span></div>
<c:choose>
<c:when test="${param.id ne null }"><button type="button" onclick="logout()">로그아웃</button><button type="button" onclick="mypage()">마이페이지</button></c:when>
<c:otherwise><button type="button" onclick="login()">로그인</button><button type="button" onclick="register()">회원가입</button></c:otherwise>
</c:choose>
</div>
	<img src="images/pklogo.png" onclick="main()">
	<div id="search">
		<input onkeyup="mySend(this)" type="search" id="value" placeholder="상품명, 지역명, @상점명 입력"><button id="icon"><img src="./images/search.png" width="20px" height="20px"></button>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
		<a href="#"> <img src="./images/sell_list.png" class="search_list"> 판매하기   </a><span>|</span><a href="#"> <img src="./images/mystore.png" class="search_list"> 내상점   </a><span>|</span><a href="#"> <img src="./images/chatting.png"  class="search_list"> 파프리카톡 </a>
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
		<div class="jjimBody">
		<div id="frame">
		<form>
			
		</form>
		
	<div>
		<table class="list1">
			<tr>
				<th class="aa" width="100px" >상품 0</th>
				<th class="aa" width="100px">상점후기 0</th>
				<th class="aa" width="100px">찜 2</th>
				<th class="aa" width="100px">팔로잉 0</th>
				<th class="aa" width="100px">팔로워 0</th>
			</tr>
		</table>
	</div>
	<br>
	<div id="frame2">
				 <span style="font-size: 16pt; font-weight: bold;">찜 1</span>
			</div>
			<div>
			
			</div>
	<br>
	
	<div class="btns">
		<table class="list1">
		<thead>
			<tr>
				<th colspan="10" style="text-align: left; padding-right: 10px;">찜한 상품(2)<div id="array"><a href="#">최신순</a> | <a href="#">인기순</a> | <a href="#">고가순</a> | <a href="#">저가순</a></div>
				<div class="clear"></div></th>
			</tr>
			<tr>
			<th><input type="checkbox" name="checkbox" id="check"></th>
			<th><span>이미지</span></th>
			<th style="width: 550px;"><span>상품정보</span></th>
			<th>판매가</th>
			</tr>
		</thead>
		
		<tbody class="list2">
			<tr class="img1">
				<td style="text-align: left; text-align: center; border-right: none;">
					<input type="checkbox" name="checkbox" class="checkbox">
				</td>
				<td style="border-left: none; border-right: none;"><img style="max-width:200px;" src="images/jjim_icon/travis.png"></td>
				<td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">트래비스 스캇 프라그먼트 조던 1 로우 DM7866-140</td>
				<td><span style="padding-left: 10px;">98,000원</span></td>
			</tr>
			<tr class="img1">
				<td style="text-align: left; text-align: center; border-right: none;">
					<input type="checkbox" name="checkbox" class="checkbox">
				</td>
				<td style="border-left: none; border-right: none;" ><img style="max-width:200px;" src="images/jjim_icon/santiago.png"></td>
				<td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">레알 마드리드 - 산티아고 베르나베우 스타디움</td>
				<td><span style="padding-left: 10px;">300,000원</span></td>
			</tr>
		</tbody>
		</table>
		<div style="margin: 10px 0;" id="btns">
			<span style="margin: 0 10px;" class="btnfloat">선택 상품을</span>
			<button class="btn default btnfloat" id="btn1" disabled="disabled" style="background-color: gray; color: #fff;" onclick="alert('삭제 되었습니다.')">x 삭제하기</button>&nbsp;
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
	<div id="footer">
		&lt;1 2 3 4 5&gt;
	</div>
</div>
</body>
</html>