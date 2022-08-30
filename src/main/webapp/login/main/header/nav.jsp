<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<!-- <script src="/myweb/login/main/header/js/nav.js"></script> -->
<link rel="stylesheet" type="text/css" href="/myweb/login/main/header/css/nav.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/css/grid.css">
<script src="/myweb/login/main/header/js/nav.js"></script>
<head> 
<meta charset="UTF-8">
<title>nav</title>
</head>
<body>
	<div class="grid_12 nav">
		<div class="grid_12 nafix">
			<div class="grid_4 loca">
				<div class="row category_btn">
					<button id="showCategory">
						<div class="cb">
							<img src="/myweb/login/images/category_button.png">
						</div>
					</button>
				</div>
				<div class="grid_2 logo">
					<img src="/myweb/login/images/dklogo.png" width="120%" onclick="main()">
				</div>


			</div>
			<div class="grid_6 search">
				<div class="search_text">
					<input type="text" placeholder="상품명, 지역명, @상점명 입력"><a>검색</a>
				</div>
			</div>
			<div class="row grid_4 bts">

				<div class="nav_btn">
					<a class="sell_btn" href="/myweb/login/sell.jsp">
						<div class="btn_img">
							<img src="/myweb/login/images/sell_list.png" width="23" height="24">
						</div>
						<div class="btn_words">판매하기</div>
					</a>
				</div>
				<div class="nav_btn_1">
					<a class="mystore" href="/myweb/login/myProductCart.jsp">
						<div class="btn_img">
							<img src="/myweb/login/images/mystore.png" width="23" height="24">
						</div>
						<div class="btn_words">상 점</div>
					</a>
				</div>
				<div class="nav_btn">
					<a class="chat" href="/myweb/login/chatpage.jsp">
						<div class="btn_img">
							<img src="/myweb/login/images/chatting.png" width="23" height="24">
						</div>
						<div class="btn_words">파프리카톡</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="grid_12 fakenav"></div>

	<div class="grid_12">
		<hr id="mainLine">
	</div>

</body>
</html>