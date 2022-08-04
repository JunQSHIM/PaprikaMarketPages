<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-ui.min.js"></script>


<meta charset="UTF-8">
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
<!-- 네비바 상단고정  -->
$(document).ready(function() {
	var jbOffset = $('.nav').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > jbOffset.top) {
			$('.nav').addClass('jbFixed');
		} else {
			$('.nav').removeClass('jbFixed');
		}
	});
}); <!-- 네비바 상단고정 -->

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
	
	function login() {
		window.location.href = 'login.jsp';
	}
	function register() {
		window.location.href = 'registerAgree.jsp';
	}
	function main() {
		window.location.href = 'mother.jsp';
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
			<%@include file="nav.jsp"%>


			<div class="grid_12 article">
				<%@include file="category.jsp"%>
				<%@include file="slider.jsp"%>

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

		<%@include file="ban.jsp"%>
		<!-- chat -->
		<div class="ui-dialog" id="chatting">
			<iframe src="chatpage.jsp"></iframe>
		</div>

	<%@include file="mothertop.jsp"%>
	
	<%@include file="slider.jsp"%>
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
	
	<%@include file="motherbottom.jsp"%>
</body>
</html>